#' ADA dataset
#'
#' @template ADSL_params
#' @param constants (`character vector`)\cr Constant parameters to be used for creating analysis values.
#' @inheritParams radpc
#'
#' @details One record per study per subject per parameter per time point
#'
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' ADPC <- radpc(ADSL, seed = 2)
#' ADAB <- radab(ADPC, seed = 2)
radab <- function(ADPC, # nolint
                  constants = c(D = 100, ka = 0.8, ke = 1),
                  paramcd = c(
                    "R1800000", "RESULT"
                  ),
                  param = c(
                    "Antibody titer units", "ADA interpreted per sample result"
                  ),
                  avalu = c("titer", ""),
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(
                    AVAL = c(NA, 0.1)
                  ),
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadpc"))
  }

  checkmate::assert_data_frame(ADPC)
  checkmate::assert_subset(names(constants), c("D", "ka", "ke"))
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1, na.ok = TRUE)
  checkmate::assert_list(na_vars)


  checkmate::assert_character(paramcd)
  checkmate::assert_character(param)
  checkmate::assert_character(avalu)
  checkmate::assertTRUE(length(paramcd) == length(param))
  checkmate::assertTRUE(length(paramcd) == length(avalu))


  if (!is.null(seed)) {
    set.seed(seed)
  }

  # validate and initialize related variables
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, avalu)

  ADAB <- expand.grid( # nolint
    STUDYID = unique(ADPC$STUDYID),
    USUBJID = unique(ADPC$USUBJID),
    VISIT = unique(ADPC$VISIT),
    PARAM = as.factor(param_init_list$relvar1),
    PARCAT1 = paste(unique(ADPC$ARM), "Antibody"),
    PCTPT = "Predose",
    stringsAsFactors = FALSE
  )

  aval_random <- stats::rnorm(nrow(unique(ADAB %>% select(USUBJID, VISIT))), mean = 1, sd = 0.2)
  aval_random <- cbind(unique(ADAB %>% select(USUBJID, VISIT)), AVAL1 = aval_random)

  ADAB <- ADAB %>% left_join(aval_random, by = c("USUBJID", "VISIT")) # nolint
  ADAB <- ADAB %>% # nolint
    dplyr::mutate(
      AVAL2 = ifelse(AVAL1 >= 1, AVAL1, NA),
      AVALC = case_when(
        !is.na(AVAL2) ~ "POSITIVE",
        is.na(AVAL2) ~ "NEGATIVE"
      ),
      AVAL = case_when(
        (PARAM == "ADA interpreted per sample result" & !is.na(AVAL2)) ~ 1,
        (PARAM == "ADA interpreted per sample result" & is.na(AVAL2)) ~ 0,
        (PARAM == "Antibody titer units" & !is.na(AVAL2)) ~ AVAL2,
        TRUE ~ as.numeric(NA)
      ),
      ISTPT = "Predose",
      ADABLFL = "Y",
      ADAPBLFL = "Y",
      ABLFL = "Y"
    ) %>%
    select(-c(AVAL1, AVAL2))

  # assign related variable values: PARAMxPARAMCD are related
  ADAB$PARAMCD <- as.factor(rel_var( # nolint
    df = ADAB,
    var_name = "PARAMCD",
    var_values = param_init_list$relvar2,
    related_var = "PARAM"
  ))

  # assign related variable values: PARAMxPARAMU are related
  ADAB$AVALU <- as.factor(rel_var( # nolint
    df = ADAB,
    var_name = "PARAMU",
    var_values = unit_init_list$relvar2,
    related_var = "PARAM"
  ))

  # retrieve other variables from ADPC
  ADAB <- ADAB %>% # nolint
    inner_join(ADPC %>% select(
      STUDYID,
      USUBJID,
      VISIT,
      PCTPT,
      ARM,
      ACTARM,
      VISITDY,
      ARELTM1,
      NRELTM1,
      ARELTM2,
      NRELTM2,
      RELTMU
    ) %>%
      unique(), by = c("STUDYID", "USUBJID", "VISIT", "PCTPT")) %>%
    select(-PCTPT)

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADAB <- mutate_na(ds = ADAB, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADAB <- apply_metadata(ADAB, "metadata/ADAB.yml") # nolint
}
