#' Tumor Response Analysis Data Set (ADRS)
#'
#' Function for generating random Tumor Response Analysis Data Set for a given
#' Subject-Level Analysis Dataset.
#'
#' @details
#' One record per subject per parameter per analysis visit per analysis date.
#' SDTM variables are populated on new records coming from other single records.
#' Otherwise, SDTM variables are left blank.
#'
#' Keys: STUDYID USUBJID PARAMCD AVISITN ADT RSSEQ
#'
#' @param avalc Vector of analysis value categories.
#'
#' @template ADSL_params
#' @template lookup_param
#' @templateVar data adrs
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @importFrom tibble tibble
#'
#' @export
#'
#' @examples
#'  ADSL <- radsl(seed = 1)
#'  ADRS <- radrs(ADSL, seed = 2)
#'  head(ADRS)
radrs <- function(ADSL, seed = NULL, avalc = NULL, lookup = NULL, cached = FALSE) {

  stopifnot(is.logical(cached))
  if (cached) return(get_cached_data("cadrs"))

  if(is.null(avalc)){
    param_codes <- setNames(1:5, c("CR", "PR", "SD", "PD", "NE"))
  } else {
    param_codes <- avalc
  }

  if(is.null(lookup)){
    lookup_ARS <- expand.grid(
      ARM = c("A: Drug X", "B: Placebo", "C: Combination"),
      AVALC = names(param_codes)
    ) %>% mutate(
      AVAL = param_codes[AVALC],
      p_scr = c(rep(0, 3), rep(0, 3), c(1, 1, 1), c(0, 0, 0), c(0, 0, 0)),
      p_eoi = c(c(.6, .4, .7), c(.3, .2, .2), c(.05, .2, .03), c(.04, 0.1, 0.05), c(.01, 0.1, 0.02)),
      p_fu = c(c(.3, .2, .4), c(.2, .1, .3), c(.2, .2, .2), c(.3, .5, 0.1), rep(0, 3))
    )
  } else {
    lookup_ARS <- lookup
  }

  if (!is.null(seed)) set.seed(seed)

  ADRS <- split(ADSL, ADSL$USUBJID) %>% lapply(FUN = function(pinfo) {

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

    avisit = c("Screening", "End of Induction", "Follow Up")

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
      USUBJID = "Unique Subject Identifier"
    )

  # apply metadata
  ADRS <- apply_metadata(ADRS, "metadata/ADRS.yml", seed = seed, ADSL = ADSL)

  ADRS

}
