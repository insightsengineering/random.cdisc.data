#' Medical History Analysis Dataset (ADMH)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating a random Medical History Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: `STUDYID`, `USUBJID`, `ASTDTM`, `MHSEQ`
#'
#' @inheritParams argument_convention
#' @param max_n_mhs (`integer`)\cr Maximum number of MHs per patient. Defaults to 10.
#' @template param_cached
#' @templateVar data admh
#'
#' @return `data.frame`
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' adsl <- radsl(N = 10, study_duration = 2, seed = 1)
#'
#' admh <- radmh(adsl, seed = 2)
#' admh
radmh <- function(adsl,
                  max_n_mhs = 10L,
                  lookup = NULL,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(MHBODSYS = c(NA, 0.1), MHDECOD = c(1234, 0.1)),
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadmh"))
  }

  checkmate::assert_data_frame(adsl)
  checkmate::assert_integer(max_n_mhs, len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  checkmate::assert_data_frame(lookup, null.ok = TRUE)
  lookup_mh <- if (!is.null(lookup)) {
    lookup
  } else {
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
  }

  if (!is.null(seed)) {
    set.seed(seed)
  }
  study_duration_secs <- lubridate::seconds(attr(adsl, "study_duration_secs"))

  admh <- Map(
    function(id, sid) {
      n_mhs <- sample(0:max_n_mhs, 1)
      i <- sample(seq_len(nrow(lookup_mh)), n_mhs, TRUE)
      dplyr::mutate(
        lookup_mh[i, ],
        USUBJID = id,
        STUDYID = sid
      )
    },
    adsl$USUBJID,
    adsl$STUDYID
  ) %>%
    Reduce(rbind, .) %>%
    `[`(c(4, 5, 1, 2, 3)) %>%
    dplyr::mutate(MHTERM = MHDECOD)

  admh <- var_relabel(
    admh,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add MH date and study day variables
  admh <- dplyr::inner_join(
    admh,
    adsl,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(TRTENDT = lubridate::date(dplyr::case_when(
      is.na(TRTEDTM) ~ lubridate::floor_date(lubridate::date(TRTSDTM) + study_duration_secs, unit = "day"),
      TRUE ~ TRTEDTM
    ))) %>%
    dplyr::mutate(ASTDTM = sample(
      seq(lubridate::as_datetime(TRTSDTM), lubridate::as_datetime(TRTENDT), by = "day"),
      size = 1
    )) %>%
    dplyr::mutate(ASTDY = ceiling(difftime(ASTDTM, TRTSDTM, units = "days"))) %>%
    # add 1 to end of range incase both values passed to sample() are the same
    dplyr::mutate(AENDTM = sample(
      seq(lubridate::as_datetime(ASTDTM), lubridate::as_datetime(TRTENDT + 1), by = "day"),
      size = 1
    )) %>%
    dplyr::mutate(AENDY = ceiling(difftime(AENDTM, TRTSDTM, units = "days"))) %>%
    select(-TRTENDT) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(STUDYID, USUBJID, ASTDTM, MHTERM) %>%
    dplyr::mutate(MHDISTAT = sample(
      x = c("Resolved", "Ongoing with treatment", "Ongoing without treatment"),
      prob = c(0.6, 0.2, 0.2),
      size = dplyr::n(),
      replace = TRUE
    )) %>%
    dplyr::mutate(ATIREL = dplyr::case_when(
      (AENDTM < TRTSDTM | (is.na(AENDTM) & MHDISTAT == "Resolved")) ~ "PRIOR",
      (AENDTM >= TRTSDTM | (is.na(AENDTM) & grepl("Ongoing", MHDISTAT))) ~ "PRIOR_CONCOMITANT"
    ))

  admh <- admh %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(MHSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = MHSEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(STUDYID, USUBJID, ASTDTM, MHSEQ)

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    admh <- mutate_na(ds = admh, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  admh <- apply_metadata(admh, "metadata/ADMH.yml")

  return(admh)
}
