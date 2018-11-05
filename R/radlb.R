#' Lab Dataset
#'
#' Function for generating random dataset from laboratory Test Findings domain for a given
#' Subject-Level Analysis Dataset
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#' SDTM variables are populated on new records coming from other single records.
#' Otherwise, SDTM variables are left blank.
#'
#' Keys: STUDYID USUBJID PARAMCD BASETYPE AVISITN ATPTN DTYPE ADTM LBSEQ ASPID
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
  if (!is.null(seed))
    set.seed(seed)

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
    x$PHG <- 100 * x$CHG / x$BASE
    x$LOQFL = ifelse(x$AVAL < 32, "Y", "N")
    x
  })) %>%
    var_relabel(
      USUBJID = attr(ADSL$USUBJID, "label"),
      STUDYID = attr(ADSL$STUDYID, "label")
    )


}
