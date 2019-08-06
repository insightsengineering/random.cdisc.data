#' Laboratory Data Analysis Dataset (ADLB)
#'
#' Function for generating random dataset from Laboratory Data Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: STUDYID USUBJID PARAMCD AVISITN.
#'
#' @template ADSL_params
#' @template BDS_findings_params
#' @param paramu As character string. list of parameter unit values.
#' @templateVar data adlb
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @importFrom dplyr case_when mutate
#' @importFrom magrittr %>%
#' @importFrom stats rnorm
#'
#' @export
#'
#' @author tomlinsj, npaszty
#'
#' @examples
#' ADSL <- radsl(N = 10, seed = 1)
#' radlb(ADSL, visit_format = "WEEK", n_assessments = 7L, seed = 2)
#' radlb(ADSL, param = c("Immunoglobulin A Measurement", "Immunoglobulin G Measurement"),
#'   paramcd = c("IGA", "IGG"), paramu = c("g/L", "g/L"), seed = 2)
#' radlb(ADSL, visit_format = "CYCLE", n_assessments = 3L, seed = 2)
radlb <- function(ADSL, # nolint
                  param = c("Alanine Aminotransferase Measurement",
                            "C-Reactive Protein Measurement",
                            "Immunoglobulin A Measurement"),
                  paramcd = c("ALBSI", "ALBCV", "ALBLS"),
                  paramu = c("U/L", "mg/L", "g/L"),
                  visit_format = "WEEK",
                  n_assessments = 5L,
                  n_days = 5L,
                  seed = NULL,
                  cached = FALSE) {

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

  # validate and initialize related variables
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

  ADLB$AVAL <- rnorm(nrow(ADLB), mean = 50, sd = 8) # nolint

  # assign related variable values: PARAMxPARAMCD are related
  ADLB$PARAMCD <- as.factor(rel_var( # nolint
    df = ADLB,
    var_name = "PARAMCD",
    var_values = param_init_list$relvar2,
    related_var = "PARAM"
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
                      ifelse(toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1", "Y", ""))
    x$LOQFL <- ifelse(x$AVAL < 32, "Y", "N") # nolint
    x
  }))

  ADLB$BASE2 <- retain(ADLB, ADLB$AVAL, ADLB$ABLFL2 == "Y") # nolint
  ADLB$BASE <- ifelse(ADLB$ABLFL2 != "Y", retain(ADLB, ADLB$AVAL, ADLB$ABLFL == "Y"), NA) # nolint

  ADLB <- ADLB %>% # nolint
    mutate(CHG2 = AVAL - BASE2) %>%
    mutate(PCHG2 = 100 * (CHG2 / BASE2)) %>%
    mutate(CHG = AVAL - BASE) %>%
    mutate(PCHG = 100 * (CHG / BASE)) %>%
    var_relabel(
      STUDYID = attr(ADSL$STUDYID, "label"),
      USUBJID = attr(ADSL$USUBJID, "label")
    )

  # apply metadata
  ADLB <- apply_metadata(ADLB, "metadata/ADLB.yml", seed = seed, ADSL = ADSL) # nolint

  ADLB
}
