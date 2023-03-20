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
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' ADQS <- radqs(ADSL, visit_format = "WEEK", n_assessments = 7L, seed = 2)
#' ADQS
#'
#' ADQS <- radqs(ADSL, visit_format = "CYCLE", n_assessments = 3L, seed = 2)
#' ADQS
radqs <- function(ADSL,
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

  checkmate::assert_data_frame(ADSL)
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

  ADQS <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
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
        x$STUDYID <- ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])]
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
    dplyr::mutate(CHG2 = .data$AVAL - .data$BASE2) %>%
    dplyr::mutate(PCHG2 = 100 * (.data$CHG2 / .data$BASE2)) %>%
    dplyr::mutate(CHG = .data$AVAL - .data$BASE) %>%
    dplyr::mutate(PCHG = 100 * (.data$CHG / .data$BASE)) %>%
    var_relabel(
      STUDYID = attr(ADSL$STUDYID, "label"),
      USUBJID = attr(ADSL$USUBJID, "label")
    )

  ADQS <- var_relabel(
    ADQS,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add QS date and study day variables
  ADQS <- dplyr::inner_join(
    ADQS,
    ADSL,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    dplyr::mutate(trtedt_int = dplyr::case_when(
      !is.na(TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(TRTEDTM) ~ floor(.data$trtsdt_int + (.data$study_duration_secs) / 86400)
    )) %>%
    ungroup()

  ADQS <- ADQS %>%
    group_by(USUBJID) %>%
    arrange(USUBJID, AVISITN) %>%
    dplyr::mutate(ADTM = rep(
      sort(as.POSIXct(
        sample(.data$trtsdt_int[1]:.data$trtedt_int[1], size = nlevels(AVISIT)) * 86400,
        origin = "1970-01-01"
      )),
      each = n() / nlevels(AVISIT)
    )) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(ADY = ceiling(as.numeric(difftime(.data$ADTM, .data$TRTSDTM, units = "days")))) %>%
    dplyr::select(-"trtsdt_int", -"trtedt_int") %>%
    dplyr::arrange(.data$STUDYID, .data$USUBJID, .data$ADTM)

  ADQS <- ADQS %>%
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(QSSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = .data$QSSEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      .data$STUDYID,
      .data$USUBJID,
      .data$PARAMCD,
      .data$AVISITN,
      .data$ADTM,
      .data$QSSEQ
    )

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADQS <- mutate_na(ds = ADQS, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  ADQS <- apply_metadata(ADQS, "metadata/ADQS.yml")

  return(ADQS)
}
