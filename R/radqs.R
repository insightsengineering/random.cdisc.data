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

  ADQS <- split(ADSL, ADSL$USUBJID) %>% lapply(FUN = function(pinfo){

    nvisits <-ceiling(runif(1) * 10 + 1 )

    pinfo <- pinfo %>% slice(rep(row_number(), length(PARAMCD_var)*nvisits)) %>%
      transmute(
        STUDYID = pinfo$STUDYID,
        USUBJID = pinfo$USUBJID,
        PARAM = rep(PARAM_var, each = nvisits),
        PARAMCD = rep(PARAMCD_var, each = nvisits),
        AVAL = rnorm(length(PARAMCD_var)*nvisits),
        AVISIT = rep(paste("WEEK", 1:nvisits), length(PARAMCD_var)),
        AVISITN = rep(1:nvisits, length(PARAM_var)),
        BASETYPE = "LAST",
        ABLFL =  rep(rep(c("Y", ""), c(1, nvisits - 1)), length(PARAM_var)),
        ONTRTFL = rep(rep(c("", "Y"), c(1, nvisits - 1)), length(PARAM_var)),
        CHG = AVAL - AVAL[1],
        PCHG = CHG/AVAL[1]
      ) %>% var_relabel(
        STUDYID = attr(ADSL$STUDYID, "label"),
        USUBJID = attr(ADSL$USUBJID, "label"),
        PARAM = "Parameter",
        PARAMCD = "Parameter Code" ,
        AVAL = "Analysis Value",
        AVISIT = "Analysis Visit",
        AVISITN = "Analysis Visit (N)",
        BASETYPE = "Baseline Type",
        ABLFL = "Baseline Record Flag",
        ONTRTFL = "On Treatment Record Flag",
        CHG = "Change from Baseline",
        PCHG	= "Percent Change from Baseline")

  }
  ) %>% Reduce(rbind,.)

  # order visits
  ADQS[["AVISIT"]] <- factor(ADQS$AVISIT, levels=paste("WEEK", 1:max(ADQS$AVISITN)))
  var_relabel(ADQS, AVISIT = "Analysis Visit")
}
