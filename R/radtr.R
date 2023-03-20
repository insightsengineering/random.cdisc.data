#' Tumor Response Analysis Dataset (ADTR)
#'
#' Function for generating random dataset from Tumor Response Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: STUDYID, USUBJID, PARAMCD, BASETYPE, AVISITN, DTYPE
#'
#' @template ADSL_params
#' @param param As character string. list of parameter values.
#' @param paramcd As character string. list of parameter code values.
#' @param ... parameters from \code{\link{radrs}}
#'
#' @templateVar data adtr
#' @template param_cached
#' @template return_data.frame
#' @export
#'
#' @author tomlinsj, npaszty, Xuefeng Hou, dipietrc
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' ADTR <- radtr(ADSL, seed = 2)
#' ADTR
radtr <- function(ADSL,
                  param = c("Sum of Longest Diameter by Investigator"),
                  paramcd = c("SLDINV"),
                  seed = NULL,
                  cached = FALSE,
                  ...) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadtr"))
  }
  checkmate::assert_data_frame(ADSL)
  checkmate::assert_character(param, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramcd, min.len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  stopifnot(length(param) == length(paramcd))
  # validate and initialize related variables

  if (!is.null(seed)) {
    set.seed(seed)
  }

  # Make times consistent with ADRS at ADY and ADTM.
  adrs <- radrs(ADSL, seed = seed, ...) %>%
    dplyr::filter(.data$PARAMCD == "OVRINV") %>%
    dplyr::select(
      "STUDYID",
      "USUBJID",
      "AVISIT",
      "AVISITN",
      "ADTM",
      "ADY"
    )

  ADTR <- Map(function(parcd, par) {
    df <- adrs
    df$AVAL <- stats::rnorm(nrow(df), mean = 150, sd = 30)
    df$PARAMCD <- parcd
    df$PARAM <- par
    df
  }, paramcd, param) %>%
    Reduce(rbind, .)

  ADTR_base <- ADTR %>%
    dplyr::filter(.data$AVISITN == 0) %>%
    dplyr::group_by(.data$USUBJID, .data$PARAMCD) %>%
    dplyr::mutate(BASE = .data$AVAL) %>%
    dplyr::select("STUDYID", "USUBJID", "BASE", "PARAMCD")

  ADTR_postbase <- ADTR %>%
    dplyr::filter(.data$AVISITN > 0) %>%
    dplyr::filter(!is.na(.data$AVAL)) %>%
    dplyr::group_by(.data$USUBJID, .data$PARAMCD) %>%
    dplyr::filter(.data$AVAL == min(.data$AVAL)) %>%
    dplyr::slice(1) %>%
    dplyr::mutate(AVISIT = "POST-BASELINE MINIMUM") %>%
    dplyr::mutate(DTYPE = "MINIMUM") %>%
    dplyr::ungroup()

  ADTR_lastobs <- ADTR %>%
    dplyr::filter(.data$AVISITN > 0) %>%
    dplyr::filter(!is.na(.data$AVAL)) %>%
    dplyr::group_by(.data$USUBJID, .data$PARAMCD) %>%
    dplyr::filter(.data$ADTM == max(.data$ADTM, na.rm = TRUE)) %>%
    dplyr::slice(1) %>%
    dplyr::mutate(LAST_VISIT = .data$AVISIT) %>%
    dplyr::ungroup() %>%
    dplyr::select(
      "STUDYID",
      "USUBJID",
      "PARAMCD",
      "LAST_VISIT"
    )

  ADTR <- rbind(ADTR %>% dplyr::mutate(DTYPE = ""), ADTR_postbase)

  ADTR <- merge(ADTR, ADTR_base, by = c("STUDYID", "USUBJID", "PARAMCD")) %>%
    dplyr::mutate(
      ABLFL = dplyr::case_when(.data$AVISIT == "BASELINE" ~ "Y", TRUE ~ ""),
      AVAL = dplyr::case_when(.data$AVISIT == "BASELINE" ~ NA_real_, TRUE ~ AVAL),
      CHG = dplyr::case_when(.data$AVISITN > 0 ~ .data$AVAL - .data$BASE, TRUE ~ NA_real_),
      PCHG = dplyr::case_when(.data$AVISITN > 0 ~ .data$CHG / .data$BASE * 100, TRUE ~ NA_real_),
      AVALC = as.character(.data$AVAL),
      AVALU = "mm"
    )

  # ensure PCHG does not exceed 200%, nor go below -100% (double in size, or complete remission of tumor).
  ADTR <- ADTR %>%
    dplyr::mutate(
      PCHG_DUM = .data$PCHG,
      PCHG = dplyr::case_when(
        .data$PCHG_DUM > 200 ~ 200,
        .data$PCHG_DUM < -100 ~ -100,
        TRUE ~ .data$PCHG
      ),
      AVAL = dplyr::case_when(
        .data$PCHG_DUM > 200 ~ 3 * .data$BASE,
        .data$PCHG_DUM < -100 ~ 0,
        TRUE ~ .data$AVAL
      ),
      CHG = dplyr::case_when(
        .data$PCHG_DUM > 200 ~ 2 * .data$BASE,
        .data$PCHG_DUM < -100 ~ -.data$BASE,
        TRUE ~ .data$CHG
      )
    ) %>%
    dplyr::select(-"PCHG_DUM")

  ADTR <- merge(ADSL, ADTR, by = c("STUDYID", "USUBJID")) %>%
    dplyr::group_by(.data$USUBJID, .data$PARAMCD) %>%
    dplyr::mutate(
      ONTRTFL = factor(dplyr::case_when(
        !AVISIT %in% c("SCREENING", "BASELINE", "FOLLOW UP") ~ "Y",
        TRUE ~ ""
      )),
      ANL01FL = dplyr::case_when(
        .data$DTYPE == "" & .data$AVISITN > 0 ~ "Y",
        TRUE ~ ""
      ),
      ANL03FL = dplyr::case_when(
        .data$DTYPE == "MINIMUM" ~ "Y",
        .data$ABLFL == "Y" ~ "Y",
        TRUE ~ ""
      )
    )
  ADTR <- merge(ADTR, ADTR_lastobs, by = c("STUDYID", "USUBJID", "PARAMCD")) %>%
    dplyr::mutate(
      ANL02FL = dplyr::case_when(
        as.character(.data$AVISIT) == as.character(.data$LAST_VISIT) ~ "Y",
        .data$ABLFL == "Y" ~ "Y",
        TRUE ~ ""
      )
    ) %>%
    dplyr::select(-"LAST_VISIT")
  # Adding variables that are in ADTR osprey but not RCD.
  ADTR <- ADTR %>%
    dplyr::mutate(
      DCSREAS_GRP = ifelse(.data$DCSREAS == "ADVERSE EVENT", "Safety", "Non-Safety"),
      TRTDURD = ifelse(
        is.na(.data$TRTSDTM) | is.na(.data$TRTEDTM),
        NA,
        .data$TRTEDTM - (.data$TRTSDTM + 1)
      ),
      AGEGR1 = ifelse(.data$AGE < 65, "<65", ">=65")
    )

  # apply metadata
  ADTR <- apply_metadata(ADTR, "metadata/ADTR.yml")
  return(ADTR)
}
