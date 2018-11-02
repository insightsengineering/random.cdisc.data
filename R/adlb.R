

#' Generate a random lab dataset
#'
#' Function for generating random dataset from laboratory Test Findings domain for a given
#' Subject-Level Analysis Dataset
#'
#' @param ADSL adsl (Subject-Level Analysis Dataset) start data set
#' @param seed for random number generation
#'
#' @export
#' @author tomlinsj
#' @return a data frame containing generated Test Findings dataset for
#' Subject-Level Analysis Dataset. The dataset contains following variables:
#' [,1] USUBJID (Unique Subject Identifier), \cr
#' [,2] AVISIT (Analysis Visit Window),\cr
#' [,3] PARAMCD (Parameter Code), \cr
#' [,4] AVISITCD (Analysis Visit Window Code),\cr
#' [,5] AVAL (Analysis Value), \cr
#' [,6] BASE (Baseline Analysis Value), \cr
#' [,7] STUDYID (Study Identifier),\cr
#' [,8] CHG (change between the Analysis Value and Baseline Analysis Value), \cr
#' [,9] PHG (Percentage of change), \cr
#' [,10] LOQFL (Indicator if the AVAL is greater then 32).
#'
#' @examples
#'
#' ADSL <- radsl()
#' ADLB <- radlb(ADSL)
#' head(ADLB)
radlb <- function(ADSL, seed = NULL) {
  if (!is.null(seed)) set.seed(seed)

  # Create an example ALB dataset from the 100 patient, with 6 visits with 3
  # parameters for each subject.
  ALB <- expand.grid(
    USUBJID = ADSL$USUBJID,
    AVISIT = c("BASELINE",  paste0("VISIT ", 1:5)),
    PARAMCD = c("CRP", "IGA", "IGG"),
    stringsAsFactors = FALSE
  )

  ALB$AVISITCD <- ALB$AVISIT
  ALB$AVAL <- rnorm(nrow(ALB), mean = 50, sd = 8)

  Reduce(rbind, lapply(split(ALB, ALB$USUBJID), function(x) {
    x$BASE <- x$AVAL[1]
    x$STUDYID <- ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])]
    x$CHG <- x$AVAL - x$BASE
    x$PHG <- 100 * x$CHG/x$BASE
    x$LOQFL = ifelse(x$AVAL < 32, "Y", "N")
    x
  })) %>%
    var_relabel(
      USUBJID = attr(ADSL$USUBJID, "label"),
      STUDYID = attr(ADSL$STUDYID, "label")
    )


}
