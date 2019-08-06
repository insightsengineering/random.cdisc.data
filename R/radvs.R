#' Vital Signs Analysis Dataset (ADVS)
#'
#' Function for generating random dataset from Vital Signs Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: STUDYID USUBJID PARAMCD AVISITN.
#'
#' @template ADSL_params
#' @template BDS_findings_params
#' @param paramu As character string. list of parameter unit values.
#' @templateVar data advs
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
#' @author npaszty
#'
#' @examples
#' ADSL <- radsl(seed = 1)
#' ADVS <- radvs(ADSL, visit_format = "WEEK", n_assessments = 7L, seed = 2)
#' ADVS <- radvs(ADSL, visit_format = "CYCLE", n_assessments = 3L, seed = 2)
#' head(ADVS)
radvs <- function(ADSL, # nolint
                  param = c("Diastolic Blood Pressure",
                            "Pulse Rate",
                            "Respiratory Rate",
                            "Systolic Blood Pressure",
                            "Temperature", "Weight"),
                  paramcd = c("DIABP", "PULSE", "RESP", "SYSBP", "TEMP", "WEIGHT"),
                  paramu = c("Pa", "beats/min", "breaths/min", "Pa", "C", "Kg"),
                  visit_format = "WEEK",
                  n_assessments = 5L,
                  n_days = 5L,
                  seed = NULL,
                  cached = FALSE) {

  stopifnot(is.logical.single(cached))
  if (cached) {
    return(get_cached_data("cadvs"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is.character.vector(param))
  stopifnot(is.character.vector(paramcd))
  stopifnot(is.character.vector(paramu))
  stopifnot(is.character.single(visit_format))
  stopifnot(is.integer.single(n_assessments))
  stopifnot(is.integer.single(n_days))

  # validate and initialize param vectors
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADVS <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments),
    stringsAsFactors = FALSE
  )

  ADVS <- ADVS %>% # nolint
    mutate(AVISITN = case_when(
      AVISIT == "SCREENING" ~ -1,
      AVISIT == "BASELINE" ~ 0,
      (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
      TRUE ~ NA_real_
    ))

  # assign related variable values: PARAMxPARAMCD are related
  ADVS$PARAMCD <- as.factor(rel_var( # nolint
    df = ADVS,
    var_name = "PARAMCD",
    var_values = param_init_list$relvar2,
    related_var = "PARAM"
  ))
  ADVS$AVALU <- as.factor(rel_var( # nolint
    df = ADVS,
    var_name = "AVALU",
    var_values = unit_init_list$relvar2,
    related_var = "PARAM"
  ))

  ADVS$AVAL <- rnorm(nrow(ADVS), mean = 50, sd = 8) # nolint

  # order to prepare for change from screening and baseline values
  ADVS <- ADVS[order(ADVS$STUDYID, ADVS$USUBJID, ADVS$PARAMCD, ADVS$AVISITN), ] # nolint

  ADVS <- Reduce(rbind, lapply(split(ADVS, ADVS$USUBJID), function(x) { # nolint
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
  }))

  ADVS$BASE2 <- retain(ADVS, ADVS$AVAL, ADVS$ABLFL2 == "Y") # nolint
  ADVS$BASE <- ifelse(ADVS$ABLFL2 != "Y", retain(ADVS, ADVS$AVAL, ADVS$ABLFL == "Y"), NA) # nolint

  ADVS <- ADVS %>% # nolint
    mutate(CHG2 = AVAL - BASE2) %>%
    mutate(PCHG2 = 100 * (CHG2 / BASE2)) %>%
    mutate(CHG = AVAL - BASE) %>%
    mutate(PCHG = 100 * (CHG / BASE)) %>%
    var_relabel(
      USUBJID = attr(ADSL$USUBJID, "label"),
      STUDYID = attr(ADSL$STUDYID, "label")
    )

  apply_metadata(ADVS, "metadata/ADVS.yml", seed = seed, ADSL = ADSL)
}
