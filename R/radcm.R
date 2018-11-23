
#' Concomitant Medication Analysis Dataset (ADCM)
#'
#' Function for generating random Concomitant Medication Analysis Dataset for a given
#' Subject-Level Analysis Dataset
#'
#' @inheritParams radsl
#' @template param_ADSL
#' @param max_n_cms The maximum number of concomitant medications per patient.
#' @template param_lookup
#'
#' @export
#' @template return_data.frame
#'
#' @examples
#'
#' ADSL <- radsl()
#' ADCM <- radcm(ADSL)
#'
#' head(ADCM)
#'

radcm <- function(ADSL, max_n_cms = 10, seed = NULL, lookup = NULL) {
  if (is.null(lookup)){
    lookup_cm = tribble(
      ~CMCLAS,   ~CMDECOD, ~CMTIREL,
      "medcl A",   "medname A_1/3",      "PRIOR",
      "medcl A",   "medname A_2/3",      "CONCOMITANT",
      "medcl A",   "medname A_3/3",      "CONCOMITANT",
      "medcl B",   "medname B_1/4",      "CONCOMITANT",
      "medcl B",   "medname B_2/4",      "PRIOR",
      "medcl B",   "medname B_3/4",      "PRIOR",
      "medcl B",   "medname B_4/4",      "CONCOMITANT",
      "medcl C",   "medname C_1/2",      "CONCOMITANT",
      "medcl C",   "medname C_2/2",      "CONCOMITANT"
    )
  } else {
    lookup_cm <- lookup
  }

  if (!is.null(seed)) set.seed(seed)

  Map(function(id, sid) {
    n_cms <- sample(0:max_n_cms, 1)
    i <- sample(1:nrow(lookup_cm), n_cms, TRUE)
    lookup_cm[i, ] %>% mutate(
      USUBJID = id,
      STUDYID = sid
    )
  }, ADSL$USUBJID, ADSL$STUDYID) %>%
    Reduce(rbind, .) %>%
    `[`(c(4,5,1,2,3)) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier",
      CMCLAS = "Medication Class",
      CMDECOD = "Standardized Medication Name",
      CMTIREL = "Time Relation of Medication"
    )
}
