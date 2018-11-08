#' Adverse Events Analysis Dataset (ADAE)
#'
#' Function for generating random Adverse Events Analysis Dataset for a given
#' Subject-Level Analysis Dataset
#'
#' @details One record per each record in the corresponding SDTM domain
#'
#' Keys: STUDYID USUBJID ASTDTM AETERM AESEQ
#'
#' @inheritParams radsl
#' @template param_ADSL
#' @param max_n_aes The maximum number of adverse events per patient.
#' @template param_lookup
#'
#' @export
#' @template return_data.frame
#'
#' @examples
#'
#' ADSL <- radsl()
#' ADAE <- radae(ADSL)
#'
#' head(ADAE)
#'
radae <- function(ADSL, max_n_aes = 10, seed = NULL,lookup = NULL) {

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

  Map(function(id, sid) {
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
      USUBJID = "Unique Subject Identifier",
      AEBODSYS = "Body System or Organ Class",
      AEDECOD = "Dictionary-Derived Term",
      AETOXGR = "Standard Toxicity Grade"
    )
}

