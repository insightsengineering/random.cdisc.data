#' Tumor Response Analysis Dataset (ADTR)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating a random Tumor Response Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: `STUDYID`, `USUBJID`, `PARAMCD`, `BASETYPE`, `AVISITN`, `DTYPE`
#'
#' @inheritParams argument_convention
#' @param ... Additional arguments to be passed to `radrs`.
#' @template param_cached
#' @templateVar data adtr
#'
#' @return `data.frame`
#' @export
#'
#' @author tomlinsj, npaszty, Xuefeng Hou, dipietrc
#'
#' @examples
#' library(random.cdisc.data)
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' ADTR <- radtr(adsl, seed = 2)
#' ADTR
radtr <- function(adsl,
                  param = c("Sum of Longest Diameter by Investigator"),
                  paramcd = c("SLDINV"),
                  seed = NULL,
                  cached = FALSE,
                  ...) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadtr"))
  }
  checkmate::assert_data_frame(adsl)
  checkmate::assert_character(param, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramcd, min.len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  stopifnot(length(param) == length(paramcd))
  # validate and initialize related variables

  if (!is.null(seed)) {
    set.seed(seed)
  }

  # Make times consistent with ADRS at ADY and ADTM.
  adrs <- radrs(adsl, seed = seed, ...) %>%
    dplyr::filter(PARAMCD == "OVRINV") %>%
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
    dplyr::filter(AVISITN == 0) %>%
    dplyr::group_by(USUBJID, PARAMCD) %>%
    dplyr::mutate(BASE = AVAL) %>%
    dplyr::select("STUDYID", "USUBJID", "BASE", "PARAMCD")

  ADTR_postbase <- ADTR %>%
    dplyr::filter(AVISITN > 0) %>%
    dplyr::filter(!is.na(AVAL)) %>%
    dplyr::group_by(USUBJID, PARAMCD) %>%
    dplyr::filter(AVAL == min(AVAL)) %>%
    dplyr::slice(1) %>%
    dplyr::mutate(AVISIT = "POST-BASELINE MINIMUM") %>%
    dplyr::mutate(DTYPE = "MINIMUM") %>%
    dplyr::ungroup()

  ADTR_lastobs <- ADTR %>%
    dplyr::filter(AVISITN > 0) %>%
    dplyr::filter(!is.na(AVAL)) %>%
    dplyr::group_by(USUBJID, PARAMCD) %>%
    dplyr::filter(ADTM == max(ADTM, na.rm = TRUE)) %>%
    dplyr::slice(1) %>%
    dplyr::mutate(LAST_VISIT = AVISIT) %>%
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
      ABLFL = dplyr::case_when(AVISIT == "BASELINE" ~ "Y", TRUE ~ ""),
      AVAL = dplyr::case_when(AVISIT == "BASELINE" ~ NA_real_, TRUE ~ AVAL),
      CHG = dplyr::case_when(AVISITN > 0 ~ AVAL - BASE, TRUE ~ NA_real_),
      PCHG = dplyr::case_when(AVISITN > 0 ~ CHG / BASE * 100, TRUE ~ NA_real_),
      AVALC = as.character(AVAL),
      AVALU = "mm"
    )

  # ensure PCHG does not exceed 200%, nor go below -100% (double in size, or complete remission of tumor).
  ADTR <- ADTR %>%
    dplyr::mutate(
      PCHG_DUM = PCHG,
      PCHG = dplyr::case_when(
        PCHG_DUM > 200 ~ 200,
        PCHG_DUM < -100 ~ -100,
        TRUE ~ PCHG
      ),
      AVAL = dplyr::case_when(
        PCHG_DUM > 200 ~ 3 * BASE,
        PCHG_DUM < -100 ~ 0,
        TRUE ~ AVAL
      ),
      CHG = dplyr::case_when(
        PCHG_DUM > 200 ~ 2 * BASE,
        PCHG_DUM < -100 ~ -BASE,
        TRUE ~ CHG
      )
    ) %>%
    dplyr::select(-"PCHG_DUM")

  ADTR <- merge(adsl, ADTR, by = c("STUDYID", "USUBJID")) %>%
    dplyr::group_by(USUBJID, PARAMCD) %>%
    dplyr::mutate(
      ONTRTFL = factor(dplyr::case_when(
        !AVISIT %in% c("SCREENING", "BASELINE", "FOLLOW UP") ~ "Y",
        TRUE ~ ""
      )),
      ANL01FL = dplyr::case_when(
        DTYPE == "" & AVISITN > 0 ~ "Y",
        TRUE ~ ""
      ),
      ANL03FL = dplyr::case_when(
        DTYPE == "MINIMUM" ~ "Y",
        ABLFL == "Y" ~ "Y",
        TRUE ~ ""
      )
    )
  ADTR <- merge(ADTR, ADTR_lastobs, by = c("STUDYID", "USUBJID", "PARAMCD")) %>%
    dplyr::mutate(
      ANL02FL = dplyr::case_when(
        as.character(AVISIT) == as.character(LAST_VISIT) ~ "Y",
        ABLFL == "Y" ~ "Y",
        TRUE ~ ""
      )
    ) %>%
    dplyr::select(-"LAST_VISIT")
  # Adding variables that are in ADTR osprey but not RCD.
  ADTR <- ADTR %>%
    dplyr::mutate(
      DCSREAS_GRP = ifelse(DCSREAS == "ADVERSE EVENT", "Safety", "Non-Safety"),
      TRTDURD = ifelse(
        is.na(TRTSDTM) | is.na(TRTEDTM),
        NA,
        TRTEDTM - (TRTSDTM + lubridate::days(1))
      ),
      AGEGR1 = ifelse(AGE < 65, "<65", ">=65")
    )

  # apply metadata
  ADTR <- apply_metadata(ADTR, "metadata/ADTR.yml")
  return(ADTR)
}
