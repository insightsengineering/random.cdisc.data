#' Pharmacokinetics Analysis Dataset (ADPC)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating a random Pharmacokinetics Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per study, subject, parameter, and time point.
#'
#' @inheritParams argument_convention
#' @param avalu (`character`)\cr Analysis value units.
#' @param constants (`character vector`)\cr Constant parameters to be used in formulas for creating analysis values.
#' @param duration (`numeric`)\cr Duration in number of days.
#' @template param_cached
#' @templateVar data adpc
#'
#' @return `data.frame`
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' adpc <- radpc(adsl, seed = 2)
#' adpc
#'
#' adpc <- radpc(adsl, seed = 2, duration = 3)
#' adpc
radpc <- function(adsl,
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

  checkmate::assert_data_frame(adsl)
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
    adpc_day <- tidyr::expand_grid(
      data.frame(
        STUDYID = adsl$STUDYID,
        USUBJID = adsl$USUBJID,
        ARMCD = adsl$ARMCD,
        A0 = unname(constants["D"]),
        ka = unname(constants["ka"]) - stats::runif(length(adsl$USUBJID), -0.2, 0.2),
        ke = unname(constants["ke"]) - stats::runif(length(adsl$USUBJID), -0.2, 0.2)
      ),
      PCTPTNUM = if (day == 1) c(0, 0.5, 1, 1.5, 2, 3, 4, 8, 12) else 24 * (day - 1),
      PARAM = factor(c("Plasma Drug X", "Urine Drug X", "Plasma Drug Y", "Urine Drug Y"))
    )
    adpc_day <- adpc_day[!(grepl("Urine", adpc_day$PARAM) &
      adpc_day$PCTPTNUM %in% c(0.5, 1, 1.5, 2, 3)), ] %>%
      dplyr::arrange(USUBJID, PARAM) %>%
      dplyr::mutate(
        VISITDY = day,
        VISIT = ifelse(day <= 7, paste("Day", VISITDY), paste("Week", (VISITDY - 1) / 7)),
        PCVOLU = ifelse(grepl("Urine", PARAM), "mL", ""),
        ASMED = ifelse(grepl("Urine", PARAM), "URINE", "PLASMA"),
        PCTPT = factor(dplyr::case_when(
          PCTPTNUM == 0 ~ "Predose",
          (day == 1 & grepl("Urine", PARAM)) ~
            paste0(lag(PCTPTNUM), "H - ", PCTPTNUM, "H"),
          (day != 1 & grepl("Urine", PARAM)) ~
            paste0(as.numeric(PCTPTNUM) - 24, "H - ", PCTPTNUM, "H"),
          TRUE ~ paste0(PCTPTNUM, "H")
        )),
        ARELTM1 = PCTPTNUM,
        NRELTM1 = PCTPTNUM,
        ARELTM2 = ARELTM1 - (24 * (day - 1)),
        NRELTM2 = NRELTM1 - (24 * (day - 1)),
        A0 = ifelse(PARAM == "Plasma Drug Y", A0, A0 / 2),
        AVAL = round(
          (A0 * ka * (
            exp(-ka * ARELTM1) - exp(-ke * ARELTM1)
          ))
          / (ke - ka),
          digits = 3
        )
      ) %>%
      dplyr::mutate(
        PCVOL = ifelse(ASMED == "URINE", round(abs(((PCTPTNUM - 1) %% 24) *
          A0 * ka * exp(PCTPTNUM %% 1.8 / 10)), 2), NA),
        # PK Equation
        AVALC = ifelse(AVAL == 0, "BLQ", as.character(AVAL)),
        AVALU = avalu,
        RELTMU = "hr"
      ) %>%
      dplyr::select(-c("A0", "ka", "ke"))

    return(adpc_day)
  }

  adpc <- list()

  for (day in seq(duration)[seq(duration) <= 7 | ((seq(duration) - 1) %% 7 == 0)]) {
    adpc[[day]] <- radpc_core(day = day)
  }

  adpc <- do.call(rbind, adpc)

  adpc <- dplyr::inner_join(adpc, adsl, by = c("STUDYID", "USUBJID", "ARMCD")) %>%
    dplyr::filter(ACTARM != "B: Placebo", !(ACTARM == "A: Drug X" & PARAM == "Plasma Drug Y"))

  if (length(na_vars) > 0 && na_percentage > 0) {
    adpc <- mutate_na(ds = adpc, na_vars = na_vars, na_percentage = na_percentage)
  }

  adpc <- apply_metadata(adpc, "metadata/adpc.yml")
}
