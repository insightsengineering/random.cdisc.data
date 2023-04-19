#' Time to Adverse Event Analysis Dataset (ADAETTE)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function to generate random Time-to-AE Dataset for a
#' given Subject-Level Analysis Dataset.
#'
#' @details
#'
#' Keys: `STUDYID`, `USUBJID`, `PARAMCD`
#'
#' @inheritParams argument_convention
#' @param event_descr (`character vector`)\cr Descriptions of events. Defaults to `NULL`.
#' @param censor_descr (`character vector`)\cr Descriptions of censors. Defaults to `NULL`.
#' @template param_cached
#' @templateVar data adaette
#'
#' @return `data.frame`
#' @export
#'
#' @author Xiuting Mi
#'
#' @examples
#' library(random.cdisc.data)
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' adaette <- radaette(adsl, seed = 2)
#' adaette
radaette <- function(adsl,
                     event_descr = NULL,
                     censor_descr = NULL,
                     lookup = NULL,
                     seed = NULL,
                     na_percentage = 0,
                     na_vars = list(CNSR = c(NA, 0.1), AVAL = c(1234, 0.1)),
                     cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadaette"))
  }

  checkmate::assert_data_frame(adsl)
  checkmate::assert_character(censor_descr, null.ok = TRUE, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(event_descr, null.ok = TRUE, min.len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  checkmate::assert_data_frame(lookup, null.ok = TRUE)
  lookup_adaette <- if (!is.null(lookup)) {
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
  study_duration_secs <- lubridate::seconds(attr(adsl, "study_duration_secs"))

  evntdescr_sel <- if (!is.null(event_descr)) {
    event_descr
  } else {
    "Preferred Term"
  }

  cnsdtdscr_sel <- if (!is.null(censor_descr)) {
    censor_descr
  } else {
    c(
      "Clinical Cut Off",
      "Completion or Discontinuation",
      "End of AE Reporting Period"
    )
  }

  random_patient_data <- function(patient_info) {
    startdt <- lubridate::date(patient_info$TRTSDTM)
    trtedtm <- lubridate::floor_date(dplyr::case_when(
      is.na(patient_info$TRTEDTM) ~ lubridate::date(patient_info$TRTSDTM) + study_duration_secs,
      TRUE ~ lubridate::date(patient_info$TRTEDTM)
    ), unit = "day")
    enddts <- c(patient_info$EOSDT, lubridate::date(trtedtm))
    enddts_min_index <- which.min(enddts)
    adt <- enddts[enddts_min_index]
    adtm <- lubridate::as_datetime(adt)
    ady <- as.numeric(adt - startdt + 1)
    data.frame(
      ARM = patient_info$ARM,
      STUDYID = patient_info$STUDYID,
      SITEID = patient_info$SITEID,
      USUBJID = patient_info$USUBJID,
      PARAMCD = "AEREPTTE",
      PARAM = "Time to end of AE reporting period",
      CNSR = 0,
      AVAL = lubridate::days(ady) / lubridate::years(1),
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
  adsl_hy <- dplyr::select(adsl, "STUDYID", "USUBJID", "TRTSDTM", "SITEID", "ARM")

  # create all combinations of unique values in STUDYID, USUBJID, PARAM, AVISIT
  adaette_hy <- expand.grid(
    STUDYID = unique(adsl$STUDYID),
    USUBJID = adsl$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    stringsAsFactors = FALSE
  )

  # Add other variables to adaette_hy
  adaette_hy <- dplyr::left_join(adaette_hy, adsl_hy, by = c("STUDYID", "USUBJID")) %>%
    rel_var(
      var_name = "PARAMCD",
      related_var = "PARAM",
      var_values = param_init_list$relvar2
    ) %>%
    dplyr::mutate(
      CNSR = sample(c(0, 1), prob = c(0.1, 0.9), size = dplyr::n(), replace = TRUE),
      EVNTDESC = dplyr::if_else(
        CNSR == 0,
        "First Post-Baseline Raised ALT or AST Elevation Result",
        NA_character_
      ),
      CNSDTDSC = dplyr::if_else(CNSR == 0, NA_character_,
        sample(c("Last Post-Baseline ALT or AST Result", "Treatment Start"),
          prob = c(0.9, 0.1),
          size = dplyr::n(), replace = TRUE
        )
      )
    ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(ADTM = dplyr::case_when(
      CNSDTDSC == "Treatment Start" ~ TRTSDTM,
      TRUE ~ TRTSDTM + sample(seq(0, study_duration_secs), size = dplyr::n(), replace = TRUE)
    )) %>%
    dplyr::mutate(
      ADY_int = lubridate::date(ADTM) - lubridate::date(TRTSDTM) + 1,
      ADY = as.numeric(ADY_int),
      AVAL = lubridate::days(ADY_int) / lubridate::weeks(1),
      AVALU = "WEEKS"
    ) %>%
    dplyr::select(-TRTSDTM, -ADY_int)

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
      ADY = dplyr::if_else(is.na(AVALU), NA_real_, ceiling(as.numeric(lubridate::dyears(AVAL), "days"))),
      ADTM = dplyr::if_else(
        is.na(AVALU),
        lubridate::as_datetime(NA),
        patient_info$TRTSDTM + lubridate::days(ADY)
      )
    )
  }

  adaette <- split(adsl, adsl$USUBJID) %>%
    lapply(function(patient_info) {
      patient_data <- random_patient_data(patient_info)
      lookup_arm <- lookup_adaette %>%
        dplyr::filter(ARM == as.character(patient_info$ARMCD))
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

  adaette <- var_relabel(
    adaette,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  adaette <- rbind(adaette, adaette_hy)

  adaette <- dplyr::inner_join(
    dplyr::select(adaette, -"SITEID", -"ARM"),
    adsl,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::arrange(ADTM) %>%
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

  if (length(na_vars) > 0 && na_percentage > 0) {
    adaette <- dplyr::mutate(ds = adaette, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  adaette <- apply_metadata(adaette, "metadata/ADAETTE.yml")

  return(adaette)
}
