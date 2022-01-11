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
radtte <- function(ADSL, # nolint
                   event.descr = NULL, # nolint
                   censor.descr = NULL, # nolint
                   lookup = NULL,
                   seed = NULL,
                   na_percentage = 0,
                   na_vars = list(CNSR = c(NA, 0.1), AVAL = c(1234, 0.1), AVALU = c(1234, 0.1)),
                   cached = FALSE) {

  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadtte"))
  }

  stopifnot(is.data.frame(ADSL))
  checkmate::assert_character(censor.descr, null.ok = TRUE, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(event.descr, null.ok = TRUE, min.len = 1, any.missing = FALSE)
  checkmate::assert_numeric(seed, null.ok = TRUE, len = 1, any.missing = FALSE)
  checkmate::assert_numeric(na_percentage, len = 1, any.missing = TRUE, lower = 0, upper = 1)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  lookup_TTE <- if_null( # nolint
    lookup,
    tibble::tribble(
      ~ARM,  ~PARAMCD, ~PARAM, ~LAMBDA, ~CNSR_P,
      "ARM A", "OS",  "Overall Survival",                 log(2) / 610, 0.4,
      "ARM B", "OS",  "Overall Survival",                 log(2) / 490, 0.3,
      "ARM C", "OS",  "Overall Survival",                 log(2) / 365, 0.2,
      "ARM A", "PFS", "Progression Free Survival",        log(2) / 365, 0.4,
      "ARM B", "PFS", "Progression Free Survival",        log(2) / 305, 0.3,
      "ARM C", "PFS", "Progression Free Survival",        log(2) / 243, 0.2,
      "ARM A", "EFS", "Event Free Survival",              log(2) / 365, 0.4,
      "ARM B", "EFS", "Event Free Survival",              log(2) / 305, 0.3,
      "ARM C", "EFS", "Event Free Survival",              log(2) / 243, 0.2,
      "ARM A", "CRSD", "Duration of Confirmed Response",  log(2) / 305, 0.4,
      "ARM B", "CRSD", "Duration of Confirmed Response",  log(2) / 243, 0.3,
      "ARM C", "CRSD", "Duration of Confirmed Response",  log(2) / 182, 0.2,
    )
  )

  evntdescr_sel <- if_null(
    event.descr,
    c(
      "Death",
      "Disease Progression",
      "Last Tumor Assessment",
      "Adverse Event",
      "Last Date Known To Be Alive"
    )
  )

  cnsdtdscr_sel <- if_null(
    censor.descr,
    c(
      "Preferred Term",
      "Clinical Cut Off",
      "Completion or Discontinuation",
      "End of AE Reporting Period"
    )
  )

  ADTTE <- split(ADSL, ADSL$USUBJID) %>% # nolint

    lapply(FUN = function(pinfo) {
      lookup_TTE %>%
        dplyr::filter(.data$ARM == as.character(pinfo$ACTARMCD)) %>%
        dplyr::rowwise() %>%
        dplyr::mutate(
          STUDYID = pinfo$STUDYID,
          SITEID = pinfo$SITEID,
          USUBJID = pinfo$USUBJID,
          CNSR = sample(c(0, 1), 1, prob = c(1 - .data$CNSR_P, .data$CNSR_P)),
          AVAL = stats::rexp(1, .data$LAMBDA),
          AVALU = "DAYS",
          EVNTDESC = if (.data$CNSR == 1) sample(evntdescr_sel[-c(1:2)], 1)
          else {
            ifelse(.data$PARAMCD == "OS",
                   sample(evntdescr_sel[1], 1),
                   sample(evntdescr_sel[c(1:2)], 1)
            )},
          CNSDTDSC = if (.data$CNSR == 1) sample(cnsdtdscr_sel, 1) else ""
        ) %>%
        dplyr::select(-.data$LAMBDA, -.data$CNSR_P)

    }) %>%
    Reduce(rbind, .) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier"#)
    )

  na_vars <- na_vars[setdiff(colnames(ADTTE), colnames(ADSL))]
  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADTTE <- mutate_na(ds = ADTTE, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADTTE <- var_relabel( # nolint
    ADTTE,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add TTE date and study day variables
  ADTTE <- dplyr::inner_join( # nolint
    ADSL, # nolint
    dplyr::select(ADTTE, -.data$SITEID, -.data$ARM),
    by = c("STUDYID", "USUBJID")) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    dplyr::mutate(trtedt_int = dplyr::case_when(
      !is.na(TRTEDTM) ~ as.numeric(as.Date(TRTEDTM)),
      is.na(TRTEDTM) ~ floor(trtsdt_int + (study_duration_secs) / 86400)
    )) %>%
    dplyr::mutate(ADTM = as.POSIXct(
      (sample(.data$trtsdt_int:.data$trtedt_int, size = 1) * 86400),
      origin = "1970-01-01")
    ) %>%
    dplyr::mutate(ADY = ceiling(as.numeric(difftime(.data$ADTM, .data$TRTSDTM, units = "days")))) %>%
    dplyr::select(-.data$trtsdt_int, -.data$trtedt_int) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$STUDYID, .data$USUBJID, .data$ADTM)

  ADTTE <- ADTTE %>% # nolint
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(TTESEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = .data$TTESEQ) %>%
    dplyr::mutate(PARAM = as.factor(.data$PARAM)) %>%
    dplyr::mutate(PARAMCD = as.factor(.data$PARAMCD)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      .data$STUDYID,
      .data$USUBJID,
      .data$PARAMCD,
      .data$ADTM,
      .data$TTESEQ
    )

  # apply metadata
  ADTTE <- apply_metadata(ADTTE, "metadata/ADTTE.yml") # nolint

  return(ADTTE)
}
