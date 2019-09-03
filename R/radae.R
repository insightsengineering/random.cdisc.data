#' Adverse Event Analysis Dataset (ADAE)
#'
#' Function for generating random Adverse Event Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: STUDYID USUBJID ASTDTM AETERM AESEQ.
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
#' @importFrom dplyr mutate rowwise arrange ungroup
#' @importFrom magrittr %>%
#' @importFrom tibble tribble
#' @importFrom rlang .data
#'
#' @export
#'
#' @examples
#' library(dplyr)
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, study_duration = 2, seed = 1)
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
  stopifnot((na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  if (is.null(lookup)) {
    lookup_ae <- tribble(
      ~AEBODSYS, ~AEDECOD, ~AETOXGR, ~AESOC, ~AESER, ~AREL,
      "cl A", "trm A_1/2", 1, "cl A", "N", "N",
      "cl A", "trm A_2/2", 2, "cl A", "Y", "N",
      "cl B", "trm B_1/3", 5, "cl B", "N", "Y",
      "cl B", "trm B_2/3", 3, "cl B", "N", "N",
      "cl B", "trm B_3/3", 1, "cl B", "Y", "N",
      "cl C", "trm C_1/2", 4, "cl C", "N", "Y",
      "cl C", "trm C_2/2", 2, "cl C", "N", "Y",
      "cl D", "trm D_1/3", 5, "cl D", "Y", "N",
      "cl D", "trm D_2/3", 3, "cl D", "N", "N",
      "cl D", "trm D_3/3", 1, "cl D", "N", "Y"
    )
  } else {
    lookup_ae <- lookup
  }

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
    `[`(c(7, 8, 1, 2, 3, 4, 5, 6)) %>%
    mutate(AETERM = .data$AEDECOD)

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADAE <- mutate_na(ds = ADAE, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADAE <- ADAE %>% # nolint
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier"
    )

  # merge ADSL to be able to add AE date and study day variables
  ADAE <- inner_join(ADSL[, c("STUDYID", "USUBJID", "TRTSDTM", "TRTEDTM", "study_duration_secs")], # nolint
                     ADAE, by = c("STUDYID", "USUBJID")) %>%
    rowwise() %>%
    mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    mutate(trtedt_int = case_when(
      !is.na(.data$TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(.data$TRTEDTM) ~ floor(trtsdt_int + (study_duration_secs) / 86400)
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
    arrange(.data$STUDYID, .data$USUBJID, .data$ASTDTM, .data$AETERM)

  ADAE <- ADAE %>% # nolint
    group_by(.data$USUBJID) %>%
    mutate(AESEQ = 1:n()) %>%
    mutate(ASEQ = .data$AESEQ) %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$ASTDTM, .data$AETERM, .data$AESEQ)

  # apply metadata
  ADAE <- apply_metadata(ADAE, "metadata/ADAE.yml", seed = seed, ADSL = ADSL) # nolint

  return(ADAE)
}
