#' Medical History Analysis Dataset (ADMH)
#'
#' Function for generating random Medical History Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: STUDYID USUBJID ASTDTM MHSEQ.
#'
#' @template ADSL_params
#' @template lookup_param
#' @param max_n_mhs Maximum number of MHs per patient.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data admh
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, study_duration = 2, seed = 1)
#' radmh(ADSL, seed = 2)
radmh <- function(ADSL, # nolint
                  max_n_mhs = 10L,
                  lookup = NULL,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(MHBODSYS = c(NA, 0.1), MHDECOD = c(1234, 0.1)),
                  cached = FALSE) {
  stopifnot(is_logical_single(cached))
  if (cached) {
    return(get_cached_data("cadmh"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is_integer_single(max_n_mhs))
  stopifnot(is.null(seed) || is_numeric_single(seed))
  stopifnot((is_numeric_single(na_percentage) && na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  lookup_mh <- if_null(
    lookup,
    tibble::tribble(
      ~MHBODSYS, ~MHDECOD, ~MHSOC,
      "cl A", "trm A_1/2", "cl A",
      "cl A", "trm A_2/2", "cl A",
      "cl B", "trm B_1/3", "cl B",
      "cl B", "trm B_2/3", "cl B",
      "cl B", "trm B_3/3", "cl B",
      "cl C", "trm C_1/2", "cl C",
      "cl C", "trm C_2/2", "cl C",
      "cl D", "trm D_1/3", "cl D",
      "cl D", "trm D_2/3", "cl D",
      "cl D", "trm D_3/3", "cl D"
    )
  )

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADMH <- Map( # nolint
    function(id, sid) {
      n_mhs <- sample(0:max_n_mhs, 1)
      i <- sample(seq_len(nrow(lookup_mh)), n_mhs, TRUE)
      dplyr::mutate(
        lookup_mh[i, ],
        USUBJID = id,
        STUDYID = sid
      )
    },
    ADSL$USUBJID,
    ADSL$STUDYID
  ) %>%
    Reduce(rbind, .) %>%
    `[`(c(4, 5, 1, 2, 3)) %>%
    dplyr::mutate(MHTERM = .data$MHDECOD)

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADMH <- mutate_na(ds = ADMH, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADMH <- var_relabel( # nolint
    ADMH,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add MH date and study day variables
  ADMH <- dplyr::inner_join( # nolint
    ADSL, # nolint
    ADMH,
    by = c("STUDYID", "USUBJID")) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    dplyr::mutate(trtedt_int = dplyr::case_when(
      !is.na(.data$TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(.data$TRTEDTM) ~ floor(.data$trtsdt_int + (.data$study_duration_secs) / 86400)
    )) %>%
    dplyr::mutate(ASTDTM = as.POSIXct(
      (sample(.data$trtsdt_int:.data$trtedt_int, size = 1) * 86400),
      origin = "1970-01-01")) %>%
    dplyr::mutate(astdt_int = as.numeric(as.Date(.data$ASTDTM))) %>%
    dplyr::mutate(ASTDY = ceiling(as.numeric(difftime(.data$ASTDTM, .data$TRTSDTM, units = "days")))) %>%
    # add 1 to end of range incase both values passed to sample() are the same
    dplyr::mutate(AENDTM = as.POSIXct(
      (sample(.data$astdt_int:(.data$trtedt_int + 1), size = 1) * 86400),
      origin = "1970-01-01")) %>%
    dplyr::mutate(AENDY = ceiling(as.numeric(difftime(.data$AENDTM, .data$TRTSDTM, units = "days")))) %>%
    dplyr::select(-.data$trtsdt_int, -.data$trtedt_int, -.data$astdt_int) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$STUDYID, .data$USUBJID, .data$ASTDTM, .data$MHTERM)

  ADMH <- ADMH %>% # nolint
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(MHSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = .data$MHSEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$STUDYID, .data$USUBJID, .data$ASTDTM, .data$MHSEQ)

  # apply metadata
  ADMH <- apply_metadata(ADMH, "metadata/ADMH.yml") # nolint

  return(ADMH)
}