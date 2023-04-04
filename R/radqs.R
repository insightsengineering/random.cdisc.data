#' Questionnaires Analysis Dataset (ADQS)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating a random Questionnaires Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: `STUDYID`, `USUBJID`, `PARAMCD`, `AVISITN`
#'
#' @inheritParams argument_convention
#' @template param_cached
#' @templateVar data adqs
#'
#' @return `data.frame`
#' @export
#'
#' @author npaszty
#'
#' @examples
#' library(random.cdisc.data)
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' ADQS <- radqs(adsl, visit_format = "WEEK", n_assessments = 7L, seed = 2)
#' ADQS
#'
#' ADQS <- radqs(adsl, visit_format = "CYCLE", n_assessments = 3L, seed = 2)
#' ADQS
radqs <- function(adsl,
                  param = c(
                    "BFI All Questions",
                    "Fatigue Interference",
                    "Function/Well-Being (GF1,GF3,GF7)",
                    "Treatment Side Effects (GP2,C5,GP5)",
                    "FKSI-19 All Questions"
                  ),
                  paramcd = c("BFIALL", "FATIGI", "FKSI-FWB", "FKSI-TSE", "FKSIALL"),
                  visit_format = "WEEK",
                  n_assessments = 5L,
                  n_days = 5L,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(
                    LOQFL = c(NA, 0.1), ABLFL2 = c(1234, 0.1), ABLFL = c(1235, 0.1),
                    CHG2 = c(1235, 0.1), PCHG2 = c(1235, 0.1), CHG = c(1234, 0.1), PCHG = c(1234, 0.1)
                  ),
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadqs"))
  }

  checkmate::assert_data_frame(adsl)
  checkmate::assert_character(param, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramcd, min.len = 1, any.missing = FALSE)
  checkmate::assert_string(visit_format)
  checkmate::assert_integer(n_assessments, len = 1, any.missing = FALSE)
  checkmate::assert_integer(n_days, len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  # validate and initialize param vectors
  param_init_list <- relvar_init(param, paramcd)

  if (!is.null(seed)) {
    set.seed(seed)
  }
  study_duration_secs <- lubridate::seconds(attr(adsl, "study_duration_secs"))

  ADQS <- expand.grid(
    STUDYID = unique(adsl$STUDYID),
    USUBJID = adsl$USUBJID,
    PARAM = param_init_list$relvar1,
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days),
    stringsAsFactors = FALSE
  )

  ADQS <- dplyr::mutate(
    ADQS,
    AVISITN = dplyr::case_when(
      AVISIT == "SCREENING" ~ -1,
      AVISIT == "BASELINE" ~ 0,
      (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
      TRUE ~ NA_real_
    )
  )

  # assign related variable values: PARAMxPARAMCD are related
  ADQS <- ADQS %>% rel_var(
    var_name = "PARAMCD",
    related_var = "PARAM",
    var_values = param_init_list$relvar2
  )

  ADQS$AVAL <- stats::rnorm(nrow(ADQS), mean = 50, sd = 8) + ADQS$AVISITN * stats::rnorm(nrow(ADQS), mean = 5, sd = 2)

  # order to prepare for change from screening and baseline values
  ADQS <- ADQS[order(ADQS$STUDYID, ADQS$USUBJID, ADQS$PARAMCD, ADQS$AVISITN), ]

  ADQS <- Reduce(
    rbind,
    lapply(
      split(ADQS, ADQS$USUBJID),
      function(x) {
        x$STUDYID <- adsl$STUDYID[which(adsl$USUBJID == x$USUBJID[1])]
        x$ABLFL2 <- ifelse(x$AVISIT == "SCREENING", "Y", "")
        x$ABLFL <- ifelse(
          toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE",
          "Y",
          ifelse(
            toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1",
            "Y",
            ""
          )
        )
        x$LOQFL <- ifelse(x$AVAL < 32, "Y", "N")
        x
      }
    )
  )

  ADQS$BASE2 <- retain(ADQS, ADQS$AVAL, ADQS$ABLFL2 == "Y")
  ADQS$BASE <- ifelse(ADQS$ABLFL2 != "Y", retain(ADQS, ADQS$AVAL, ADQS$ABLFL == "Y"), NA)

  ADQS <- ADQS %>%
    dplyr::mutate(CHG2 = AVAL - BASE2) %>%
    dplyr::mutate(PCHG2 = 100 * (CHG2 / BASE2)) %>%
    dplyr::mutate(CHG = AVAL - BASE) %>%
    dplyr::mutate(PCHG = 100 * (CHG / BASE)) %>%
    var_relabel(
      STUDYID = attr(adsl$STUDYID, "label"),
      USUBJID = attr(adsl$USUBJID, "label")
    )

  ADQS <- var_relabel(
    ADQS,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add QS date and study day variables
  ADQS <- dplyr::inner_join(
    ADQS,
    adsl,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(TRTENDT = lubridate::date(dplyr::case_when(
      is.na(TRTEDTM) ~ lubridate::floor_date(lubridate::date(TRTSDTM) + study_duration_secs, unit = "day"),
      TRUE ~ TRTEDTM
    ))) %>%
    ungroup()

  ADQS <- ADQS %>%
    group_by(USUBJID) %>%
    arrange(USUBJID, AVISITN) %>%
    dplyr::mutate(ADTM = rep(
      sort(sample(
        seq(lubridate::as_datetime(TRTSDTM[1]), lubridate::as_datetime(TRTENDT[1]), by = "day"),
        size = nlevels(AVISIT)
      )),
      each = n() / nlevels(AVISIT)
    )) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(ADY = ceiling(difftime(ADTM, TRTSDTM, units = "days"))) %>%
    dplyr::select(-TRTENDT) %>%
    dplyr::arrange(STUDYID, USUBJID, ADTM)

  ADQS <- ADQS %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(QSSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = QSSEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      STUDYID,
      USUBJID,
      PARAMCD,
      AVISITN,
      ADTM,
      QSSEQ
    )

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADQS <- mutate_na(ds = ADQS, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  ADQS <- apply_metadata(ADQS, "metadata/ADQS.yml")

  return(ADQS)
}
