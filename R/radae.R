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
#' @importFrom dplyr arrange case_when group_by mutate n rowwise select ungroup
#' @importFrom magrittr %>%
#' @importFrom tibble tribble
#' @importFrom rlang .data
#'
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, study_duration = 2, seed = 1)
#' radae(ADSL, seed = 2)
radae <- function(ADSL, # nolint
                  max_n_aes = 10L,
                  lookup = NULL,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(AEBODSYS = c(NA, 0.1), AEDECOD = c(1234, 0.1), AETOXGR = c(1234, 0.1)),
                  cached = FALSE) {
  stopifnot(is_logical_single(cached))
  if (cached) {
    return(get_cached_data("cadae"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is_integer_single(max_n_aes))
  stopifnot(is.null(seed) || is_numeric_single(seed))
  stopifnot((is_numeric_single(na_percentage) && na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  lookup_ae <- if_null( # nolint
    lookup,
    tribble(
      ~AEBODSYS, ~AELLT,          ~AEDECOD,        ~AEHLT,        ~AEHLGT,      ~AETOXGR, ~AESOC, ~AESER, ~AEREL,
      "cl A.1",  "llt A.1.1.1.1", "dcd A.1.1.1.1", "hlt A.1.1.1", "hlgt A.1.1", "1",        "cl A", "N",    "N",
      "cl A.1",  "llt A.1.1.1.2", "dcd A.1.1.1.2", "hlt A.1.1.1", "hlgt A.1.1", "2",        "cl A", "Y",    "N",
      "cl B.1",  "llt B.1.1.1.1", "dcd B.1.1.1.1", "hlt B.1.1.1", "hlgt B.1.1", "5",        "cl B", "Y",    "Y",
      "cl B.2",  "llt B.2.1.2.1", "dcd B.2.1.2.1", "hlt B.2.1.2", "hlgt B.2.1", "3",        "cl B", "N",    "N",
      "cl B.2",  "llt B.2.2.3.1", "dcd B.2.2.3.1", "hlt B.2.2.3", "hlgt B.2.2", "1",        "cl B", "Y",    "N",
      "cl C.1",  "llt C.1.1.1.3", "dcd C.1.1.1.3", "hlt C.1.1.1", "hlgt C.1.1", "4",        "cl C", "N",    "Y",
      "cl C.2",  "llt C.2.1.2.1", "dcd C.2.1.2.1", "hlt C.2.1.2", "hlgt C.2.1", "2",        "cl C", "N",    "Y",
      "cl D.1",  "llt D.1.1.1.1", "dcd D.1.1.1.1", "hlt D.1.1.1", "hlgt D.1.1", "5",        "cl D", "Y",    "Y",
      "cl D.1",  "llt D.1.1.4.2", "dcd D.1.1.4.2", "hlt D.1.1.4", "hlgt D.1.1", "3",        "cl D", "N",    "N",
      "cl D.2",  "llt D.2.1.5.3", "dcd D.2.1.5.3", "hlt D.2.1.5", "hlgt D.2.1", "1",        "cl D", "N",    "Y"
    )
  )

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADAE <- Map( # nolint
    function(id, sid) {
      n_aes <- sample(c(0, seq_len(max_n_aes)), 1)
      i <- sample(seq_len(nrow(lookup_ae)), n_aes, TRUE)
      mutate(
        lookup_ae[i, ],
        USUBJID = id,
        STUDYID = sid
      )
    },
    ADSL$USUBJID,
    ADSL$STUDYID
  ) %>%
    Reduce(rbind, .) %>%
    `[`(c(10, 11, 1, 2, 3, 4, 5, 6, 7, 8, 9)) %>%
    mutate(AETERM = gsub("dcd", "trm", .data$AEDECOD)) %>%
    mutate(AESEV = case_when(
      AETOXGR == 1 ~ "MILD",
      AETOXGR %in% c(2, 3) ~ "MODERATE",
      AETOXGR %in% c(4, 5) ~ "SEVERE"
    ))

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADAE <- mutate_na(ds = ADAE, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADAE <- var_relabel( # nolint
    ADAE,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add AE date and study day variables
  ADAE <- inner_join(ADSL, # nolint
                     ADAE,
                     by = c("STUDYID", "USUBJID")) %>%
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
    select(-.data$trtsdt_int, -.data$trtedt_int, -.data$astdt_int) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$ASTDTM, .data$AETERM)

  ADAE <- ADAE %>% # nolint
    group_by(.data$USUBJID) %>%
    mutate(AESEQ = 1:n()) %>%
    mutate(ASEQ = .data$AESEQ) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$ASTDTM, .data$AETERM, .data$AESEQ)

  # apply metadata
  ADAE <- apply_metadata(ADAE, "metadata/ADAE.yml") # nolint

  return(ADAE)
}
