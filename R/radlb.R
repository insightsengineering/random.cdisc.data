#' Lab Dataset
#'
#' Function for generating random dataset from laboratory Test Findings domain for a given
#' Subject-Level Analysis Dataset
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#' SDTM variables are populated on new records coming from other single records.
#' Otherwise, SDTM variables are left blank.
#'
#' Keys: STUDYID USUBJID PARAMCD AVISITN
#'
#' @template param_ADSL
#' @inheritParams radsl
#'
#' @export
#' @author tomlinsj
#' @template return_data.frame
#'
#' @examples
#'
#' ADSL <- radsl()
#' ADLB <- radlb(ADSL)
#' head(ADLB)
radlb <- function(ADSL, seed = NULL) {

  if (!is.null(seed)) set.seed(seed)

  # Create an example ADLB dataset from the 100 patient, with 6 visits with 3
  # parameters for each subject.
  ADLB <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = c("Alanine Aminotransferase Measurement", "C-Reactive Protein Measurement", "Immunoglobulin A Measurement", "Immunoglobulin G Measurement"),
    AVISIT = c("SCREENING", "BASELINE",  paste0("WEEK ", 1:5)),
    stringsAsFactors = FALSE
  )

  ADLB$PARAMCD = c("ALT", "CRP", "IGA", "IGG")

  ADLB$AVISITCD <- ifelse(ADLB$AVISIT %in% "SCREENING", "SCR",
                          ifelse(ADLB$AVISIT %in% "BASELINE", "BL",
                                 ifelse(grepl("WEEK", ADLB$AVISIT), "W", NA)))

  ADLB$AVISITCDN <- as.numeric(ifelse(ADLB$AVISIT %in% "SCREENING", -1,
                                      ifelse(ADLB$AVISIT %in% "BASELINE", 0,
                                             ifelse(grepl("WEEK", ADLB$AVISIT) , substr(ADLB$AVISIT, start=6, stop=7), NA))))

  ADLB$AVAL <- rnorm(nrow(ADLB), mean = 50, sd = 8)

  ADLB <- Reduce(rbind, lapply(split(ADLB, ADLB$USUBJID), function(x) {
    x$STUDYID <- ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])]
    x$BASE2 <- x$AVAL[1]
    x$CHG2 <- x$AVAL - x$BASE2
    x$PCHG2 <- 100 * x$CHG2 / x$BASE2
    x$BASE <- x$AVAL[1]
    x$CHG <- x$AVAL - x$BASE
    x$PHG <- 100 * x$CHG / x$BASE
    x$LOQFL = ifelse(x$AVAL < 32, "Y", "N")
    x
  })) %>%
    mutate(AVISITCD = factor(AVISITCD) %>% reorder(AVISITCDN)) %>%
    mutate(AVISITN = AVISITCDN) %>%
    var_relabel(
      USUBJID = attr(ADSL$USUBJID, "label"),
      STUDYID = attr(ADSL$STUDYID, "label")
    )
  ## apply metadata
  ADLB <- apply_metadata(ADLB, "ADLB.yml", seed = NULL, join_adsl = TRUE)

  ADLB

}
