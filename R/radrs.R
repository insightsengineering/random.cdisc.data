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
#' @importFrom dplyr arrange case_when filter group_by mutate n recode rowwise select ungroup
#' @importFrom magrittr %>%
#' @importFrom tibble tibble
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
  stopifnot(is_logical_single(cached))
  if (cached) {
    return(get_cached_data("cadrs"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is.null(seed) || is_numeric_single(seed))
  stopifnot((is_numeric_single(na_percentage) && na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  param_codes <- if_null(avalc, setNames(1:5, c("CR", "PR", "SD", "PD", "NE")))

  lookup_ARS <- if_null( # nolint
    lookup,
    expand.grid(
      ARM = c("A: Drug X", "B: Placebo", "C: Combination"),
      AVALC = names(param_codes)
    ) %>% mutate(
      AVAL = param_codes[.data$AVALC],
      p_scr = c(rep(0, 3), rep(0, 3), c(1, 1, 1), c(0, 0, 0), c(0, 0, 0)),
      p_bsl = c(rep(0, 3), rep(0, 3), c(1, 1, 1), c(0, 0, 0), c(0, 0, 0)),
      p_eoi = c(c(.4, .3, .5), c(.35, .25, .25), c(.1, .2, .08), c(.14, 0.15, 0.15), c(.01, 0.1, 0.02)),
      p_fu = c(c(.3, .2, .4), c(.2, .1, .3), c(.2, .2, .2), c(.3, .5, 0.1), rep(0, 3))
    )
  )

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

      # end of induction
      rsp_eoi <- sample(probs$AVALC, 1, prob = probs$p_eoi) %>% as.character()

      # follow up
      rsp_fu <- sample(probs$AVALC, 1, prob = probs$p_fu) %>% as.character()

      best_rsp <- min(param_codes[c(rsp_screen, rsp_bsl, rsp_eoi, rsp_fu)])
      best_rsp_i <- which.min(param_codes[c(rsp_screen, rsp_bsl, rsp_eoi, rsp_fu)])

      avisit <- c("SCREENING", "BASELINE", "END OF INDUCTION", "FOLLOW UP")

      tibble(
        STUDYID = pinfo$STUDYID,
        SITEID = pinfo$SITEID,
        USUBJID = pinfo$USUBJID,
        PARAMCD = as.factor(c(rep("OVRINV", 4), "BESRSPI", "INVET")),
        PARAM = as.factor(recode(.data$PARAMCD,
                                 OVRINV = "Overall Response by Investigator - by visit",
                                 OVRSPI = "Best Overall Response by Investigator (no confirmation required)",
                                 BESRSPI = "Best Confirmed Overall Response by Investigator",
                                 INVET = "Investigator End Of Induction Response"
        )),
        AVALC = c(
          rsp_screen, rsp_bsl, rsp_eoi, rsp_fu,
          names(param_codes)[best_rsp],
          rsp_eoi
        ),
        AVAL = param_codes[.data$AVALC],
        AVISIT = factor(c(avisit, avisit[best_rsp_i], avisit[2]), levels = avisit)
      )
    }) %>%
    Reduce(rbind, .) %>%
    mutate(AVALC = factor(.data$AVALC, levels = names(param_codes))) %>%
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
  ADRS <- inner_join(ADSL, # nolint
                     select(ADRS, -.data$SITEID),
                     by = c("STUDYID", "USUBJID")) %>%
    mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    rowwise() %>%
    mutate(trtedt_int = case_when(
      !is.na(TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(TRTEDTM) ~ floor(.data$trtsdt_int + (.data$study_duration_secs) / 86400)
    )) %>%
    rowwise() %>%
    mutate(ADTM = as.POSIXct((sample(.data$trtsdt_int:.data$trtedt_int, size = 1) * 86400), origin = "1970-01-01")) %>%
    mutate(ADY = ceiling(as.numeric(difftime(.data$ADTM, .data$TRTSDTM, units = "days")))) %>%
    select(-.data$trtsdt_int, -.data$trtedt_int) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$ADTM)

  ADRS[which(ADRS$AVISIT == "END OF INDUCTION"), ]$ADY <- 80 # nolint
  ADRS[which(ADRS$AVISIT == "FOLLOW UP"), ]$ADY <- 120 # nolint

  ADRS <- mutate( # nolint
    ADRS,
    AVISITN = case_when(
      AVISIT == "SCREENING" ~ -1,
      AVISIT == "BASELINE" ~ 0,
      AVISIT == "END OF INDUCTION" ~ 999.1,
      AVISIT == "FOLLOW UP" ~ 999.2,
      (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
      TRUE ~ NA_real_
    )
  ) %>%
    mutate(AVAL = ifelse(.data$BMEASIFL == "N" & .data$AVISIT == "BASELINE", NA, .data$AVAL))

  ADRS <- ADRS %>% # nolint
    group_by(.data$USUBJID) %>%
    mutate(RSSEQ = 1:n()) %>%
    mutate(ASEQ = .data$RSSEQ) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$PARAMCD, .data$AVISITN, .data$ADTM, .data$RSSEQ)

  # apply metadata
  ADRS <- apply_metadata(ADRS, "metadata/ADRS.yml") # nolint

  return(ADRS)
}
