#' Tumor Response Analysis Data Set (ADRS)
#'
#' Function for generating random Tumor Response Analysis Data Set for a given
#' Subject-Level Analysis Dataset.
#'
#' @details
#' One record per subject per parameter per analysis visit per analysis date.
#' SDTM variables are populated on new records coming from other single records.
#' Otherwise, SDTM variables are left blank.
#'
#' Keys: STUDYID USUBJID PARAMCD AVISITN ADT RSSEQ
#'
#' @param avalc Vector of analysis value categories.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @template ADSL_params
#' @template lookup_param
#' @templateVar data adrs
#' @template param_cached
#' @template return_data.frame
#'
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' radrs(ADSL, seed = 2)
radrs <- function(ADSL, # nolint
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

  checkmate::assert_data_frame(ADSL)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1, null.ok = TRUE)
  # also check na_percentage is not 1
  stopifnot(is.na(na_percentage) || na_percentage < 1)

  param_codes <- if (!is.null(avalc)) {
    avalc
  } else {
    stats::setNames(1:5, c("CR", "PR", "SD", "PD", "NE"))
  }

  lookup_ARS <- if (!is.null(lookup)) { # nolint
    lookup
  } else {
    expand.grid(
      ARM = c("A: Drug X", "B: Placebo", "C: Combination"),
      AVALC = names(param_codes)
    ) %>% dplyr::mutate(
      AVAL = param_codes[.data$AVALC],
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

  ADRS <- split(ADSL, ADSL$USUBJID) %>% # nolint
    lapply(function(pinfo) {

      probs <- dplyr::filter(lookup_ARS, .data$ARM == as.character(pinfo$ACTARM))

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
      trtsdt_int <- as.numeric(as.Date(pinfo$TRTSDTM))
      trtedt_int <- ifelse(
        !is.na(pinfo$TRTEDTM),  as.numeric(as.Date(pinfo$TRTEDTM)),
        floor(trtsdt_int + (pinfo$study_duration_secs) / 86400))
      scr_date <- as.POSIXct(((trtsdt_int - 100) * 86400), origin = "1970-01-01")
      bs_date <- pinfo$TRTSDTM
      flu_date <- as.POSIXct((sample(trtsdt_int:trtedt_int, size = 1) * 86400), origin = "1970-01-01")
      eoi_date <- as.POSIXct((sample(trtsdt_int:trtedt_int, size = 1) * 86400), origin = "1970-01-01")
      c2d1_date <- as.POSIXct((sample(trtsdt_int:trtedt_int, size = 1) * 86400), origin = "1970-01-01")
      c4d1_date <- min(c2d1_date + 60 * 86400, pinfo$TRTEDTM)

      tibble::tibble(
        STUDYID = pinfo$STUDYID,
        SITEID = pinfo$SITEID,
        USUBJID = pinfo$USUBJID,
        PARAMCD = as.factor(c(rep("OVRINV", 6), "BESRSPI", "INVET")),
        PARAM = as.factor(dplyr::recode(
          .data$PARAMCD,
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
        AVAL = param_codes[.data$AVALC],
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
              ADY = ceiling(as.numeric(difftime(.data$ADTM, .data$TRTSDTM, units = "days")))
            ) %>%
            dplyr::select(-.data$TRTSDTM),
          by = "AVISIT"
        )
    }) %>%
    Reduce(rbind, .) %>%
    dplyr::mutate(AVALC = factor(.data$AVALC, levels = names(param_codes))) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier"
    )

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADRS <- mutate_na(ds = ADRS, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADRS <- var_relabel( # nolint
    ADRS,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add RS date and study day variables


  ADRS <- dplyr::inner_join( # nolint
    ADSL, # nolint
    dplyr::select(ADRS, -.data$SITEID),
    by = c("STUDYID", "USUBJID"))

  ADRS <- ADRS %>% # nolint
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(RSSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = .data$RSSEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      .data$STUDYID,
      .data$USUBJID,
      .data$PARAMCD,
      .data$AVISITN,
      .data$ADTM,
      .data$RSSEQ
    )

  # apply metadata
  ADRS <- apply_metadata(ADRS, "metadata/ADRS.yml") # nolint

  return(ADRS)
}
