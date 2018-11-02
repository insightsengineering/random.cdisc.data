## use the medra data in sysdat


lookup_ae = tribble(
  ~AEBODSYS,   ~AEDECOD, ~AETOXGR,
  "cl A",   "trm A_1/2",        1,
  "cl A",   "trm A_2/2",        2,
  "cl B",   "trm B_1/3",        5,
  "cl B",   "trm B_2/3",        3,
  "cl B",   "trm B_3/3",        1,
  "cl C",   "trm C_1/1",        4
)


#' Generate a random Adverse Events Analysis Dataset
#'
#' Function for generating random Adverse Events Analysis Dataset for a given
#' Subject-Level Analysis Dataset
#'
#' @param ADSL adsl (Subject-Level Analysis Dataset) start data set
#' @param max_n_aes is the maximum number of adverse events per patient
#' @param seed for random number generation
#'
#'
#' @export
#' @return a data frame containing random generated adverse events for
#' [,1] Subject-Level Analysis Dataset. The dataset consists of following variables:
#' [,2] USUBJID (Unique Subject Identifier), \cr
#' [,3] STUDYID (Study Identifier), \cr
#' [,4] AEBODSYS (Body System or Organ Class), \cr
#' [,5] AEDECOD (Dictionary Derived Term), \cr
#' [,6] AETOXGR (Standard Toxicity Grade)\cr
#'
#' @examples
#'
#' ADSL <- radsl()
#' ADAE <- radae(ADSL)
#'
#' head(ADAE)
#'
radae <- function(ADSL, max_n_aes = 10, seed = NULL) {

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

