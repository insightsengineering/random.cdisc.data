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
#' @inheritParams radsl
#' @inheritParams mutate_NA
#' @templateVar data advs
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @import dplyr
#' @importFrom yaml yaml.load_file
#'
#' @export
#'
#' @author npaszty
#'
#' @examples
#' ADSL <- radsl(seed = 1)
#' ADVS <- radvs(ADSL, visit_format = "WEEK", n_assessments = 7, seed = 2)
#' ADVS <- radvs(ADSL, visit_format = "CYCLE", n_assessments = 3, seed = 2)
#' head(ADVS)
#'
radvs <- function(ADSL,
                  param = c("Diastolic Blood Pressure", "Pulse Rate", "Respiratory Rate", "Systolic Blood Pressure",
                            "Temperature", "Weight"),
                  paramcd = c("DIABP", "PULSE", "RESP", "SYSBP", "TEMP", "WEIGHT"),
                  paramu = c("Pa", "beats/min", "breaths/min", "Pa", "C", "Kg"),
                  visit_format = "WEEK",
                  n_assessments = 5,
                  n_days = 5,
                  seed = NULL,
                  cached = FALSE,
                  random_NA = 0,
                  NA_vars = list(CHG2 = c(1235, 0.1), PCHG2 = c(1235, 0.1), CHG = c(1234, 0.1), PCHG = c(1234, 0.1),
                      AVAL = c(123, 0.1), AVALU = c(123, 0.1)
                      )
                ) {

  stopifnot(is.logical(cached))
  if (cached) return(get_cached_data("cadvs"))

  # validate and initialize param vectors
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  if (!is.null(seed)) set.seed(seed)

  ADVS <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments),
    stringsAsFactors = FALSE
  )

  ADVS <- ADVS %>% mutate(AVISITN = case_when(
    AVISIT == "SCREENING" ~ -1,
    AVISIT == "BASELINE" ~ 0,
    (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT)-2,
    TRUE ~ NA_real_
  ))

  # assign related variable values: PARAMxPARAMCD are related
  ADVS$PARAMCD <- as.factor(rel_var(df = ADVS, var_name = "PARAMCD", var_values = param_init_list$relvar2, related_var = "PARAM"))
  ADVS$AVALU <- as.factor(rel_var(df = ADVS, var_name = "AVALU", var_values = unit_init_list$relvar2, related_var = "PARAM"))

  ADVS$AVAL <- rnorm(nrow(ADVS), mean = 50, sd = 8)

  # order to prepare for change from screening and baseline values
  ADVS <- ADVS[order(ADVS$STUDYID, ADVS$USUBJID, ADVS$PARAMCD, ADVS$AVISITN), ]

  ADVS <- Reduce(rbind, lapply(split(ADVS, ADVS$USUBJID), function(x) {
    x$STUDYID = ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])]
    x$ABLFL2 = ifelse(x$AVISIT == "SCREENING", "Y", "")
    x$ABLFL = ifelse(toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE", "Y",
                     ifelse(toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1", "Y",""))
    x$LOQFL = ifelse(x$AVAL < 32, "Y", "N")
    x
  }))

  ADVS$BASE2 <- retain(ADVS, ADVS$AVAL, ADVS$ABLFL2 == "Y")
  ADVS$BASE <- ifelse(ADVS$ABLFL2 != "Y", retain(ADVS, ADVS$AVAL, ADVS$ABLFL == "Y"), NA)

  ADVS <- ADVS %>%
    mutate(CHG2 = AVAL - BASE2) %>%
    mutate(PCHG2 = 100 * (CHG2 / BASE2)) %>%
    mutate(CHG = AVAL - BASE) %>%
    mutate(PCHG = 100 * (CHG / BASE)) %>%
    var_relabel(
      USUBJID = attr(ADSL$USUBJID, "label"),
      STUDYID = attr(ADSL$STUDYID, "label")
    )

  if(random_NA > 0 && random_NA <= 1 && length(NA_vars) > 0){
    ADVS <- mutate_NA(ds = ADVS, NA_vars = NA_vars, percentage = random_NA)
  }

  # apply metadata
  ADVS <- apply_metadata(ADVS, "metadata/ADVS.yml", seed = seed, ADSL = ADSL)

  ADVS

}
