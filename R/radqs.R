#' Questionnaires Analysis Dataset (ADQS)
#'
#' Function for generating random Questionaires Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: STUDYID USUBJID PARAMCD AVISITN.
#'
#' @template ADSL_params
#' @template BDS_findings_params
#' @templateVar data adqs
#' @template param_cached
#'
#' @template return_data.frame
#' @inheritParams radsl
#' @inheritParams mutate_NA
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
#' ADQS <- radqs(ADSL, visit_format = "WEEK", n_assessments = 7, seed = 2)
#' ADQS <- radqs(ADSL, visit_format = "CYCLE", n_assessments = 3, seed = 2)
#' head(ADQS)
#'
radqs <- function(ADSL,
                  param = c("BFI All Questions", "Fatigue Interference", "Function/Well-Being (GF1,GF3,GF7)",
                            "Treatment Side Effects (GP2,C5,GP5)", "FKSI-19 All Questions"),
                  paramcd = c("BFIALL", "FATIGI", "FKSI-FWB", "FKSI-TSE", "FKSIALL"),
                  visit_format = "WEEK",
                  n_assessments = 5,
                  n_days = 5,
                  seed = NULL,
                  cached = FALSE,
                  NA_percentage = 0,
                  NA_vars = list(LOQFL = c(NA, 0.1), ABLFL2 = c(1234, 0.1), ABLFL = c(1235, 0.1),
                    CHG2 = c(1235, 0.1), PCHG2 = c(1235, 0.1), CHG = c(1234, 0.1), PCHG = c(1234, 0.1))
              ){

  stopifnot(is.logical(cached))
  if (cached) return(get_cached_data("cadqs"))

  # validate and initialize param vectors
  param_init_list <- relvar_init(param, paramcd)

  if (!is.null(seed)) set.seed(seed)

  ADQS <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = param_init_list$relvar1,
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days),
    stringsAsFactors = FALSE
  )

  ADQS <- ADQS %>% mutate(AVISITN = case_when(
    AVISIT == "SCREENING" ~ -1,
    AVISIT == "BASELINE" ~ 0,
    (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT)-2,
    TRUE ~ NA_real_
  ))

  # assign related variable values: PARAMxPARAMCD are related
  ADQS$PARAMCD <- rel_var(df = ADQS, var_name = "PARAMCD", var_values = param_init_list$relvar2, related_var = "PARAM")

  ADQS$AVAL <- rnorm(nrow(ADQS), mean = 50, sd = 8)

  # order to prepare for change from screening and baseline values
  ADQS <- ADQS[order(ADQS$STUDYID, ADQS$USUBJID, ADQS$PARAMCD, ADQS$AVISITN), ]

  ADQS <- Reduce(rbind, lapply(split(ADQS, ADQS$USUBJID), function(x) {
    x$STUDYID = ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])]
    x$ABLFL2 = ifelse(x$AVISIT == "SCREENING", "Y", "")
    x$ABLFL = ifelse(toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE", "Y",
                     ifelse(toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1", "Y",""))
    x$LOQFL = ifelse(x$AVAL < 32, "Y", "N")
    x
  }))

  ADQS$BASE2 <- retain(ADQS, ADQS$AVAL, ADQS$ABLFL2 == "Y")
  ADQS$BASE <- ifelse(ADQS$ABLFL2 != "Y", retain(ADQS, ADQS$AVAL, ADQS$ABLFL == "Y"), NA)

  ADQS <- ADQS %>%
    mutate(CHG2 = AVAL - BASE2) %>%
    mutate(PCHG2 = 100 * (CHG2 / BASE2)) %>%
    mutate(CHG = AVAL - BASE) %>%
    mutate(PCHG = 100 * (CHG / BASE)) %>%
    var_relabel(
      STUDYID = attr(ADSL$STUDYID, "label"),
      USUBJID = attr(ADSL$USUBJID, "label")
    )

  if(NA_percentage > 0 && NA_percentage <= 1 && length(NA_vars) > 0){
    ADQS <- mutate_NA(ds = ADQS, NA_vars = NA_vars, NA_percentage = NA_percentage)
  }

  # apply metadata
  ADQS <- apply_metadata(ADQS, "metadata/ADQS.yml", seed = seed, ADSL = ADSL)

  ADQS

}
