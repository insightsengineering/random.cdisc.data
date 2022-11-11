#' PK dataset
#'
#' @template ADSL_params
#' @param avalu (`string`)\cr Analysis value unit value
#' @param constants (`character vector`)\cr Constant parameters to be used in the PK
#' equation for creating analysis values.
#' @param duration (`numeric`)\cr Duration in number of days.
#' @inheritParams radsl
#'
#' @details One record per per study per subject per parameter per time point
#'
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' ADPC <- radpc(ADSL, seed = 2)
#' ADPC <- radpc(ADSL, seed = 2, duration = 3)
radpc <- function(ADSL, # nolint
                  avalu = "ug/mL",
                  constants = c(D = 100, ka = 0.8, ke = 1),
                  duration = 2,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(
                    AVAL = c(NA, 0.1)
                  ),
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadpc"))
  }

  checkmate::assert_data_frame(ADSL)
  checkmate::assert_character(avalu, len = 1, any.missing = FALSE)
  checkmate::assert_subset(names(constants), c("D", "ka", "ke"))
  checkmate::assert_numeric(x = duration, max.len = 1)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)
  checkmate::assert_list(na_vars)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  radpc_core <- function(day) {
    adpc_day <- tidyr::expand_grid( # nolint
      # nolint
      data.frame(
        STUDYID = ADSL$STUDYID,
        USUBJID = ADSL$USUBJID,
        ARMCD = ADSL$ARMCD,
        A0 = unname(constants["D"]),
        ka = unname(constants["ka"]) - stats::runif(length(ADSL$USUBJID), -0.2, 0.2),
        ke = unname(constants["ke"]) - stats::runif(length(ADSL$USUBJID), -0.2, 0.2)
      ),
      PCTPTNUM = if (day == 1) c(0, 0.5, 1, 1.5, 2, 3, 4, 8, 12) else 24 * (day - 1),
      PARAM = factor(c("Plasma Drug X", "Urine Drug X", "Plasma Drug Y", "Urine Drug Y"))
    )
    adpc_day <- adpc_day[!(grepl("Urine", adpc_day$PARAM) &
      adpc_day$PCTPTNUM %in% c(0.5, 1, 1.5, 2, 3)), ] %>%
      arrange(USUBJID, PARAM) %>%
      dplyr::mutate(
        VISITDY = day,
        VISIT = ifelse(day <= 7, paste("Day", .data$VISITDY), paste("Week", (.data$VISITDY - 1) / 7)),
        PCVOLU = ifelse(grepl("Urine", .data$PARAM), "mL", ""),
        ASMED = ifelse(grepl("Urine", .data$PARAM), "URINE", "PLASMA"),
        PCTPT = factor(dplyr::case_when(
          .data$PCTPTNUM == 0 ~ "Predose",
          (day == 1 & grepl("Urine", .data$PARAM)) ~
            paste0(lag(.data$PCTPTNUM), "H - ", .data$PCTPTNUM, "H"),
          (day != 1 & grepl("Urine", .data$PARAM)) ~
            paste0(as.numeric(.data$PCTPTNUM) - 24, "H - ", .data$PCTPTNUM, "H"),
          TRUE ~ paste0(.data$PCTPTNUM, "H")
        )),
        ARELTM1 = .data$PCTPTNUM,
        NRELTM1 = .data$PCTPTNUM,
        ARELTM2 = .data$ARELTM1 - (24 * (day - 1)),
        NRELTM2 = .data$NRELTM1 - (24 * (day - 1)),
        A0 = ifelse(.data$PARAM == "Plasma Drug Y", .data$A0, .data$A0 / 2),
        AVAL = round(
          (.data$A0 * .data$ka * (
            exp(-.data$ka * .data$ARELTM1) - exp(-.data$ke * .data$ARELTM1)
          ))
          / (.data$ke - .data$ka),
          digits = 3
        )
      ) %>%
      dplyr::mutate(
        PCVOL = ifelse(.data$ASMED == "URINE", round(abs(((.data$PCTPTNUM - 1) %% 24) *
          .data$A0 * ka * exp(.data$PCTPTNUM %% 1.8 / 10)), 2), NA),
        # PK Equation
        AVALC = ifelse(.data$AVAL == 0, "BLQ", as.character(.data$AVAL)),
        AVALU = avalu,
        RELTMU = "hr"
      ) %>%
      dplyr::select(-c(.data$A0, .data$ka, .data$ke))

    return(adpc_day)
  }

  ADPC <- list() # nolint

  for (day in seq(duration)[seq(duration) <= 7 | ((seq(duration) - 1) %% 7 == 0)]) {
    ADPC[[day]] <- radpc_core(day = day) # nolint
  }

  ADPC <- do.call(rbind, ADPC) # nolint

  ADPC <- ADSL %>% # nolint
    dplyr::inner_join(ADPC, by = c("STUDYID", "USUBJID", "ARMCD")) %>% # nolint
    dplyr::filter(.data$ACTARM != "B: Placebo", !(.data$ACTARM == "A: Drug X" & .data$PARAM == "Plasma Drug Y"))

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADPC <- mutate_na(ds = ADPC, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADPC <- apply_metadata(ADPC, "metadata/ADPC.yml") # nolint
}
