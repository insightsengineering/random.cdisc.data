#' Adverse Event Analysis Dataset (ADAE)
#'
#' Function for generating random Adverse Event Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: STUDYID USUBJID AESTDTM AETERM AESEQ.
#'
#' @template ADSL_params
#' @template lookup_param
#' @template return_data.frame
#'
#' @param max_n_aes Maximum number of AEs per patient.
#'
#' @import dplyr
#' @importFrom yaml yaml.load_file
#'
#' @export
#'
#' @examples
#' ADSL <- radsl(seed = 1)
#' ADAE <- radae(ADSL, seed = 2)
#' head(ADAE)
#'
radae <- function(ADSL, max_n_aes = 10, lookup = NULL, seed = NULL, cached = isTRUE(getOption("random.cdisc.data.cached"))) {

  if (cached) {
    data(adae, envir = environment())
    return(adae)
  }

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
  ADAE <- apply_metadata(ADAE, "metadata/ADAE.yml", seed = seed, ADSL = ADSL)

  ADAE

}
