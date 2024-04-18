#' Tumor Response Analysis Dataset (ADRS)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating a random Tumor Response Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details
#' One record per subject per parameter per analysis visit per analysis date.
#' SDTM variables are populated on new records coming from other single records.
#' Otherwise, SDTM variables are left blank.
#'
#' Keys: `STUDYID`, `USUBJID`, `PARAMCD`, `AVISITN`, `ADT`, `RSSEQ`
#'
#' @inheritParams argument_convention
#' @param avalc (`character vector`)\cr Analysis value categories.
#' @template param_cached
#' @templateVar data adrs
#'
#' @return `data.frame`
#' @export
#'
#' @examples
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' adrs <- radrs(adsl, seed = 2)
#' adrs
radrs <- function(adsl,
                  avalc = NULL,
                  lookup = NULL,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(AVISIT = c(NA, 0.1), AVAL = c(1234, 0.1), AVALC = c(1234, 0.1)),
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadrs"))
  }

  checkmate::assert_data_frame(adsl)
  checkmate::assert_vector(avalc, null.ok = TRUE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  param_codes <- if (!is.null(avalc)) {
    avalc
  } else {
    stats::setNames(1:5, c("CR", "PR", "SD", "PD", "NE"))
  }

  checkmate::assert_data_frame(lookup, null.ok = TRUE)
  lookup_ars <- if (!is.null(lookup)) {
    lookup
  } else {
    expand.grid(
      ARM = c("A: Drug X", "B: Placebo", "C: Combination"),
      AVALC = names(param_codes)
    ) %>% dplyr::mutate(
      AVAL = param_codes[AVALC],
      p_scr = c(rep(0, 3), rep(0, 3), c(1, 1, 1), c(0, 0, 0), c(0, 0, 0)),
      p_bsl = c(rep(0, 3), rep(0, 3), c(1, 1, 1), c(0, 0, 0), c(0, 0, 0)),
      p_cycle = c(c(.4, .3, .5), c(.35, .25, .25), c(.1, .2, .08), c(.14, 0.15, 0.15), c(.01, 0.1, 0.02)),
      p_eoi = c(c(.4, .3, .5), c(.35, .25, .25), c(.1, .2, .08), c(.14, 0.15, 0.15), c(.01, 0.1, 0.02)),
      p_fu = c(c(.3, .2, .4), c(.2, .1, .3), c(.2, .2, .2), c(.3, .5, 0.1), rep(0, 3))
    )
  }

  if (!is.null(seed)) {
    set.seed(seed)
  }
  study_duration_secs <- lubridate::seconds(attr(adsl, "study_duration_secs"))

  adrs <- split(adsl, adsl$USUBJID) %>%
    lapply(function(pinfo) {
      probs <- dplyr::filter(lookup_ars, ARM == as.character(pinfo$ACTARM))

      # screening
      rsp_screen <- sample(probs$AVALC, 1, prob = probs$p_scr) %>% as.character()

      # baseline
      rsp_bsl <- sample(probs$AVALC, 1, prob = probs$p_bsl) %>% as.character()

      # cycle
      rsp_c2d1 <- sample(probs$AVALC, 1, prob = probs$p_cycle) %>% as.character()
      rsp_c4d1 <- sample(probs$AVALC, 1, prob = probs$p_cycle) %>% as.character()

      # end of induction
      rsp_eoi <- sample(probs$AVALC, 1, prob = probs$p_eoi) %>% as.character()

      # follow up
      rsp_fu <- sample(probs$AVALC, 1, prob = probs$p_fu) %>% as.character()

      best_rsp <- min(param_codes[c(rsp_screen, rsp_bsl, rsp_eoi, rsp_fu, rsp_c2d1, rsp_c4d1)])
      best_rsp_i <- which.min(param_codes[c(rsp_screen, rsp_bsl, rsp_eoi, rsp_fu, rsp_c2d1, rsp_c4d1)])

      avisit <- c("SCREENING", "BASELINE", "CYCLE 2 DAY 1", "CYCLE 4 DAY 1", "END OF INDUCTION", "FOLLOW UP")

      # meaningful date information
      trtstdt <- lubridate::date(pinfo$TRTSDTM)
      trtendt <- lubridate::date(dplyr::if_else(
        !is.na(pinfo$TRTEDTM), pinfo$TRTEDTM,
        lubridate::floor_date(trtstdt + study_duration_secs, unit = "day")
      ))
      scr_date <- trtstdt - lubridate::days(100)
      bs_date <- trtstdt
      flu_date <- sample(seq(lubridate::as_datetime(trtstdt), lubridate::as_datetime(trtendt), by = "day"), size = 1)
      eoi_date <- sample(seq(lubridate::as_datetime(trtstdt), lubridate::as_datetime(trtendt), by = "day"), size = 1)
      c2d1_date <- sample(seq(lubridate::as_datetime(trtstdt), lubridate::as_datetime(trtendt), by = "day"), size = 1)
      c4d1_date <- min(lubridate::date(c2d1_date + lubridate::days(60)), trtendt)

      tibble::tibble(
        STUDYID = pinfo$STUDYID,
        SITEID = pinfo$SITEID,
        USUBJID = pinfo$USUBJID,
        PARAMCD = as.factor(c(rep("OVRINV", 6), "BESRSPI", "INVET")),
        PARAM = as.factor(dplyr::recode(
          PARAMCD,
          OVRINV = "Overall Response by Investigator - by visit",
          OVRSPI = "Best Overall Response by Investigator (no confirmation required)",
          BESRSPI = "Best Confirmed Overall Response by Investigator",
          INVET = "Investigator End Of Induction Response"
        )),
        AVALC = c(
          rsp_screen, rsp_bsl, rsp_c2d1, rsp_c4d1, rsp_eoi, rsp_fu,
          names(param_codes)[best_rsp],
          rsp_eoi
        ),
        AVAL = param_codes[AVALC],
        AVISIT = factor(c(avisit, avisit[best_rsp_i], avisit[5]), levels = avisit)
      ) %>%
        merge(
          tibble::tibble(
            AVISIT = avisit,
            ADTM = c(scr_date, bs_date, c2d1_date, c4d1_date, eoi_date, flu_date),
            AVISITN = c(-1, 0, 2, 4, 999, 999),
            TRTSDTM = pinfo$TRTSDTM
          ) %>%
            dplyr::mutate(
              ADY = ceiling(difftime(ADTM, TRTSDTM, units = "days"))
            ) %>%
            dplyr::select(-"TRTSDTM"),
          by = "AVISIT"
        )
    }) %>%
    Reduce(rbind, .) %>%
    dplyr::mutate(AVALC = factor(AVALC, levels = names(param_codes))) %>%
    rcd_var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier"
    )

  adrs <- rcd_var_relabel(
    adrs,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add RS date and study day variables


  adrs <- dplyr::inner_join(
    dplyr::select(adrs, -"SITEID"),
    adsl,
    by = c("STUDYID", "USUBJID")
  )

  adrs <- adrs %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(RSSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = RSSEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      STUDYID,
      USUBJID,
      PARAMCD,
      AVISITN,
      ADTM,
      RSSEQ
    )

  if (length(na_vars) > 0 && na_percentage > 0) {
    adrs <- mutate_na(ds = adrs, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  adrs <- apply_metadata(adrs, "metadata/ADRS.yml")

  return(adrs)
}
