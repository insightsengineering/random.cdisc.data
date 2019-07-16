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
#' @inheritParams radsl
#' @inheritParams mutate_NA
#'
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
#' ADSL <- radsl(N = 10, seed = 1)
#' ADLB <- radlb(ADSL, visit_format = "WEEK", n_assessments = 7, seed = 2)
#' ADLB <- radlb(ADSL, param = c("Immunoglobulin A Measurement", "Immunoglobulin G Measurement"),
#' paramcd = c("IGA", "IGG"), paramu = c("g/L", "g/L"), seed = 2)
#' ADLB <- radlb(ADSL, visit_format = "CYCLE", n_assessments = 3, seed = 2)
#' head(ADLB)
#'
radlb <- function(ADSL,
                  param = c("Alanine Aminotransferase Measurement", "C-Reactive Protein Measurement", "Immunoglobulin A Measurement"),
                  paramcd = c("ALT", "CRP", "IGA"),
                  paramu = c("U/L", "mg/L", "g/L"),
                  visit_format = "WEEK",
                  n_assessments = 5,
                  n_days = 5,
                  seed = NULL,
                  cached = FALSE,
                  random_NA = 0,
                  NA_vars = list(LOQFL = c(NA, 0.1), ABLFL2 = c(1234, 0.1), ABLFL = c(1235, 0.1),
                      BASE2 = c(NA, 0.1), BASE = c(NA, 0.1),
                      CHG2 = c(1235, 0.1), PCHG2 = c(1235, 0.1), CHG = c(1234, 0.1), PCHG = c(1234, 0.1))
              ){

  stopifnot(is.logical(cached))
  if (cached) return(get_cached_data("cadlb"))

  # validate and initialize related variables
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  if (!is.null(seed)) set.seed(seed)

  ADLB <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days),
    stringsAsFactors = FALSE
  )

  ADLB$AVAL <- rnorm(nrow(ADLB), mean = 50, sd = 8)

  # assign related variable values: PARAMxPARAMCD are related
  ADLB$PARAMCD <- as.factor(rel_var(df = ADLB, var_name = "PARAMCD", var_values = param_init_list$relvar2, related_var = "PARAM"))
  ADLB$AVALU <- as.factor(rel_var(df = ADLB, var_name = "AVALU", var_values = unit_init_list$relvar2, related_var = "PARAM"))

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

  if(random_NA > 0 && random_NA <=1 && length(NA_vars) > 0){
    ADLB <- mutate_NA(ds = ADLB, NA_vars = NA_vars, percentage = random_NA)
  }

  # apply metadata
  ADLB <- apply_metadata(ADLB, "metadata/ADLB.yml", seed = seed, ADSL = ADSL)

  ADLB

}
