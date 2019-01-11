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
#' @template return_data.frame
#'
#' @import dplyr
#' @importFrom yaml yaml.load_file
#'
#' @export
#'
#' @author tomlinsj, npaszty
#'
#' @examples
#' ADSL <- radsl(N = 10)
#' ADLB <- radlb(ADSL, visit_format = "WEEK", n_assessments = 7)
#' ADLB <- radlb(ADSL, param = c("Immunoglobulin A Measurement", "Immunoglobulin G Measurement"),
#' paramcd = c("IGA", "IGG"))
#' ADLB <- radlb(ADSL, visit_format = "CYCLE", n_assessments = 3)
#' head(ADLB)
#'
radlb <- function(ADSL,
                  param = c("Alanine Aminotransferase Measurement", "C-Reactive Protein Measurement", "Immunoglobulin A Measurement"),
                  paramcd = c("ALT", "CRP", "IGA"),
                  visit_format = "WEEK", n_assessments = 5, n_days = 5, seed = NULL) {

  # validate and initialize param vectors
  param_init_list <- param_init(param, paramcd)

  if (!is.null(seed)) set.seed(seed)

  ADLB <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = param_init_list$param,
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days),
    stringsAsFactors = FALSE
  )

  ADLB$AVAL <- rnorm(nrow(ADLB), mean = 50, sd = 8)

  # assign related variable values: PARAMxPARAMCD are related - USE FACTORS FOR VAR_VALUES AND PARAM
  ADLB$PARAMCD <- rel_var(df = ADLB, var_name = "PARAMCD", var_values = param_init_list$paramcd, related_var = "PARAM")

  ADLB <- ADLB %>% mutate(AVISITN = case_when(
    AVISIT == "SCREENING" ~ -1,
    AVISIT == "BASELINE" ~ 0,
    (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT)-2,
    TRUE ~ NA_real_
  ))

  # order to prepare for change from screening and baseline values
  ADLB <- ADLB[order(ADLB$STUDYID, ADLB$USUBJID, ADLB$PARAMCD, ADLB$AVISITN), ]

  ADLB <- Reduce(rbind, lapply(split(ADLB, ADLB$USUBJID), function(x) {
    x$STUDYID = ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])]
    x$ABLFL2 = ifelse(x$AVISIT == "SCREENING", "Y", "")
    x$ABLFL = ifelse(toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE", "Y",
                     ifelse(toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1", "Y",""))
    x$LOQFL = ifelse(x$AVAL < 32, "Y", "N")
    x
  }))

  ADLB$BASE2 <- retain(ADLB, ADLB$AVAL, ADLB$ABLFL2 == "Y")
  ADLB$BASE <- ifelse(ADLB$ABLFL2 != "Y", retain(ADLB, ADLB$AVAL, ADLB$ABLFL == "Y"), NA)

  ADLB <- ADLB %>%
    mutate(CHG2 = AVAL - BASE2) %>%
    mutate(PCHG2 = 100 * (CHG2 / BASE2)) %>%
    mutate(CHG = AVAL - BASE) %>%
    mutate(PCHG = 100 * (CHG / BASE)) %>%
    var_relabel(
      STUDYID = attr(ADSL$STUDYID, "label"),
      USUBJID = attr(ADSL$USUBJID, "label")
    )

  # apply metadata
  ADLB <- apply_metadata(ADLB, "metadata/ADLB.yml", seed = seed, ADSL = ADSL)

  ADLB

}
