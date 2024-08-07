#' Previous and Concomitant Medications Analysis Dataset (ADCM)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating random Concomitant Medication Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: `STUDYID`, `USUBJID`, `ASTDTM`, `CMSEQ`
#'
#' @inheritParams argument_convention
#' @param max_n_cms (`integer`)\cr Maximum number of concomitant medications per patient. Defaults to 10.
#' @param who_coding (`flag`)\cr Whether WHO coding (with multiple paths per medication) should be used.
#' @template param_cached
#' @templateVar data adcm
#'
#' @return `data.frame`
#' @export
#'
#' @examples
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' adcm <- radcm(adsl, seed = 2)
#' adcm
#'
#' adcm_who <- radcm(adsl, seed = 2, who_coding = TRUE)
#' adcm_who
radcm <- function(adsl,
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

  checkmate::assert_data_frame(adsl)
  checkmate::assert_integer(max_n_cms, len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)
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
  study_duration_secs <- lubridate::seconds(attr(adsl, "study_duration_secs"))

  adcm <- Map(function(id, sid) {
    n_cms <- sample(c(0, seq_len(max_n_cms)), 1)
    i <- sample(seq_len(nrow(lookup_cm)), n_cms, TRUE)
    dplyr::mutate(
      lookup_cm[i, ],
      USUBJID = id,
      STUDYID = sid
    )
  }, adsl$USUBJID, adsl$STUDYID) %>%
    Reduce(rbind, .) %>%
    `[`(c(4, 5, 1, 2, 3)) %>%
    dplyr::mutate(CMCAT = CMCLAS)

  adcm <- rcd_var_relabel(
    adcm,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add CM date and study day variables
  adcm <- dplyr::inner_join(
    adcm,
    adsl,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(TRTENDT = lubridate::date(dplyr::case_when(
      is.na(TRTEDTM) ~ lubridate::floor_date(lubridate::date(TRTSDTM) + study_duration_secs, unit = "day"),
      TRUE ~ TRTEDTM
    ))) %>%
    dplyr::mutate(ASTDTM = sample(
      seq(lubridate::as_datetime(TRTSDTM), lubridate::as_datetime(TRTENDT), by = "day"),
      size = 1
    )) %>%
    dplyr::mutate(ASTDY = ceiling(difftime(ASTDTM, TRTSDTM, units = "days"))) %>%
    # add 1 to end of range incase both values passed to sample() are the same
    dplyr::mutate(AENDTM = sample(
      seq(lubridate::as_datetime(ASTDTM), lubridate::as_datetime(TRTENDT + 1), by = "day"),
      size = 1
    )) %>%
    dplyr::mutate(AENDY = ceiling(difftime(AENDTM, TRTSDTM, units = "days"))) %>%
    dplyr::select(-TRTENDT) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(STUDYID, USUBJID, ASTDTM)

  adcm <- adcm %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(CMSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = CMSEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(STUDYID, USUBJID, ASTDTM, CMSEQ) %>%
    dplyr::mutate(
      ATC1 = paste("ATCCLAS1", substr(CMDECOD, 9, 9)),
      ATC2 = paste("ATCCLAS2", substr(CMDECOD, 9, 9)),
      ATC3 = paste("ATCCLAS3", substr(CMDECOD, 9, 9)),
      ATC4 = paste("ATCCLAS4", substr(CMDECOD, 9, 9))
    ) %>%
    dplyr::mutate(CMINDC = sample(c(
      "Nausea", "Hypertension", "Urticaria", "Fever",
      "Asthma", "Infection", "Diabete", "Diarrhea", "Pneumonia"
    ), dplyr::n(), replace = TRUE)) %>%
    dplyr::mutate(CMDOSE = sample(1:99, dplyr::n(), replace = TRUE)) %>%
    dplyr::mutate(CMTRT = substr(CMDECOD, 9, 13)) %>%
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
    ), dplyr::n(), replace = TRUE)) %>%
    dplyr::mutate(
      # use 1 year as reference time point
      CMSTRTPT = dplyr::case_when(
        ASTDY <= 365 ~ "BEFORE",
        ASTDY > 365 ~ "AFTER",
        is.na(ASTDY) ~ "U"
      ),
      CMENRTPT = dplyr::case_when(
        EOSSTT %in% c("COMPLETED", "DISCONTINUED") ~ "BEFORE",
        EOSSTT == "ONGOING" ~ "ONGOING",
        is.na(EOSSTT) ~ "U"
      ),
      ADURN = as.numeric(difftime(ASTDTM, AENDTM, units = "days")),
      ADURU = "days"
    )


  # Optional WHO coding, which adds more `ATC` paths for randomly selected `CMDECOD`.
  if (who_coding) {
    n_cmdecod_path2 <- ceiling(nrow(lookup_cm) / 2)
    cmdecod_path2 <- sample(lookup_cm$CMDECOD, n_cmdecod_path2)
    adcm_path2 <- adcm %>%
      dplyr::filter(CMDECOD %in% cmdecod_path2) %>%
      dplyr::mutate(
        ATC1 = paste(ATC1, "p2"),
        ATC2 = paste(ATC2, "p2"),
        ATC3 = paste(ATC3, "p2"),
        ATC4 = paste(ATC4, "p2")
      )

    n_cmdecod_path3 <- ceiling(length(cmdecod_path2) / 2)
    cmdecod_path3 <- sample(cmdecod_path2, n_cmdecod_path3)
    adcm_path3 <- adcm %>%
      dplyr::filter(CMDECOD %in% cmdecod_path3) %>%
      dplyr::mutate(
        ATC1 = paste(ATC1, "p3"),
        ATC2 = paste(ATC2, "p3"),
        ATC3 = paste(ATC3, "p3"),
        ATC4 = paste(ATC4, "p3")
      )

    adcm <- dplyr::bind_rows(
      adcm,
      adcm_path2,
      adcm_path3
    )
  }

  adcm <- adcm %>%
    dplyr::mutate(
      ATC1CD = ATC1,
      ATC2CD = ATC2,
      ATC3CD = ATC3,
      ATC4CD = ATC4
    )

  if (length(na_vars) > 0 && na_percentage > 0) {
    adcm <- mutate_na(ds = adcm, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  adcm <- apply_metadata(adcm, "metadata/ADCM.yml")

  return(adcm)
}
