#' Questionnaires Analysis Dataset (ADQS)
#'
#' Function for generating random Questionnaires Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: STUDYID USUBJID PARAMCD AVISITN.
#'
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @template ADSL_params
#' @template BDS_findings_params
#' @templateVar data adqs
#' @template param_cached
#' @template return_data.frame
#'
#' @importFrom dplyr arrange case_when group_by mutate n rowwise select ungroup
#' @importFrom magrittr %>%
#' @importFrom stats rnorm
#'
#' @export
#'
#' @author npaszty
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' radqs(ADSL, visit_format = "WEEK", n_assessments = 7L, seed = 2)
#' radqs(ADSL, visit_format = "CYCLE", n_assessments = 3L, seed = 2)
radqs <- function(ADSL, # nolint
                  param = c("BFI All Questions",
                            "Fatigue Interference",
                            "Function/Well-Being (GF1,GF3,GF7)",
                            "Treatment Side Effects (GP2,C5,GP5)",
                            "FKSI-19 All Questions"),
                  paramcd = c("BFIALL", "FATIGI", "FKSI-FWB", "FKSI-TSE", "FKSIALL"),
                  visit_format = "WEEK",
                  n_assessments = 5L,
                  n_days = 5L,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(LOQFL = c(NA, 0.1), ABLFL2 = c(1234, 0.1), ABLFL = c(1235, 0.1),
                                 CHG2 = c(1235, 0.1), PCHG2 = c(1235, 0.1), CHG = c(1234, 0.1), PCHG = c(1234, 0.1)
                  ),
                  cached = FALSE) {

  stopifnot(is_logical_single(cached))
  if (cached) {
    return(get_cached_data("cadqs"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is_character_vector(param))
  stopifnot(is_character_vector(paramcd))
  stopifnot(is_character_single(visit_format))
  stopifnot(is_integer_single(n_assessments))
  stopifnot(is_integer_single(n_days))
  stopifnot(is.null(seed) || is_numeric_single(seed))
  stopifnot((is_numeric_single(na_percentage) && na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  # validate and initialize param vectors
  param_init_list <- relvar_init(param, paramcd)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADQS <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = param_init_list$relvar1,
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days),
    stringsAsFactors = FALSE
  )

  ADQS <- mutate( # nolint
    ADQS,
    AVISITN = case_when(
      AVISIT == "SCREENING" ~ -1,
      AVISIT == "BASELINE" ~ 0,
      (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
      TRUE ~ NA_real_
    )
  )

  # assign related variable values: PARAMxPARAMCD are related
  ADQS$PARAMCD <- rel_var(df = ADQS, var_name = "PARAMCD", var_values = param_init_list$relvar2, related_var = "PARAM") # nolint

  ADQS$AVAL <- rnorm(nrow(ADQS), mean = 50, sd = 8) + ADQS$AVISITN * rnorm(nrow(ADQS), mean = 5, sd = 2) # nolint

  # order to prepare for change from screening and baseline values
  ADQS <- ADQS[order(ADQS$STUDYID, ADQS$USUBJID, ADQS$PARAMCD, ADQS$AVISITN), ] # nolint

  ADQS <- Reduce( # nolint
    rbind,
    lapply(
      split(ADQS, ADQS$USUBJID),
      function(x) {
        x$STUDYID <- ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])] # nolint
        x$ABLFL2 <- ifelse(x$AVISIT == "SCREENING", "Y", "") # nolint
        x$ABLFL <- ifelse( # nolint
          toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE",
          "Y",
          ifelse(
            toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1",
            "Y",
            ""
          )
        )
        x$LOQFL <- ifelse(x$AVAL < 32, "Y", "N") # nolint
        x
      }
    )
  )

  ADQS$BASE2 <- retain(ADQS, ADQS$AVAL, ADQS$ABLFL2 == "Y") # nolint
  ADQS$BASE <- ifelse(ADQS$ABLFL2 != "Y", retain(ADQS, ADQS$AVAL, ADQS$ABLFL == "Y"), NA) # nolint

  ADQS <- ADQS %>% # nolint
    mutate(CHG2 = .data$AVAL - .data$BASE2) %>%
    mutate(PCHG2 = 100 * (.data$CHG2 / .data$BASE2)) %>%
    mutate(CHG = .data$AVAL - .data$BASE) %>%
    mutate(PCHG = 100 * (.data$CHG / .data$BASE)) %>%
    var_relabel(
      STUDYID = attr(ADSL$STUDYID, "label"),
      USUBJID = attr(ADSL$USUBJID, "label")
    )

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADQS <- mutate_na(ds = ADQS, na_vars = na_vars, na_percentage = na_percentage) #nolint
  }

  ADQS <- var_relabel( # nolint
    ADQS,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add QS date and study day variables
  ADQS <- inner_join(ADSL, # nolint
                     ADQS,
                     by = c("STUDYID", "USUBJID")) %>%
    rowwise() %>%
    mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    mutate(trtedt_int = case_when(
      !is.na(TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(TRTEDTM) ~ floor(.data$trtsdt_int + (.data$study_duration_secs) / 86400)
    )) %>%
    mutate(ADTM = as.POSIXct((sample(.data$trtsdt_int:.data$trtedt_int, size = 1) * 86400), origin = "1970-01-01")) %>%
    mutate(ADY = ceiling(as.numeric(difftime(.data$ADTM, .data$TRTSDTM, units = "days")))) %>%
    select(-.data$trtsdt_int, -.data$trtedt_int) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$ADTM)

  ADQS <- ADQS %>% # nolint
    group_by(.data$USUBJID) %>%
    mutate(QSSEQ = 1:n()) %>%
    mutate(ASEQ = .data$QSSEQ) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$PARAMCD, .data$AVISITN, .data$ADTM, .data$QSSEQ)

  # apply metadata
  ADQS <- apply_metadata(ADQS, "metadata/ADQS.yml") # nolint

  return(ADQS)
}
