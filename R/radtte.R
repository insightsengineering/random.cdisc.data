#' Time-to-Event Analysis Dataset (ATE)
#'
#' Function for generating random Time-to-Event Analysis Dataset for a given
#' Subject-Level Analysis Dataset
#'
#' @details
#' Keys: STUDYID USUBJID PARAMCD
#'
#' @template ADSL_params
#' @template lookup_param
#' @param event.descr Character vector with description of events.
#' @param censor.descr censor description.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data adtte
#' @template param_cached
#' @template return_data.frame
#'
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' radtte(ADSL, seed = 2)
radtte <- function(ADSL,
                   event.descr = NULL,
                   censor.descr = NULL,
                   lookup = NULL,
                   seed = NULL,
                   na_percentage = 0,
                   na_vars = list(CNSR = c(NA, 0.1), AVAL = c(1234, 0.1), AVALU = c(1234, 0.1)),
                   cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadtte"))
  }

  checkmate::assert_data_frame(ADSL)
  checkmate::assert_character(censor.descr, null.ok = TRUE, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(event.descr, null.ok = TRUE, min.len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  if (!is.null(seed)) {
    set.seed(seed)
  }
  study_duration_secs <- attr(ADSL, "study_duration_secs")

  checkmate::assert_data_frame(lookup, null.ok = TRUE)
  lookup_TTE <- if (!is.null(lookup)) {
    lookup
  } else {
    tibble::tribble(
      ~ARM, ~PARAMCD, ~PARAM, ~LAMBDA, ~CNSR_P,
      "ARM A", "OS", "Overall Survival", log(2) / 610, 0.4,
      "ARM B", "OS", "Overall Survival", log(2) / 490, 0.3,
      "ARM C", "OS", "Overall Survival", log(2) / 365, 0.2,
      "ARM A", "PFS", "Progression Free Survival", log(2) / 365, 0.4,
      "ARM B", "PFS", "Progression Free Survival", log(2) / 305, 0.3,
      "ARM C", "PFS", "Progression Free Survival", log(2) / 243, 0.2,
      "ARM A", "EFS", "Event Free Survival", log(2) / 365, 0.4,
      "ARM B", "EFS", "Event Free Survival", log(2) / 305, 0.3,
      "ARM C", "EFS", "Event Free Survival", log(2) / 243, 0.2,
      "ARM A", "CRSD", "Duration of Confirmed Response", log(2) / 305, 0.4,
      "ARM B", "CRSD", "Duration of Confirmed Response", log(2) / 243, 0.3,
      "ARM C", "CRSD", "Duration of Confirmed Response", log(2) / 182, 0.2,
    )
  }

  evntdescr_sel <- if (!is.null(event.descr)) {
    event.descr
  } else {
    c(
      "Death",
      "Disease Progression",
      "Last Tumor Assessment",
      "Adverse Event",
      "Last Date Known To Be Alive"
    )
  }

  cnsdtdscr_sel <- if (!is.null(censor.descr)) {
    censor.descr
  } else {
    c(
      "Preferred Term",
      "Clinical Cut Off",
      "Completion or Discontinuation",
      "End of AE Reporting Period"
    )
  }

  ADTTE <- split(ADSL, ADSL$USUBJID) %>%
    lapply(FUN = function(pinfo) {
      lookup_TTE %>%
        dplyr::filter(ARM == as.character(pinfo$ACTARMCD)) %>%
        dplyr::rowwise() %>%
        dplyr::mutate(
          STUDYID = pinfo$STUDYID,
          SITEID = pinfo$SITEID,
          USUBJID = pinfo$USUBJID,
          CNSR = sample(c(0, 1), 1, prob = c(1 - CNSR_P, CNSR_P)),
          AVAL = stats::rexp(1, LAMBDA),
          AVALU = "DAYS",
          EVNTDESC = if (CNSR == 1) {
            sample(evntdescr_sel[-c(1:2)], 1)
          } else {
            ifelse(PARAMCD == "OS",
              sample(evntdescr_sel[1], 1),
              sample(evntdescr_sel[c(1:2)], 1)
            )
          },
          CNSDTDSC = if (CNSR == 1) sample(cnsdtdscr_sel, 1) else ""
        ) %>%
        dplyr::select(-"LAMBDA", -"CNSR_P")
    }) %>%
    Reduce(rbind, .) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier" # )
    )

  ADTTE <- var_relabel(
    ADTTE,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add TTE date and study day variables
  ADTTE <- dplyr::inner_join(
    dplyr::select(ADTTE, -"SITEID", -"ARM"),
    ADSL,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(TRTENDT = lubridate::date(dplyr::case_when(
      is.na(TRTEDTM) ~ lubridate::floor_date(lubridate::date(TRTSDTM) + study_duration_secs, unit = "day"),
      TRUE ~ TRTEDTM
    ))) %>%
    dplyr::mutate(ADTM = sample(
      seq(lubridate::as_datetime(TRTSDTM), lubridate::as_datetime(TRTENDT), by = "day"),
      size = 1
    )) %>%
    dplyr::mutate(ADY = ceiling(difftime(ADTM, TRTSDTM, units = "days"))) %>%
    dplyr::select(-TRTENDT) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(STUDYID, USUBJID, ADTM)

  ADTTE <- ADTTE %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(TTESEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = TTESEQ) %>%
    dplyr::mutate(PARAM = as.factor(PARAM)) %>%
    dplyr::mutate(PARAMCD = as.factor(PARAMCD)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      STUDYID,
      USUBJID,
      PARAMCD,
      ADTM,
      TTESEQ
    )

  # adding adverse event counts and log follow-up time
  ADTTE <- dplyr::bind_rows(
    ADTTE,
    data.frame(
      ADTTE %>%
        dplyr::group_by(USUBJID) %>%
        dplyr::slice_head(n = 1) %>%
        dplyr::mutate(
          PARAMCD = "TNE",
          PARAM = "Total Number of Exacerbations",
          AVAL = stats::rpois(1, 3),
          AVALU = "COUNT",
          lgTMATRSK = log(stats::rexp(1, rate = 3)),
          dplyr::across(
            c("ASEQ", "TTESEQ", "ADY", "ADTM", "EVNTDESC"),
            ~NA
          )
        )
    )
  ) %>%
    dplyr::arrange(
      STUDYID,
      USUBJID,
      PARAMCD,
      ADTM,
      TTESEQ
    )

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADTTE <- mutate_na(ds = ADTTE, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  ADTTE <- apply_metadata(ADTTE, "metadata/ADTTE.yml")

  return(ADTTE)
}
