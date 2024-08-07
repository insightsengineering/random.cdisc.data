#' Protocol Deviations Analysis Dataset (ADDV)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating random Protocol Deviations Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: `STUDYID`, `USUBJID`, `ASTDT`, `DVTERM`, `DVSEQ`
#'
#' @inheritParams argument_convention
#' @param max_n_dv (`integer`)\cr Maximum number of deviations per patient. Defaults to 3.
#' @param p_dv (`proportion`)\cr Probability of a patient having protocol deviations.
#' @template param_cached
#' @templateVar data addv
#'
#' @return `data.frame`
#' @export
#'
#' @examples
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' addv <- raddv(adsl, seed = 2)
#' addv
raddv <- function(adsl,
                  max_n_dv = 3L,
                  p_dv = 0.15,
                  lookup = NULL,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(
                    "ASTDT" = c(seed = 1234, percentage = 0.1),
                    "DVCAT" = c(seed = 1234, percentage = 0.1)
                  ),
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("caddv"))
  }

  checkmate::assert_data_frame(adsl)
  checkmate::assert_integer(max_n_dv, len = 1, lower = 1, any.missing = FALSE)
  checkmate::assert_number(p_dv, lower = .Machine$double.xmin, upper = 1)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  if (!is.null(seed)) set.seed(seed)
  study_duration_secs <- lubridate::seconds(attr(adsl, "study_duration_secs"))

  checkmate::assert_data_frame(lookup, null.ok = TRUE)
  lookup_dv <- if (!is.null(lookup)) {
    lookup
  } else {
    tibble::tribble(
      ~DOMAIN, ~DVCAT, ~DVDECOD, ~DVTERM, ~DVREAS, ~DVEPRELI,
      "DV", "MAJOR", "EXCLUSION CRITERIA", "Received prior prohibited therapy or medication", "", "N",
      "DV", "MAJOR", "EXCLUSION CRITERIA", "Active or untreated or other excluded cns metastases", "", "N",
      "DV", "MAJOR", "EXCLUSION CRITERIA", "History of other malignancies within the last 5 years", "", "N",
      "DV", "MAJOR", "EXCLUSION CRITERIA", "Uncontrolled concurrent condition", "", "N",
      "DV", "MAJOR", "EXCLUSION CRITERIA", "Other exclusion criteria", "", "N",
      "DV", "MAJOR", "EXCLUSION CRITERIA", "Pregnancy criteria", "", "N",
      "DV", "MAJOR", "INCLUSION CRITERIA", "Does not meet prior therapy requirements", "", "N",
      "DV", "MAJOR", "INCLUSION CRITERIA", "Inclusion lab values outside allowed limits", "", "N",
      "DV", "MAJOR", "INCLUSION CRITERIA", "No signed ICF at study entry", "", "N",
      "DV", "MAJOR", "INCLUSION CRITERIA", "Inclusion-related test not done/out of window", "", "N",
      "DV", "MAJOR", "INCLUSION CRITERIA", "Ineligible cancer type or current cancer stage", "", "N",
      "DV", "MAJOR", "MEDICATION", "Dose missed or significantly out of window",
      "Site action due to epidemic/pandemic", "Y",
      "DV", "MAJOR", "MEDICATION", "Received incorrect study medication", "", "N",
      "DV", "MAJOR", "MEDICATION", "Received prohibited concomitant medication", "", "N",
      "DV", "MAJOR", "MEDICATION", "Discontinued study drug for unspecified reason", "", "N",
      "DV", "MAJOR", "MEDICATION", "Significant deviation from planned dose",
      "Site action due to epidemic/pandemic", "Y",
      "DV", "MAJOR", "PROCEDURAL", "Missed assessment affecting safety/study outcomes", "", "N",
      "DV", "MAJOR", "PROCEDURAL", "Eligibility-related test not done/out of window", "", "N",
      "DV", "MAJOR", "PROCEDURAL", "Failure to sign updated ICF within two visits",
      "Site action due to epidemic/pandemic", "Y",
      "DV", "MAJOR", "PROCEDURAL", "Omission of complete lab panel required by protocol", "", "N",
      "DV", "MAJOR", "PROCEDURAL", "Omission of screening tumor assessment", "", "N",
      "DV", "MAJOR", "PROCEDURAL", "Missed 2 or more efficacy assessments",
      "Site action due to epidemic/pandemic", "Y"
    )
  }


  addv <- Map(
    function(id, sid) {
      n_dv <- stats::rbinom(1, 1, p_dv) * sample(c(1, seq_len(max_n_dv)), 1)
      i <- sample(seq_len(nrow(lookup_dv)), n_dv, TRUE)
      dplyr::mutate(
        lookup_dv[i, ],
        USUBJID = id,
        STUDYID = sid
      )
    },
    adsl$USUBJID,
    adsl$STUDYID
  ) %>%
    Reduce(rbind, .) %>%
    dplyr::mutate(DVSCAT = DVCAT)

  addv <- rcd_var_relabel(
    addv,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add deviation date and study day variables
  addv <- dplyr::inner_join(addv, adsl, by = c("STUDYID", "USUBJID")) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(TRTENDT = lubridate::date(dplyr::case_when(
      is.na(TRTEDTM) ~ lubridate::floor_date(lubridate::date(TRTSDTM) + study_duration_secs, unit = "day"),
      TRUE ~ TRTEDTM
    ))) %>%
    dplyr::mutate(ASTDTM = sample(
      seq(lubridate::as_datetime(TRTSDTM), lubridate::as_datetime(TRTENDT), by = "day"),
      size = 1
    )) %>%
    dplyr::mutate(ASTDT = lubridate::date(ASTDTM)) %>%
    dplyr::mutate(ASTDY = ceiling(difftime(ASTDTM, TRTSDTM, units = "days"))) %>%
    dplyr::select(-TRTENDT, -ASTDTM) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(STUDYID, USUBJID, ASTDT, DVTERM)

  addv <- addv %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(DVSEQ = seq_len(dplyr::n())) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(STUDYID, USUBJID, ASTDT, DVTERM, DVSEQ)

  addv <- addv %>%
    dplyr::mutate(AEPRELFL = ifelse(DVEPRELI == "Y", DVEPRELI, ""))

  if (length(na_vars) > 0 && na_percentage > 0) {
    addv <- mutate_na(ds = addv, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  addv <- apply_metadata(addv, "metadata/ADDV.yml")

  return(addv)
}
