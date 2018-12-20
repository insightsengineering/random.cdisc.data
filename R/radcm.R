#' Concomitant Medication Analysis Dataset (ADCM).
#'
#' Function for generating random Concomitant Medication Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: STUDYID USUBJID CMSTDTM CMTERM CMSEQ.
#' @param ADSL dataset.
#' @param max_n_cms maximum number of concommitant medications per patient.
#' @param lookup table of CMs.
#' @param seed starting point used in the generation of a sequence of random numbers.
#'
#' @template param_ADSL
#' @template param_lookup
#' @template return_data.frame
#'
#' @inheritParams radsl
#'
#' @import dplyr
#' @importFrom yaml yaml.load_file
#'
#' @export
#'
#' @examples
#' ADSL <- radsl()
#' ADCM <- radcm(ADSL)
#' head(ADCM)
#'
radcm <- function(ADSL, max_n_cms = 10, seed = NULL, lookup = NULL) {
  if (is.null(lookup)){
    lookup_cm = tribble(
      ~CMCLAS,   ~CMDECOD, ~ATIREL,
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

  ADCM <- Map(function(id, sid) {
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
      USUBJID = "Unique Subject Identifier"
    )

  # apply metadata
  ADCM <- apply_metadata(ADCM, "ADCM.yml", seed = seed, ADSL = ADSL)

  ADCM

}
