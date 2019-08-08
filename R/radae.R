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
#' @param max_n_aes Maximum number of AEs per patient.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data adae
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @importFrom dplyr mutate
#' @importFrom magrittr %>%
#' @importFrom tibble tribble
#'
#' @export
#'
#' @examples
#' ADSL <- suppressWarnings(radsl(seed = 1))
#' ADAE <- radae(ADSL, seed = 2)
#' head(ADAE)
radae <- function(ADSL, # nolint
                  max_n_aes = 10,
                  lookup = NULL,
                  na_percentage = 0,
                  seed = NULL,
                  na_vars = list(AEBODSYS = c(NA, 0.1), AEDECOD = c(1234, 0.1), AETOXGR = c(1234, 0.1)),
                  cached = FALSE) {

  stopifnot(is.logical.single(cached))
  if (cached) {
    return(get_cached_data("cadae"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is.null(seed) || is.numeric.single(seed))

  lookup_ae <- if_null(
    lookup,
    tribble(
      ~AEBODSYS,   ~AEDECOD, ~AETOXGR,
      "cl A",   "trm A_1/2",        1,
      "cl A",   "trm A_2/2",        2,
      "cl B",   "trm B_1/3",        5,
      "cl B",   "trm B_2/3",        3,
      "cl B",   "trm B_3/3",        1,
      "cl C",   "trm C_1/1",        4
    )
  )

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADAE <- Map(function(id, sid) { # nolint
    n_aes <- sample(0:max_n_aes, 1)
    i <- sample(1:nrow(lookup_ae), n_aes, TRUE)
    lookup_ae[i, ] %>% mutate(
      USUBJID = id,
      STUDYID = sid
    )
  }, ADSL$USUBJID, ADSL$STUDYID) %>%
    Reduce(rbind, .) %>%
    `[`(c(4, 5, 1, 2, 3)) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier"
    )

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADAE <- mutate_na(ds = ADAE, na_vars = na_vars, na_percentage = na_percentage) #nolint
  }
  apply_metadata(ADAE, "metadata/ADAE.yml", seed = seed, ADSL = ADSL)
}
