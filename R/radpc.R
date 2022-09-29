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
    ADPC_day <- tidyr::expand_grid( # nolint
      data.frame(
        STUDYID = ADSL$STUDYID,
        USUBJID = ADSL$USUBJID,
        ARMCD = ADSL$ARMCD,
        A0 = unname(constants["D"]),
        ka = unname(constants["ka"]) - stats::runif(length(ADSL$USUBJID), -0.2, 0.2),
        ke = unname(constants["ke"]) - stats::runif(length(ADSL$USUBJID), -0.2, 0.2)
      ),
      PARAM = c("Plasma Drug X", "Urine Drug X", "Plasma Drug Y", "Urine Drug Y"),
      PCTPTNUM = if (day == 1) c(0, 0.5, 1, 1.5, 2, 3, 4, 8, 12, 24) else 24 * day,
    )

    if (day == 1) {
      ADPC_day <- ADPC_day %>% filter(!(grepl("Urine", .$PARAM) & # nolint
        .$PCTPTNUM %in% c(0.5, 1, 1.5, 2, 3)))
    }

    ADPC_day <- ADPC_day %>% # nolint
      dplyr::mutate(
        VISITDY = day,
        VISIT = paste("Day", VISITDY),
        PCVOLU = ifelse(grepl("Urine", .$PARAM), "mL", ""),
        ASMED = ifelse(grepl("Urine", .$PARAM), "URINE", "PLASMA"),
        PCTPT = factor(dplyr::case_when(
          ADPC_day$PCTPTNUM == 0 ~ "Predose",
          (day == 1 & grepl("Urine", .$PARAM)) ~
            paste0(lag(.$PCTPTNUM), "H - ", .$PCTPTNUM, "H"),
          (day != 1 & grepl("Urine", .$PARAM)) ~
            paste0(as.numeric(.$PCTPTNUM) - 24, "H - ", .$PCTPTNUM, "H"),
          TRUE ~ paste0(ADPC_day$PCTPTNUM, "H")
        )),
        ARELTM1 = PCTPTNUM,
        NRELTM1 = PCTPTNUM,
        ARELTM2 = ARELTM1 - (24 * (day - 1)),
        NRELTM2 = NRELTM1 - (24 * (day - 1)),
        A0 = ifelse(grepl("Drug Y", .$PARAM), .$A0, .$A0 / 2),
        AVAL = round((A0 * ka * (
          exp(-ka * ARELTM1) - exp(-ke * ARELTM1)
        ))
        / (ke - ka),
        digits = 3
        )) %>%
      dplyr::mutate(
        PCVOL = ifelse(.$ASMED == "URINE", round(abs(((.$PCTPTNUM - 1) %% 24) *
                                                       .$A0 * ka * exp(.$PCTPTNUM %% 1.8 / 10)), 2), NA),
        # PK Equation
        AVALC = ifelse(.$AVAL == 0, "BLQ", as.character(.$AVAL)),
        AVALU = avalu,
        RELTMU = "hr"
      ) %>%
      dplyr::select(-c(A0, ka, ke))

    return(ADPC_day)
  }

  ADPC <- list() # nolint
  for (day in seq(duration)) {
    ADPC[[day]] <- radpc_core(day = day) # nolint
  }

  ADPC <- do.call(rbind, ADPC) # nolint

  ADPC <- ADSL %>% # nolint
    dplyr::inner_join(ADPC, by = c("STUDYID", "USUBJID", "ARMCD")) %>% # nolint
    dplyr::filter(
      ACTARM != "B: Placebo",
      !(ACTARM == "A: Drug X" & grepl("Drug Y", .$PARAM))
    )

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADPC <- mutate_na(ds = ADPC, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADPC <- apply_metadata(ADPC, "metadata/ADPC.yml") # nolint
}
