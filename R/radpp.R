#' PK parameters dataset
#'
#' @template ADSL_params
#' @param ppcat (`character`)\cr category of parameter.
#' @param ppspec (`string`)\cr specimen material type.
#' @param paramcd (`character`)\cr parameter code.
#' @param param (`character`)\cr parameters.
#' @param paramu (`string`)\cr Analysis value unit value.
#' @param aval_mean (`vector`)\cr the mean for corresponding parameter.
#' @param visit_format (`string`)\cr the visit format to produce AVISIT in the dataset.
#' @param n_days (`integer`)\cr the number days that will be included to produce AVISIT in the dataset.
#' @inheritParams radsl
#'
#' @details One record per per study per subject per parameter category per parameter per visit.
#'
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' ADPP <- radpp(ADSL, seed = 2)
radpp <- function(ADSL, # nolint,
                  ppcat = c("Plasma Drug X", "Plasma Drug Y"),
                  ppspec = c("Plasma"),
                  paramcd = c("AUCIFO", "CMAX", "CLO"),
                  param = c("AUC Infinity Obs", "Max Conc", "Total CL Obs"),
                  paramu = c("day*ug/mL", "ug/mL", "ml/day/kg"),
                  aval_mean = c(200, 30, 5),
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

  if (!is.null(seed)) {
    set.seed(seed)
  }

  # validate and initialize related variables
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  ADPP <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PPCAT = as.factor(ppcat),
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = 1L, n_days = n_days),
    stringsAsFactors = FALSE
  )
  ADPP <- ADPP %>% # nolint
    dplyr::mutate(AVAL = stats::rnorm(nrow(ADPP), mean = 1, sd = 0.2)) %>%
    dplyr::left_join(data.frame(PARAM = param, ADJUST = aval_mean), by = "PARAM") %>%
    dplyr::mutate(AVAL = .data$AVAL * .data$ADJUST) %>%
    dplyr::select(-.data$ADJUST)

  # add PPSPEC
  ADPP$PPSPEC <- as.factor(ppspec) # nolint

  # assign related variable values: PARAMxPARAMCD are related
  ADPP$PARAMCD <- as.factor(rel_var( # nolint
    df = ADPP,
    var_name = "PARAMCD",
    var_values = param_init_list$relvar2,
    related_var = "PARAM"
  ))
  # assign related variable values: PARAMxPARAMU are related
  ADPP$AVALU <- as.factor(rel_var( # nolint
    df = ADPP,
    var_name = "PARAMU",
    var_values = unit_init_list$relvar2,
    related_var = "PARAM"
  ))
  # derive AVISITN based AVISIT and AVALC based on AVAL
  ADPP <- ADPP %>% # nolint
    dplyr::mutate(AVALC = as.character(.data$AVAL)) %>%
    dplyr::mutate(
      AVISITN = dplyr::case_when(
        AVISIT == "SCREENING" ~ 0,
        (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 1,
        TRUE ~ NA_real_
      )
    )

  ADPP <- ADSL %>% # nolint %>%
    dplyr::inner_join(ADPP, by = c("STUDYID", "USUBJID")) %>% # nolint
    dplyr::filter(.data$ACTARM != "B: Placebo", !(.data$ACTARM == "A: Drug X" & .data$PPCAT == "Plasma Drug Y"))

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADPP <- mutate_na(ds = ADPP, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADPP <- apply_metadata(ADPP, "metadata/ADPP.yml") # nolint
  return(ADPP)
}
