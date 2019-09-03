#' Concomitant Medication Analysis Dataset (ADCM)
#'
#' Function for generating random Concomitant Medication Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: STUDYID USUBJID ASTDTM CMSEQ.
#'
#' @template ADSL_params
#' @template lookup_param
#' @param max_n_cms maximum number of concomitant medications per patient.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data adcm
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @importFrom magrittr %>%
#' @importFrom tibble tribble
#' @importFrom dplyr arrange
#'
#' @export
#'
#' @examples
#' library(dplyr)
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' ADCM <- radcm(ADSL, seed = 2)
#' head(ADCM)
radcm <- function(ADSL, # nolint
                  max_n_cms = 10L,
                  seed = NULL,
                  lookup = NULL,
                  na_percentage = 0,
                  na_vars = list(CMCLAS = c(NA, 0.1), CMDECOD = c(1234, 0.1), ATIREL = c(1234, 0.1)),
                  cached = FALSE) {
  stopifnot(is.logical.single(cached))
  if (cached) {
    return(get_cached_data("cadcm"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is.integer.single(max_n_cms))
  stopifnot(is.numeric.single(seed))
  stopifnot((na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  lookup_cm <- if_null(
    lookup,
    tribble(
      ~CMCLAS, ~CMDECOD, ~ATIREL,
      "medcl A", "medname A_1/3", "PRIOR",
      "medcl A", "medname A_2/3", "CONCOMITANT",
      "medcl A", "medname A_3/3", "CONCOMITANT",
      "medcl B", "medname B_1/4", "CONCOMITANT",
      "medcl B", "medname B_2/4", "PRIOR",
      "medcl B", "medname B_3/4", "PRIOR",
      "medcl B", "medname B_4/4", "CONCOMITANT",
      "medcl C", "medname C_1/2", "CONCOMITANT",
      "medcl C", "medname C_2/2", "CONCOMITANT"
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
    mutate(CMCAT = .data$CMCLAS)

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADCM <- mutate_na(ds = ADCM, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADCM <- ADCM %>% # nolint
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier"
    )

  # merge ADSL to be able to add CM date and study day variables
  ADCM <- inner_join(ADSL[, c("STUDYID", "USUBJID", "TRTSDTM", "TRTEDTM", "study_duration_secs")], # nolint
                     ADCM, by = c("STUDYID", "USUBJID")) %>%
    rowwise() %>%
    mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    mutate(trtedt_int = case_when(
      !is.na(.data$TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(.data$TRTEDTM) ~ floor(.data$trtsdt_int + (study_duration_secs) / 86400)
    )) %>%
    mutate(ASTDTM = as.POSIXct((sample(.data$trtsdt_int:.data$trtedt_int, size = 1) * 86400),
             origin = "1970-01-01")) %>%
    mutate(astdt_int = as.numeric(as.Date(.data$ASTDTM))) %>%
    mutate(ASTDY = ceiling(as.numeric(difftime(.data$ASTDTM, .data$TRTSDTM, units = "days")))) %>%
    # add 1 to end of range incase both values passed to sample() are the same
    mutate(AENDTM = as.POSIXct((sample(.data$astdt_int:(.data$trtedt_int + 1), size = 1) * 86400),
             origin = "1970-01-01")) %>%
    mutate(AENDY = ceiling(as.numeric(difftime(.data$AENDTM, .data$TRTSDTM, units = "days")))) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$ASTDTM)

  ADCM <- ADCM %>% # nolint
    group_by(.data$USUBJID) %>%
    mutate(CMSEQ = 1:n()) %>%
    mutate(ASEQ = .data$CMSEQ) %>%
    arrange(STUDYID, .data$USUBJID, .data$ASTDTM, .data$CMSEQ)

  # apply metadata
  ADCM <- apply_metadata(ADCM, "metadata/ADCM.yml", seed = seed, ADSL = ADSL) # nolint

  return(ADCM)
}
