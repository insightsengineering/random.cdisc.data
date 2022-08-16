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
#'
#' @export
#'
#' @author Xiuting Mi
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- suppressWarnings(radsl(N = 10, seed = 1, study_duration = 2))
#' radaette(ADSL, seed = 2)
radaette <- function(ADSL, # nolint
                     event.descr = NULL, # nolint
                     censor.descr = NULL, # nolint
                     lookup = NULL,
                     seed = NULL,
                     na_percentage = 0,
                     na_vars = list(CNSR = c(NA, 0.1), AVAL = c(1234, 0.1)),
                     cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadaette"))
  }

  checkmate::assert_data_frame(ADSL)
  checkmate::assert_character(censor.descr, null.ok = TRUE, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(event.descr, null.ok = TRUE, min.len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  checkmate::assert_data_frame(lookup, null.ok = TRUE)
  lookup_ADAETTE <- if (!is.null(lookup)) { # nolint
    lookup
  } else {
    tibble::tribble(
      ~ARM, ~CATCD, ~CAT, ~LAMBDA, ~CNSR_P,
      "ARM A", "1", "any adverse event", 1 / 80, 0.4,
      "ARM B", "1", "any adverse event", 1 / 100, 0.2,
      "ARM C", "1", "any adverse event", 1 / 60, 0.42,
      "ARM A", "2", "any serious adverse event", 1 / 100, 0.3,
      "ARM B", "2", "any serious adverse event", 1 / 150, 0.1,
      "ARM C", "2", "any serious adverse event", 1 / 80, 0.32,
      "ARM A", "3", "a grade 3-5 adverse event", 1 / 80, 0.2,
      "ARM B", "3", "a grade 3-5 adverse event", 1 / 100, 0.08,
      "ARM C", "3", "a grade 3-5 adverse event", 1 / 60, 0.23
    )
  }

  if (!is.null(seed)) {
    set.seed(seed)
  }

  evntdescr_sel <- if (!is.null(event.descr)) {
    event.descr
  } else {
    "Preferred Term"
  }

  cnsdtdscr_sel <- if (!is.null(censor.descr)) {
    censor.descr
  } else {
    c(
      "Clinical Cut Off",
      "Completion or Discontinuation",
      "End of AE Reporting Period"
    )
  }

  random_patient_data <- function(patient_info) {
    trtsdt_int <- as.numeric(as.Date(patient_info$TRTSDTM))
    trtedt_int <- ifelse(
      !is.na(patient_info$TRTEDTM),
      as.numeric(as.Date(patient_info$TRTEDTM)),
      floor(trtsdt_int + patient_info$study_duration_secs / 86400)
    )
    startdt <- as.Date(patient_info$TRTSDTM)
    trtedtm <- as.POSIXct(trtedt_int * 86400, origin = "1970-01-01")
    enddts <- c(as.Date(patient_info$EOSDT), as.Date(trtedtm))
    enddts_min_index <- which.min(enddts)
    adt <- enddts[enddts_min_index]
    adtm <- as.POSIXct(adt)
    ady <- as.numeric(adt - startdt + 1)
    data.frame(
      ARM = patient_info$ARM,
      STUDYID = patient_info$STUDYID,
      SITEID = patient_info$SITEID,
      USUBJID = patient_info$USUBJID,
      PARAMCD = "AEREPTTE",
      PARAM = "Time to end of AE reporting period",
      CNSR = 0,
      AVAL = ady / 365.25,
      AVALU = "YEARS",
      EVNTDESC = ifelse(enddts_min_index == 1, "Completion or Discontinuation", "End of AE Reporting Period"),
      CNSDTDSC = NA,
      ADTM = adtm,
      ADY = ady,
      stringsAsFactors = FALSE
    )
  }

  # validate and initialize related variables for Hy's law
  paramcd_hy <- c("HYSTTEUL", "HYSTTEBL")
  param_hy <- c("Time to Hy's Law Elevation in relation to ULN", "Time to Hy's Law Elevation in relation to Baseline")
  param_init_list <- relvar_init(param_hy, paramcd_hy)
  adsl_hy <- dplyr::select(ADSL, "STUDYID", "USUBJID", "TRTSDTM", "SITEID", "ARM", "study_duration_secs")

  # create all combinations of unique values in STUDYID, USUBJID, PARAM, AVISIT
  adaette_hy <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    stringsAsFactors = FALSE
  )

  # Add other variables to adaette_hy
  adaette_hy <- dplyr::left_join(adaette_hy, adsl_hy, by = c("STUDYID", "USUBJID")) %>% # nolint
    dplyr::mutate(
      PARAMCD = factor(rel_var(
        df = as.data.frame(adaette_hy),
        var_values = param_init_list$relvar2,
        related_var = "PARAM"
      ))
    ) %>%
    dplyr::mutate(
      CNSR = sample(c(0, 1), prob = c(0.1, 0.9), size = dplyr::n(), replace = TRUE),
      EVNTDESC = dplyr::if_else(
        .data$CNSR == 0,
        "First Post-Baseline Raised ALT or AST Elevation Result",
        NA_character_
      ),
      CNSDTDSC = dplyr::if_else(.data$CNSR == 0, NA_character_,
        sample(c("Last Post-Baseline ALT or AST Result", "Treatment Start"),
          prob = c(0.9, 0.1),
          size = dplyr::n(), replace = TRUE
        )
      )
    ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(ADTM = dplyr::case_when(
      .data$CNSDTDSC == "Treatment Start" ~ .data$TRTSDTM,
      TRUE ~ as.POSIXct(
        .data$TRTSDTM + sample(seq(0, .data$study_duration_secs), size = dplyr::n(), replace = TRUE),
        origin = "1970-01-01"
      )
    )) %>%
    dplyr::mutate(
      STARTDT = as.Date(.data$TRTSDTM),
      ADT = as.Date(.data$ADTM),
      ADY = as.numeric(.data$ADT - .data$STARTDT + 1),
      AVAL = .data$ADY / 7,
      AVALU = "WEEKS"
    )

  adaette_hy <- dplyr::select(adaette_hy, -"TRTSDTM", -"study_duration_secs", -"ADT", -"STARTDT")

  random_ae_data <- function(lookup_info, patient_info, patient_data) {
    cnsr <- sample(c(0, 1), 1, prob = c(1 - lookup_info$CNSR_P, lookup_info$CNSR_P))
    ae_rep_tte <- patient_data$AVAL[patient_data$PARAMCD == "AEREPTTE"]
    data.frame(
      ARM = rep(patient_data$ARM, 2),
      STUDYID = rep(patient_data$STUDYID, 2),
      SITEID = rep(patient_data$SITEID, 2),
      USUBJID = rep(patient_data$USUBJID, 2),
      PARAMCD = c(
        paste0("AETTE", lookup_info$CATCD),
        paste0("AETOT", lookup_info$CATCD)
      ),
      PARAM = c(
        paste("Time to first occurrence of", lookup_info$CAT),
        paste("Number of occurrences of", lookup_info$CAT)
      ),
      CNSR = c(
        cnsr,
        NA
      ),
      AVAL = c(
        # We generate these values conditional on the censoring information.
        # If this time to event is censored, then there were no AEs reported and the time is set
        # to the AE reporting period time. Otherwise we draw from truncated distributions to make
        # sure that we are within the AE reporting time and above 0 AEs.
        ifelse(cnsr == 1, ae_rep_tte, rtexp(1, lookup_info$LAMBDA * 365.25, r = ae_rep_tte)),
        ifelse(cnsr == 1, 0, rtpois(1, lookup_info$LAMBDA * 365.25))
      ),
      AVALU = c(
        "YEARS",
        NA
      ),
      EVNTDESC = c(
        ifelse(cnsr == 0, sample(evntdescr_sel, 1), ""),
        NA
      ),
      CNSDTDSC = c(
        ifelse(cnsr == 1, sample(cnsdtdscr_sel, 1), ""),
        NA
      ),
      stringsAsFactors = FALSE
    ) %>% dplyr::mutate(
      ADY = dplyr::if_else(is.na(.data$AVALU), NA_real_, ceiling(.data$AVAL * 365.25)),
      ADTM = dplyr::if_else(
        is.na(.data$AVALU),
        as.POSIXct(NA),
        as.POSIXct(patient_info$TRTSDTM) + as.difftime(.data$ADY, units = "days")
      )
    )
  }

  ADAETTE <- split(ADSL, ADSL$USUBJID) %>% # nolint
    lapply(function(patient_info) {
      patient_data <- random_patient_data(patient_info)
      lookup_arm <- lookup_ADAETTE %>%
        dplyr::filter(.data$ARM == as.character(patient_info$ARMCD))
      ae_data <- split(lookup_arm, lookup_arm$CATCD) %>%
        lapply(random_ae_data, patient_data = patient_data, patient_info = patient_info) %>%
        Reduce(rbind, .)
      dplyr::bind_rows(patient_data, ae_data)
    }) %>%
    Reduce(rbind, .) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier"
    )

  ADAETTE <- var_relabel( # nolint
    ADAETTE,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  ADAETTE <- rbind(ADAETTE, adaette_hy) # nolint

  ADAETTE <- ADSL %>% # nolint
    dplyr::inner_join(
      dplyr::select(ADAETTE, -.data$SITEID, -.data$ARM),
      by = c("STUDYID", "USUBJID")
    ) %>%
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::arrange(.data$ADTM) %>%
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

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADAETTE <- dplyr::mutate(ds = ADAETTE, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  # apply metadata
  ADAETTE <- apply_metadata(ADAETTE, "metadata/ADAETTE.yml") # nolint.

  return(ADAETTE)
}
