#' Concomitant Medication Analysis Dataset (ADCM)
#'
#' Function for generating random Concomitant Medication Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: STUDYID USUBJID ASTDTM CMSEQ.
#'
#' @template ADSL_params
#' @template lookup_param
#' @param max_n_cms maximum number of concomitant medications per patient.
#' @param who_coding (`flag`)\cr whether to use WHO coding (with multiple paths per medication) or not.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data adcm
#' @template param_cached
#'
#' @template return_data.frame
#'
#'
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' radcm(ADSL, seed = 2)
#' radcm(ADSL, seed = 2, who_coding = TRUE)
radcm <- function(ADSL, # nolint
                  max_n_cms = 10L,
                  lookup = NULL,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(CMCLAS = c(NA, 0.1), CMDECOD = c(1234, 0.1), ATIREL = c(1234, 0.1)),
                  who_coding = FALSE,
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadcm"))
  }

  checkmate::assert_data_frame(ADSL)
  checkmate::assert_integer(max_n_cms, len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1, na.ok = TRUE)
  # also check na_percentage is not 1
  stopifnot(is.na(na_percentage) || na_percentage < 1)
  checkmate::assert_flag(who_coding)

  checkmate::assert_data_frame(lookup, null.ok = TRUE)
  lookup_cm <- if (!is.null(lookup)) {
    lookup
  } else {
    tibble::tribble(
      ~CMCLAS, ~CMDECOD, ~ATIREL,
      "medcl A", "medname A_1/3", "PRIOR",
      "medcl A", "medname A_2/3", "CONCOMITANT",
      "medcl A", "medname A_3/3", "CONCOMITANT",
      "medcl B", "medname B_1/4", "CONCOMITANT",
      "medcl B", "medname B_2/4", "PRIOR",
      "medcl B", "medname B_3/4", "PRIOR",
      "medcl B", "medname B_4/4", "CONCOMITANT",
      "medcl C", "medname C_1/2", "CONCOMITANT",
      "medcl C", "medname C_2/2", "CONCOMITANT"
    )
  }

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADCM <- Map(function(id, sid) { # nolint
    n_cms <- sample(c(0, seq_len(max_n_cms)), 1)
    i <- sample(seq_len(nrow(lookup_cm)), n_cms, TRUE)
    dplyr::mutate(
      lookup_cm[i, ],
      USUBJID = id,
      STUDYID = sid
    )
  }, ADSL$USUBJID, ADSL$STUDYID) %>%
    Reduce(rbind, .) %>%
    `[`(c(4, 5, 1, 2, 3)) %>%
    dplyr::mutate(CMCAT = .data$CMCLAS)

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADCM <- mutate_na(ds = ADCM, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADCM <- var_relabel( # nolint
    ADCM,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add CM date and study day variables
  ADCM <- dplyr::inner_join( # nolint
    ADSL, # nolint
    ADCM,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    dplyr::mutate(trtedt_int = dplyr::case_when(
      !is.na(TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(TRTEDTM) ~ floor(.data$trtsdt_int + (.data$study_duration_secs) / 86400)
    )) %>%
    dplyr::mutate(ASTDTM = as.POSIXct(
      (sample(.data$trtsdt_int:.data$trtedt_int, size = 1) * 86400),
      origin = "1970-01-01"
    )) %>%
    dplyr::mutate(astdt_int = as.numeric(as.Date(.data$ASTDTM))) %>%
    dplyr::mutate(ASTDY = ceiling(as.numeric(difftime(.data$ASTDTM, .data$TRTSDTM, units = "days")))) %>%
    # add 1 to end of range incase both values passed to sample() are the same
    dplyr::mutate(AENDTM = as.POSIXct((
      sample(.data$astdt_int:(.data$trtedt_int + 1), size = 1) * 86400),
    origin = "1970-01-01"
    )) %>%
    dplyr::mutate(AENDY = ceiling(as.numeric(difftime(.data$AENDTM, .data$TRTSDTM, units = "days")))) %>%
    dplyr::select(-.data$trtsdt_int, -.data$trtedt_int, -.data$astdt_int) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$STUDYID, .data$USUBJID, .data$ASTDTM)

  ADCM <- ADCM %>% # nolint
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(CMSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = .data$CMSEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$STUDYID, .data$USUBJID, .data$ASTDTM, .data$CMSEQ) %>%
    dplyr::mutate(
      ATC1 = paste("ATCCLAS1", substr(.data$CMDECOD, 9, 9)),
      ATC2 = paste("ATCCLAS2", substr(.data$CMDECOD, 9, 9)),
      ATC3 = paste("ATCCLAS3", substr(.data$CMDECOD, 9, 9)),
      ATC4 = paste("ATCCLAS4", substr(.data$CMDECOD, 9, 9))
    ) %>%
    dplyr::mutate(CMINDC = sample(c(
      "Nausea", "Hypertension", "Urticaria", "Fever",
      "Asthma", "Infection", "Diabete", "Diarrhea", "Pneumonia"
    ), dplyr::n(), replace = TRUE)) %>%
    dplyr::mutate(CMDOSE = sample(1:99, dplyr::n(), replace = TRUE)) %>%
    dplyr::mutate(CMTRT = substr(.data$CMDECOD, 9, 13)) %>%
    dplyr::mutate(CMDOSU = sample(c(
      "ug/mL", "ug/kg/day", "%", "uL", "DROP",
      "umol/L", "mg", "mg/breath", "ug"
    ), dplyr::n(), replace = TRUE)) %>%
    dplyr::mutate(CMROUTE = sample(c(
      "INTRAVENOUS", "ORAL", "NASAL",
      "INTRAMUSCULAR", "SUBCUTANEOUS", "INHALED", "RECTAL", "UNKNOWN"
    ), dplyr::n(), replace = TRUE)) %>%
    dplyr::mutate(CMDOSFRQ = sample(c(
      "Q4W", "QN", "Q4H", "UNKNOWN", "TWICE",
      "Q4H", "QD", "TID", "4 TIMES PER MONTH"
    ), dplyr::n(), replace = TRUE))


  # Optional WHO coding, which adds more `ATC` paths for randomly selected `CMDECOD`.
  if (who_coding) {
    n_cmdecod_path2 <- ceiling(nrow(lookup_cm) / 2)
    cmdecod_path2 <- sample(lookup_cm$CMDECOD, n_cmdecod_path2)
    ADCM_path2 <- ADCM %>% # nolint
      dplyr::filter(.data$CMDECOD %in% cmdecod_path2) %>%
      dplyr::mutate(
        ATC1 = paste(.data$ATC1, "p2"),
        ATC2 = paste(.data$ATC2, "p2"),
        ATC3 = paste(.data$ATC3, "p2"),
        ATC4 = paste(.data$ATC4, "p2")
      )

    n_cmdecod_path3 <- ceiling(length(cmdecod_path2) / 2)
    cmdecod_path3 <- sample(cmdecod_path2, n_cmdecod_path3)
    ADCM_path3 <- ADCM %>% # nolint
      dplyr::filter(.data$CMDECOD %in% cmdecod_path3) %>%
      dplyr::mutate(
        ATC1 = paste(.data$ATC1, "p3"),
        ATC2 = paste(.data$ATC2, "p3"),
        ATC3 = paste(.data$ATC3, "p3"),
        ATC4 = paste(.data$ATC4, "p3")
      )

    ADCM <- dplyr::bind_rows( # nolint
      ADCM,
      ADCM_path2,
      ADCM_path3
    )
  }

  ADCM <- ADCM %>% # nolint
    dplyr::mutate(
      ATC1CD = .data$ATC1,
      ATC2CD = .data$ATC2,
      ATC3CD = .data$ATC3,
      ATC4CD = .data$ATC4
    )

  # apply metadata
  ADCM <- apply_metadata(ADCM, "metadata/ADCM.yml") # nolint

  return(ADCM)
}
