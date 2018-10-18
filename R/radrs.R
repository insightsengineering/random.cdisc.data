


param_codes <- setNames(1:5, c("CR", "PR", "SD", "PD", "NE"))

lookup_ARS <- expand.grid(
  ARM = c("ARM A", "ARM B", "ARM C"),
  AVALC = names(param_codes)
) %>% mutate(
  AVAL = param_codes[AVALC],
  p_scr = c(rep(0, 3), rep(0, 3), c(1, 1, 1), c(0, 0, 0), c(0, 0, 0)),
  p_eoi = c(c(.6, .4, .7), c(.3, .2, .2), c(.05, .2, .03), c(.04, 0.1, 0.05), c(.01, 0.1, 0.02)),
  p_fu = c(c(.3, .2, .4), c(.2, .1, .3), c(.2, .2, .2), c(.3, .5, 0.1), rep(0, 3))
)

#' Random Response Analysis Dataset
#'
#' Function for generating random Response Analysis Dataset for a given
#' Subject-Level Analysis Dataset
#'
#' @param ADSL adsl (Subject-Level Analysis Dataset) start data set
#' @param seed for random number generation
#'
#' @export
#' @return a data frame containing generated Response Analysis Dataset for
#' Subject-Level Analysis Dataset. The dataset consists of following variables:
#' [,1] STUDYID (Study Identifier), \cr
#' [,2] SITEID (Site Identifier), \cr
#' [,3] USUBJID (Unique Subject Identifier), \cr
#' [,4] PARAMCD (Parameter Code),\cr
#' [,5] PARAM (Parameter Description),\cr
#' [,6] AVALC (Analysis Value Category),\cr
#' [,7] AVAL (Analysis Value), \cr
#' [,8] AVISIT (Analysis Visit Window).
#'
#'
#'@examples
#' ADSL <- radsl()
#' ADRS <- radrs(ADSL)
#' head(ADRS)
radrs <- function(ADSL, seed = NULL) {

  if (!is.null(seed)) set.seed(seed)


  split(ADSL, ADSL$USUBJID) %>% lapply(FUN = function(pinfo) {

    probs <- lookup_ARS %>%
      filter(ARM == as.character(pinfo$ACTARM))

    # screening
    rsp_screen <- sample(probs$AVALC, 1, prob = probs$p_scr) %>% as.character()

    # end of induction
    rsp_eoi <- sample(probs$AVALC, 1, prob = probs$p_eoi) %>% as.character()

    # follow up
    rsp_fu <- sample(probs$AVALC, 1, prob = probs$p_fu) %>% as.character()

    best_rsp <- min(param_codes[c(rsp_screen, rsp_eoi, rsp_fu)])
    best_rsp_i <- which.min(param_codes[c(rsp_screen, rsp_eoi, rsp_fu)])

    avisit = c("screening", "end of induction", "follow up")

    tibble(
      STUDYID = pinfo$STUDYID,
      SITEID = pinfo$SITEID,
      USUBJID = pinfo$USUBJID,
      PARAMCD = c(rep("OVRINV", 3), "BESRSPI", "INVET"),
      PARAM = recode(PARAMCD, OVRINV = "Overall Response",
                     BESRSPI = "Best Overall Response",
                     INVET = "Investigator End Of Induction Response"),
      AVALC = c(rsp_screen, rsp_eoi, rsp_fu,
                names(param_codes)[best_rsp],
                rsp_eoi
      ),
      AVAL = param_codes[AVALC],
      AVISIT = factor(c(avisit, avisit[best_rsp_i], avisit[2]), levels = avisit)
    )
  }) %>% Reduce(rbind, .) %>%
    mutate(AVALC = factor(AVALC, levels = names(param_codes))) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier",
      SITEID = "Study Site Identifier",
      PARAM = "Parameter Description",
      PARAMCD = "Parameter Code",
      AVAL = "Analysis Value",
      AVALC = "Analysis Value Category",
      AVISIT = "Analysis Visit Window"
    )

}
