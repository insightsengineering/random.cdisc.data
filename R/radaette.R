#' Time to Adverse Event Analysis Dataset (ADAETTE)
#'
#' Function to generate random time to AE dataset for a
#' given subject-level analysis dataset.
#'
#' Keys: STUDYID USUBJID PARAMCD
#'
#' @template ADSL_params
#' @template lookup_param
#' @param event.descr Character vector with description of events.
#' @param censor.descr Character vector with description of censors.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data adaette
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @importFrom dplyr arrange case_when filter group_by mutate n rowwise select ungroup
#' @importFrom magrittr %>%
#' @importFrom tibble tribble
#'
#' @export
#'
#' @author Xiuting Mi
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- suppressWarnings(radsl(N = 10, seed = 1, study_duration = 2))
#' radaette(ADSL, seed  = 2)
radaette <- function(ADSL, # nolint
                     event.descr = NULL, # nolint
                     censor.descr = NULL, # nolint
                     lookup = NULL,
                     seed = NULL,
                     na_percentage = 0,
                     na_vars = list(CNSR = c(NA, 0.1), AVAL = c(1234, 0.1), AVALU = c(1234, 0.1)),
                     cached = FALSE) {

  stopifnot(is_logical_single(cached))
  if (cached) {
    return(get_cached_data("cadaette"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is.null(event.descr) || is_character_vector(event.descr))
  stopifnot(is.null(censor.descr) || is_character_vector(censor.descr))
  stopifnot(is.null(seed) || is_numeric_single(seed))
  stopifnot((is_numeric_single(na_percentage) && na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  lookup_ADAETTE <- if_null( # nolint
    lookup,
    tribble(
      ~ARM,  ~PARAMCD, ~PARAM, ~LAMBDA, ~CNSR_P,
      "ARM A", "AETTE1",   "Time to first occurrence of any adverse event",  1 / 80,     0.4,
      "ARM B", "AETTE1",   "Time to first occurrence of any adverse event", 1 / 100,     0.2,
      "ARM C", "AETTE1",   "Time to first occurrence of any adverse event",  1 / 60,     0.42,
      "ARM A", "AETTE2",   "Time to first occurrence of any serious adverse event",  1 / 100,     0.3,
      "ARM B", "AETTE2",   "Time to first occurrence of any serious adverse event", 1 / 150,     0.1,
      "ARM C", "AETTE2",   "Time to first occurrence of any serious adverse event",  1 / 80,     0.32,
      "ARM A", "AETTE3",   "Time to first occurrence of a grade 3-5 adverse event",  1 / 80,     0.2,
      "ARM B", "AETTE3",   "Time to first occurrence of a grade 3-5 adverse event", 1 / 100,     0.08,
      "ARM C", "AETTE3",   "Time to first occurrence of a grade 3-5 adverse event",  1 / 60,     0.23
    )
  )

  if (!is.null(seed)) {
    set.seed(seed)
  }

  evntdescr_sel <- if_null(
    event.descr,
    c(
      "Preferred Term",
      "Clinical Cut Off",
      "Completion or Discontinuation",
      "End of AE Reporting Period"
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

  ADAETTE <- split(ADSL, ADSL$USUBJID) %>% # nolint
    lapply(function(pinfo) {
      lookup_ADAETTE %>%
        dplyr::filter(.data$ARM == as.character(pinfo$ARMCD)) %>%
        rowwise() %>%
        mutate(
          STUDYID = pinfo$STUDYID,
          SITEID = pinfo$SITEID,
          USUBJID = pinfo$USUBJID,
          CNSR = sample(c(0, 1), 1, prob = c(1 - .data$CNSR_P, .data$CNSR_P)),
          AVAL = rexp(1, .data$LAMBDA) / 365.25,
          AVALU = "YEARS",
          EVNTDESC = if (.data$CNSR == 0) sample(evntdescr_sel, 1) else "",
          CNSDTDSC = if (.data$CNSR == 1) sample(cnsdtdscr_sel, 1) else ""
        ) %>%
        select(-.data$LAMBDA, -.data$CNSR_P)
    }) %>%
    Reduce(rbind, .) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier"
    )

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADAETTE <- mutate_na(ds = ADAETTE, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADAETTE <- var_relabel( # nolint
    ADAETTE,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add AETTE date and study day variables
  ADAETTE <- inner_join( # nolint
    ADSL, # nolint
    select(ADAETTE, -.data$SITEID, -.data$ARM),
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

  ADAETTE <- ADAETTE %>% # nolint
    group_by(.data$USUBJID) %>%
    mutate(TTESEQ = 1:n()) %>%
    mutate(ASEQ = .data$TTESEQ) %>%
    mutate(PARAM = as.factor(.data$PARAM)) %>%
    mutate(PARAMCD = as.factor(.data$PARAMCD)) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$PARAMCD, .data$ADTM, .data$TTESEQ)

  # apply metadata
  ADAETTE <- apply_metadata(ADAETTE, "metadata/ADAETTE.yml") # nolint.

  return(ADAETTE)
}
