#' Laboratory Data Analysis Dataset (ADLB)
#'
#' Function for generating random dataset from Laboratory Data Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: STUDYID, USUBJID, PARAMCD, BASETYPE, AVISITN, ATPTN, DTYPE, ADTM, LBSEQ, ASPID.
#'
#' @template ADSL_params
#' @template BDS_findings_params
#' @param lbcat As character string. list of lb category values.
#' @param paramu As character string. list of parameter unit values.
#' @param max_n_lbs As numeric. maximum number of labs.
#' @param lookup control lookup process.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data adlb
#' @template param_cached
#' @template return_data.frame
#'
#' @importFrom dplyr case_when mutate arrange
#' @importFrom magrittr %>%
#' @importFrom stats rnorm
#'
#' @export
#'
#' @author tomlinsj, npaszty, Xuefeng Hou
#'
#' @examples
#' library(dplyr)
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' ADLB <- radlb(ADSL, visit_format = "WEEK", n_assessments = 7L, seed = 2)
#' ADLB <- radlb(ADSL, visit_format = "CYCLE", n_assessments = 2L, seed = 2)
#' head(ADLB)
radlb <- function(ADSL, # nolint
                  lbcat = c("CHEMISTRY", "CHEMISTRY", "IMMUNOLOGY"),
                  param = c("Alanine Aminotransferase Measurement",
                      "C-Reactive Protein Measurement", "Immunoglobulin A Measurement"),
                  paramcd = c("ALT", "CRP", "IGA"),
                  paramu = c("U/L", "mg/L", "g/L"),
                  visit_format = "WEEK",
                  n_assessments = 5L,
                  n_days = 5L,
                  max_n_lbs = 10,
                  seed = NULL,
                  cached = FALSE,
                  lookup = NULL,
                  na_percentage = 0,
                  na_vars = list(
                    LOQFL = c(NA, 0.1), ABLFL2 = c(1234, 0.1), ABLFL = c(1235, 0.1),
                    BASE2 = c(NA, 0.1), BASE = c(NA, 0.1),
                    CHG2 = c(1235, 0.1), PCHG2 = c(1235, 0.1), CHG = c(1234, 0.1), PCHG = c(1234, 0.1)
                  )) {
  stopifnot(is.logical.single(cached))
  if (cached) {
    return(get_cached_data("cadlb"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is.character.vector(param))
  stopifnot(is.character.vector(paramcd))
  stopifnot(is.character.vector(paramu))
  stopifnot(is.character.single(visit_format))
  stopifnot(is.integer.single(n_assessments))
  stopifnot(is.integer.single(n_days))
  stopifnot(is.null(seed) || is.numeric.single(seed))
  stopifnot((na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  # validate and initialize related variables
  lbcat_init_list <- relvar_init(param, lbcat)
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADLB <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days),
    stringsAsFactors = FALSE
  )

  # nolint start
  ADLB$AVAL <- rnorm(nrow(ADLB), mean = 50, sd = 8)
  ADLB$LBSTRESC <- ADLB$AVAL

  # assign related variable values: PARAMxLBCAT are related
  ADLB$LBCAT <- as.factor(rel_var( # nolint
    df = ADLB,
    var_name = "LBCAT",
    var_values = lbcat_init_list$relvar2,
    related_var = "PARAM"
  ))

    # assign related variable values: PARAMxPARAMCD are related
  ADLB$PARAMCD <- as.factor(rel_var( # nolint
    df = ADLB,
    var_name = "PARAMCD",
    var_values = param_init_list$relvar2,
    related_var = "PARAM"
  ))

  ADLB <- ADLB %>% mutate(AVISITN = case_when(
    AVISIT == "SCREENING" ~ -1,
    AVISIT == "BASELINE" ~ 0,
    (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
    TRUE ~ NA_real_
  ))

  ADLB$AVALU <- as.factor(rel_var( # nolint
    df = ADLB,
    var_name = "AVALU",
    var_values = unit_init_list$relvar2,
    related_var = "PARAM"
  ))

  ADLB <- ADLB %>% # nolint
    mutate(AVISITN = case_when(
      AVISIT == "SCREENING" ~ -1,
      AVISIT == "BASELINE" ~ 0,
      (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
      TRUE ~ NA_real_
    ))

  # order to prepare for change from screening and baseline values
  ADLB <- ADLB[order(ADLB$STUDYID, ADLB$USUBJID, ADLB$PARAMCD, ADLB$AVISITN), ] # nolint

  ADLB <- Reduce(rbind, lapply(split(ADLB, ADLB$USUBJID), function(x) { # nolint
    x$STUDYID <- ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])] # nolint
    x$ABLFL2 <- ifelse(x$AVISIT == "SCREENING", "Y", "") # nolint
    x$ABLFL <- ifelse(toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE", # nolint
      "Y",
      ifelse(toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1", "Y", "")
    )
    x$LOQFL <- ifelse(x$AVAL < 32, "Y", "N") # nolint
    x
  }))

  ADLB$BASE2 <- retain(ADLB, ADLB$AVAL, ADLB$ABLFL2 == "Y") # nolint
  ADLB$BASE <- ifelse(ADLB$ABLFL2 != "Y", retain(ADLB, ADLB$AVAL, ADLB$ABLFL == "Y"), NA) # nolint

  ANRIND_choices <- c("HIGH", "LOW", "NORMAL")

  ADLB <- ADLB %>% # nolint
    mutate(CHG2 = AVAL - BASE2) %>%
    mutate(PCHG2 = 100 * (CHG2 / BASE2)) %>%
    mutate(CHG = AVAL - BASE) %>%
    mutate(PCHG = 100 * (CHG / BASE)) %>%
    mutate(ANRIND = ANRIND_choices %>% sample_fct(nrow(ADLB), prob = c(0.1, 0.1, 0.8))) %>%
    mutate(BASETYPE = "LAST") %>%
    mutate(ATPTN = 1) %>%
    mutate(DTYPE = NA) %>%
    var_relabel(
      STUDYID = attr(ADSL$STUDYID, "label"),
      USUBJID = attr(ADSL$USUBJID, "label")
    )

  if ((na_percentage > 0 && na_percentage <= 1) || length(na_vars) > 0) {
    ADLB <- mutate_na(ds = ADLB, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADLB <- ADLB %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier"
    )

  # merge ADSL to be able to add LB date and study day variables
  ADLB <- inner_join(ADSL[, c("STUDYID", "USUBJID", "TRTSDTM", "TRTEDTM", "study_duration_secs")],
                     ADLB, by = c("STUDYID", "USUBJID")) %>%
    rowwise() %>%
    mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    mutate(trtedt_int = case_when(
      !is.na(.data$TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(.data$TRTEDTM) ~ floor(.data$trtsdt_int + (study_duration_secs)/86400)
    )) %>%
    mutate(ADTM = as.POSIXct((sample(.data$trtsdt_int:.data$trtedt_int, size = 1)*86400), origin = "1970-01-01")) %>%
    mutate(astdt_int = as.numeric(as.Date(.data$ADTM))) %>%
    mutate(ADY = ceiling(as.numeric(difftime(.data$ADTM, .data$TRTSDTM, units = "days")))) %>%
    ungroup() %>%
    arrange(STUDYID, .data$USUBJID, .data$ADTM)

  ADLB <- ADLB %>%
    mutate(ASPID = sample(1:n())) %>%
    group_by(.data$USUBJID) %>%
    mutate(LBSEQ = 1:n()) %>%
    mutate(ASEQ = .data$LBSEQ) %>%
    arrange(STUDYID, .data$USUBJID, .data$PARAMCD, .data$BASETYPE,
        .data$AVISITN, .data$ATPTN, .data$DTYPE, .data$ADTM, .data$LBSEQ, .data$ASPID)

  # apply metadata
  ADLB <- apply_metadata(ADLB, "metadata/ADLB.yml", seed = seed, ADSL = ADSL)

  # nolint end

  return(ADLB)
}
