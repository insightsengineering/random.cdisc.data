
PARAMCD_var <- c("BFIALL", "FATIGI", "FKSI-FWB", "FKSI-TSE", "FKSIALL")
PARAM_var <- c("BFI All Questions", "Fatigue Interference", "Function/Well-Being (GF1,GF3,GF7)",
           "Treatment Side Effects (GP2,C5,GP5)", "FKSI-19 All Questions")

#' Generate a random Questionaires Dataset
#'
#'Function for generating random questionaire dataset for a given
#'Subject-Level Analysis Dataset
#'
#' @param ADSL adsl (Subject-Level Analysis Dataset) start data set
#' @param seed for random number generation
#'
#' @returna data frame containing generated random Questionaires dataset for
#' Subject-Level Analysis Dataset. The dataset consists of following variables:\cr
#' [,1] USUBJID (Unique Subject Identifier),\cr
#' [,2] STUDYID (Study Identifier),\cr
#' [,3] SITEID (Study Site Identifier),\cr
#' [,4] PARAMCD (Parameter Code), \cr
#' [,5] PARAM (Parameter Description),\cr
#' [,6] AVAL (Analysis Value),\cr
#' [,7] AVISIT (Analysis Visit), \cr
#' [,8] AVISITN (Analysis Visit (N)),\cr
#' [,9] ABLFL (Baseline Record Flag),\cr
#' [,10] APBFL,\cr
#' [,11] CHG (Change From Baseline),\cr
#' [,12] PCHG (Percent Change From Baseline),\cr
#' @export
#'
#' @examples
#' ADSL <- radsl()
#' ADQS <- radqs(ADSL)
#' head(ADQS)
#'
radqs <- function(ADSL, seed = NULL) {
  if (!is.null(seed)) set.seed(seed)


  split(ADSL, ADSL$USUBJID) %>% lapply(FUN = function(pinfo){

    nvisits <-ceiling(runif(1) * 10 + 1 )
      pinfo %>% slice(rep(row_number(), length(PARAMCD)*nvisits)) %>%
      transmute(
        USUBJID = pinfo$USUBJID,
        STUDYID = pinfo$STUDYID,
        PARAMCD = rep(PARAMCD_var,nvisits),
        PARAM = rep(PARAM_var,nvisits),
        AVAL = rnorm(length(PARAMCD_var)*nvisits),
        AVISIT = rep(paste("WEEK", 1:nvisits),length(PARAMCD_var)),
        AVISITN = rep(1:nvisits, length(PARAM_var)),
        ABLFL =  rep(rep(c("Y", ""), c(1, nvisits - 1)), length(PARAM_var)),
        APBFL = rep(rep(c("", "Y"), c(1, nvisits - 1)), length(PARAM_var)),
        CHG = AVAL - AVAL[1],
        PCHG = CHG/AVAL[1]
      )
  }
  ) %>% Reduce(rbind,.)

}
