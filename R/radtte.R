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
#' @importFrom dplyr arrange case_when filter group_by mutate n rowwise select ungroup
#' @importFrom magrittr %>%
#' @importFrom tibble tribble
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

  stopifnot(is_logical_single(cached))
  if (cached) {
    return(get_cached_data("cadtte"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is.null(event.descr) || is_character_vector(event.descr))
  stopifnot(is.null(censor.descr) || is_character_vector(censor.descr))
  stopifnot(is.null(seed) || is_numeric_single(seed))
  stopifnot((is_numeric_single(na_percentage) && na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  if (!is.null(seed)) {
    set.seed(seed)
  }

  lookup_TTE <- if_null( # nolint
    lookup,
    tribble(
      ~ARM,  ~PARAMCD, ~PARAM, ~LAMBDA, ~CNSR_P,
      "ARM A", "OS",  "Overall Survival",          1 / 80,  0.4,
      "ARM B", "OS",  "Overall Survival",          1 / 100, 0.2,
      "ARM C", "OS",  "Overall Survival",          1 / 60,  0.42,
      "ARM A", "PFS", "Progression Free Survival", 1 / 100, 0.3,
      "ARM B", "PFS", "Progression Free Survival", 1 / 150, 0.1,
      "ARM C", "PFS", "Progression Free Survival", 1 / 80,  0.32,
      "ARM A", "EFS", "Event Free Survival",       1 / 80,  0.2,
      "ARM B", "EFS", "Event Free Survival",       1 / 100, 0.08,
      "ARM C", "EFS", "Event Free Survival",       1 / 60,  0.23
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
        rowwise() %>%
        mutate(
          STUDYID = pinfo$STUDYID,
          SITEID = pinfo$SITEID,
          USUBJID = pinfo$USUBJID,
          CNSR = sample(c(0, 1), 1, prob = c(1 - .data$CNSR_P, .data$CNSR_P)),
          AVAL = rexp(1, .data$LAMBDA),
          AVALU = "DAYS",
          EVNTDESC = if (.data$CNSR == 1) sample(evntdescr_sel[-c(1:2)], 1) else sample(evntdescr_sel, 1),
          CNSDTDSC = if (.data$CNSR == 1) sample(cnsdtdscr_sel, 1) else ""
        ) %>%
        select(-.data$LAMBDA, -.data$CNSR_P)

    }) %>%
    Reduce(rbind, .) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier"#)
    )

  na_vars <- na_vars[setdiff(colnames(ADTTE), colnames(ADSL))]
  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADTTE <- mutate_na(ds = ADTTE, na_vars = na_vars, na_percentage = na_percentage) #nolint
  }

  ADTTE <- var_relabel( # nolint
    ADTTE,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add TTE date and study day variables
  ADTTE <- inner_join( # nolint
    ADSL, # nolint
    select(ADTTE, -.data$SITEID, -.data$ARM),
    by = c("STUDYID", "USUBJID")) %>%
    rowwise() %>%
    mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    mutate(trtedt_int = case_when(
      !is.na(TRTEDTM) ~ as.numeric(as.Date(TRTEDTM)),
      is.na(TRTEDTM) ~ floor(trtsdt_int + (study_duration_secs) / 86400)
    )) %>%
    mutate(ADTM = as.POSIXct((sample(.data$trtsdt_int:.data$trtedt_int, size = 1) * 86400), origin = "1970-01-01")) %>%
    mutate(ADY = ceiling(as.numeric(difftime(.data$ADTM, .data$TRTSDTM, units = "days")))) %>%
    select(-.data$trtsdt_int, -.data$trtedt_int) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$ADTM)

  ADTTE <- ADTTE %>% # nolint
    group_by(.data$USUBJID) %>%
    mutate(TTESEQ = 1:n()) %>%
    mutate(ASEQ = .data$TTESEQ) %>%
    mutate(PARAM = as.factor(.data$PARAM)) %>%
    mutate(PARAMCD = as.factor(.data$PARAMCD)) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$PARAMCD, .data$ADTM, .data$TTESEQ)

  # apply metadata
  ADTTE <- apply_metadata(ADTTE, "metadata/ADTTE.yml") # nolint

  return(ADTTE)
}
