#' Concomitant Medication Analysis Dataset (ADCM)
#'
#' Function for generating random Concomitant Medication Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: STUDYID USUBJID CMSTDTM CMTERM CMSEQ.
#'
#' @template ADSL_params
#' @template lookup_param
#' @param max_n_cms maximum number of concommitant medications per patient.
#' @inheritParams radsl
#' @inheritParams mutate_NA
#'
#' @templateVar data adcm
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @importFrom magrittr %>%
#' @importFrom tibble tribble
#'
#' @export
#'
#' @examples
#' ADSL <- radsl(seed = 1)
#' ADCM <- radcm(ADSL, seed = 2)
#' head(ADCM)
radcm <- function(ADSL, # nolint
                  max_n_cms = 10L,
                  seed = NULL,
                  lookup = NULL,
                  NA_percentage = 0,
    NA_vars = list(CMCLAS = c(NA, 0.1), CMDECOD = c(1234, 0.1), ATIREL = c(1234, 0.1)),
                  cached = FALSE) {

  stopifnot(is.logical.single(cached))
  if (cached) {
    return(get_cached_data("cadcm"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is.integer.single(max_n_cms))
  stopifnot(is.numeric.single(seed))

  lookup_cm <- if_null(
    lookup,
    tribble(
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
  )

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADCM <- Map(function(id, sid) { # nolint
    n_cms <- sample(0:max_n_cms, 1)
    i <- sample(1:nrow(lookup_cm), n_cms, TRUE)
    lookup_cm[i, ] %>% mutate(
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

  if(length(NA_vars) > 0 && NA_percentage > 0 && NA_percentage <= 1) {
    ADCM <- mutate_NA(ds = ADCM, NA_vars = NA_vars, NA_percentage = NA_percentage)
  }
  apply_metadata(ADCM, "metadata/ADCM.yml", seed = seed, ADSL = ADSL)
}
