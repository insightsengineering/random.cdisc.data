#' Questionaires Dataset
#'
#'Function for generating random questionaire dataset for a given
#'Subject-Level Analysis Dataset
#'
#' @inheritParams radsl
#' @template param_ADSL
#' @param param Vector of questionaire parameters.
#' @param paramcd Vector of questionaire parameter codes of the same length
#' as parameters and corresponding to their values.
#'
#' @export
#' @template return_data.frame
#'
#' @examples
#' ADSL <- radsl()
#' ADQS <- radqs(ADSL)
#' head(ADQS)
#'
radqs <- function(ADSL, seed = NULL, param = NULL, paramcd = NULL) {
  if (!is.null(seed)) set.seed(seed)

  if(length(param) != length (paramcd)){
    stop(simpleError("the length of parameters and parameter codes differ"))
  } else if (is.null(param) & is.null(paramcd)) {
    PARAMCD_var <- c("BFIALL", "FATIGI", "FKSI-FWB", "FKSI-TSE", "FKSIALL")
    PARAM_var <- c("BFI All Questions", "Fatigue Interference", "Function/Well-Being (GF1,GF3,GF7)",
                   "Treatment Side Effects (GP2,C5,GP5)", "FKSI-19 All Questions")
  } else {
    PARAMCD_var <- paramcd
    PARAM_var <- param
  }

  split(ADSL, ADSL$USUBJID) %>% lapply(FUN = function(pinfo){

    nvisits <-ceiling(runif(1) * 10 + 1 )
      pinfo %>% slice(rep(row_number(), length(PARAMCD_var)*nvisits)) %>%
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
