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
#' ADSL <- radsl()
#' ADVS <- radvs(ADSL, visit_format = "WEEK", n_assessments = 7)
#' ADVS <- radvs(ADSL, visit_format = "CYCLE", n_assessments = 3)
#' head(ADVS)
#'
radvs <- function(ADSL,
                  param = c("Diastolic Blood Pressure", "Pulse Rate", "Respiratory Rate", "Systolic Blood Pressure",
                            "Temperature", "Weight"),
                  paramcd = c("DIABP", "PULSE", "RESP", "SYSBP", "TEMP", "WEIGHT"),
                  visit_format = "WEEK", n_assessments = 5, n_days = 5, seed = NULL) {

  # validate and initialize param vectors
  param_init_list <- param_init(param, paramcd)

  if (!is.null(seed)) set.seed(seed)

  ADVS <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = param_init_list$param,
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
  ADVS$PARAMCD <- rel_var(df = ADVS, var_name = "PARAMCD", var_values = param_init_list$paramcd, related_var = "PARAM")

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

  # apply metadata
  ADVS <- apply_metadata(ADVS, "metadata/ADVS.yml", seed = seed, ADSL = ADSL)

  ADVS

}
