#' Adverse Events Analysis Dataset (ADAE).
#'
#' Function for generating random Adverse Events Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: STUDYID USUBJID AESTDTM AETERM AESEQ.
#'
#' @param ADSL dataset.
#' @param max_n_aes maximum number of AEs per patient.
#' @param lookup table of AEs.
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
#' ADAE <- radae(ADSL)
#' head(ADAE)
#'
radae <- function(ADSL, max_n_aes = 10, lookup = NULL, seed = NULL) {

  if(is.null(lookup)){
    lookup_ae = tribble(
    ~AEBODSYS,   ~AEDECOD, ~AETOXGR,
    "cl A",   "trm A_1/2",        1,
    "cl A",   "trm A_2/2",        2,
    "cl B",   "trm B_1/3",        5,
    "cl B",   "trm B_2/3",        3,
    "cl B",   "trm B_3/3",        1,
    "cl C",   "trm C_1/1",        4
    )
  } else {
    lookup_ae <- lookup
  }

  if (!is.null(seed)) set.seed(seed)

  ADAE <- Map(function(id, sid) {
    n_aes <- sample(0:max_n_aes, 1)
    i <- sample(1:nrow(lookup_ae), n_aes, TRUE)
    lookup_ae[i, ] %>% mutate(
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
  ADAE <- apply_metadata(ADAE, "ADAE.yml", seed = seed, ADSL = ADSL)

  ADAE

}
