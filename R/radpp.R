#' Pharmacokinetics Parameters Dataset (ADPP)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating a random Pharmacokinetics Parameters Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per per study per subject per parameter category per parameter per visit.
#'
#' @inheritParams argument_convention
#' @param ppcat (`character vector`)\cr Categories of parameters.
#' @param ppspec (`character vector`)\cr Specimen material types.
#' @template param_cached
#' @templateVar data adpp
#'
#' @return `data.frame`
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' ADPP <- radpp(ADSL, seed = 2)
#' ADPP
radpp <- function(ADSL,
                  ppcat = c("Plasma Drug X", "Plasma Drug Y", "Metabolite Drug X", "Metabolite Drug Y"),
                  ppspec = c(
                    "Plasma", "Plasma", "Plasma", "Matrix of PD", "Matrix of PD",
                    "Urine", "Urine", "Urine", "Urine"
                  ),
                  paramcd = c(
                    "AUCIFO", "CMAX", "CLO", "RMAX", "TON",
                    "RENALCL", "RENALCLD", "RCAMINT", "RCPCINT"
                  ),
                  param = c(
                    "AUC Infinity Obs", "Max Conc", "Total CL Obs", "Time of Maximum Response",
                    "Time to Onset", "Renal CL", "Renal CL Norm by Dose",
                    "Amt Rec from T1 to T2", "Pct Rec from T1 to T2"
                  ),
                  paramu = c("day*ug/mL", "ug/mL", "ml/day/kg", "hr", "hr", "L/hr", "L/hr/mg", "mg", "%"),
                  aval_mean = c(200, 30, 5, 10, 3, 0.05, 0.005, 1.5613, 15.65),
                  visit_format = "CYCLE",
                  n_days = 2L,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(
                    AVAL = c(NA, 0.1)
                  ),
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadlb"))
  }

  checkmate::assert_character(ppcat)
  checkmate::assert_character(ppspec)
  checkmate::assert_character(paramcd)
  checkmate::assert_character(param)
  checkmate::assert_character(paramu)
  checkmate::assert_vector(aval_mean)
  checkmate::assert_string(visit_format)
  checkmate::assert_integer(n_days)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)
  checkmate::assert_list(na_vars)

  checkmate::assertTRUE(length(ppspec) == length(paramcd))
  checkmate::assertTRUE(length(ppspec) == length(param))
  checkmate::assertTRUE(length(ppspec) == length(paramu))
  checkmate::assertTRUE(length(ppspec) == length(aval_mean))

  if (!is.null(seed)) {
    set.seed(seed)
  }

  # validate and initialize related variables
  ppspec_init_list <- relvar_init(param, ppspec)
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  ADPP <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PPCAT = as.factor(ppcat),
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = 1L, n_days = n_days),
    stringsAsFactors = FALSE
  )
  ADPP <- ADPP %>%
    dplyr::mutate(AVAL = stats::rnorm(nrow(ADPP), mean = 1, sd = 0.2)) %>%
    dplyr::left_join(data.frame(PARAM = param, ADJUST = aval_mean), by = "PARAM") %>%
    dplyr::mutate(AVAL = .data$AVAL * .data$ADJUST) %>%
    dplyr::select(-"ADJUST")

  # assign related variable values: PARAMxPPSPEC are related
  ADPP <- ADPP %>% rel_var(
    var_name = "PPSPEC",
    related_var = "PARAM",
    var_values = ppspec_init_list$relvar2
  )

  # assign related variable values: PARAMxPARAMCD are related
  ADPP <- ADPP %>% rel_var(
    var_name = "PARAMCD",
    related_var = "PARAM",
    var_values = param_init_list$relvar2
  )

  # assign related variable values: PARAMxAVALU are related
  ADPP <- ADPP %>% rel_var(
    var_name = "AVALU",
    related_var = "PARAM",
    var_values = unit_init_list$relvar2
  )

  # derive AVISITN based AVISIT and AVALC based on AVAL
  ADPP <- ADPP %>%
    dplyr::mutate(AVALC = as.character(.data$AVAL)) %>%
    dplyr::mutate(
      AVISITN = dplyr::case_when(
        AVISIT == "SCREENING" ~ 0,
        (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 1,
        TRUE ~ NA_real_
      )
    )

  # derive REGIMEN variable
  ADPP <- ADPP %>% dplyr::mutate(REGIMEN = "BID")

  # derive PPSTINT and PPENINT based on PARAMCD
  T1_T2 <- data.frame(
    PARAMCD = c("RCAMINT", "RCAMINT", "RCPCINT", "RCPCINT"),
    PPSTINT = c("P0H", "P0H", "P0H", "P0H"),
    PPENINT = c("P12H", "P24H", "P12H", "P24H")
  )
  ADPP <- ADPP %>%
    dplyr::left_join(T1_T2, by = c("PARAMCD"), multiple = "all")

  ADPP <- dplyr::inner_join(ADPP, ADSL, by = c("STUDYID", "USUBJID")) %>%
    dplyr::filter(.data$ACTARM != "B: Placebo", !(.data$ACTARM == "A: Drug X" &
      (.data$PPCAT == "Plasma Drug Y" | .data$PPCAT == "Metabolite Drug Y")))

  # derive PKARMCD column for creating more cohorts
  ADPP <- ADPP %>%
    dplyr::mutate(PKARMCD = factor(1 + (seq_len(nrow(ADPP)) - 1) %/% (nrow(ADPP) / 10), labels = c(
      "Drug A", "Drug B", "Drug C", "Drug D", "Drug E", "Drug F", "Drug G", "Drug H",
      "Drug I", "Drug J"
    )))

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADPP <- mutate_na(ds = ADPP, na_vars = na_vars, na_percentage = na_percentage)
  }

  ADPP <- apply_metadata(ADPP, "metadata/ADPP.yml")
  return(ADPP)
}
