#' ADA dataset
#'
#' @template ADSL_params
#' @param constants (`character vector`)\cr Constant parameters to be used in the PK
#' equation for creating analysis values.
#' @param duration (`numeric`)\cr Duration in number of days.
#' @inheritParams radpc
#'
#' @details One record per per study per subject per parameter per time point
#'
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' ADPC <- radpc(ADSL, seed = 2)
#' ADPC <- radpc(ADSL, seed = 2, duration = 3)
#' ADAB <- radab(ADPC, seed = 2, duration = 2)
#'
# We can filter the ADPC by PCTPT = "PRE-DOSE", "PREDOSE" toupper()
# , then for ADAB.PARAM = PARAM = "Antibody titer units"
# and "ADA interpreted per sample result", the ADAB.VISIT and ADAB.NRELTM1 should be equal to the ADPC.VISIT,
# and ADPC.NRELTM1, respectively.
#' #
# Key variables:
#   STUDYID, USUBJID, ARM, ACTARM, (exist in ADSL)
# VISIT, VISITDY, ISTPT, AVAL, AVALC, AVALU, PARAM, PARAMCD, PARCAT1, NRELTM1, RELTMU, ADABLFL, ADAPBLFL, ABLFL.
#' #
# The PARAM and PARAMCD are quite consistent across all the studies.
# ADA data were collected at the same time with the pre-dose PK.
# We need to have ADPC and ADAB aligned, this is required in the ADA standard table 3.
#' #
#' #
# Below is the dummy example. PARAM = "Antibody titer units" and "ADA interpreted per sample result"
# are VISIT-level variables, rest are subject-level variables which are derived based the "Antibody titer units" or
# "ADA interpreted per sample result".
radab <- function(ADPC, # nolint
                  constants = c(D = 100, ka = 0.8, ke = 1),
                  duration = 2,
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
  checkmate::assert_numeric(x = duration, max.len = 1)
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

  # ADAB <- ADPC %>%
  #   select(
  #     STUDYID, USUBJID, ARM, ACTARM,
  #     VISIT, VISITDY, PCTPT,
  #     NRELTM1, RELTMU
  #   ) %>%
  #   rename(ISPTPT = PCTPT) %>%
  #   filter(toupper(ISPTPT) %in% c("PRE-DOSE", "PREDOSE")) %>%
  #   mutate(
  #     AVAL = 999,
  #     AVALC = ifelse(1, 0, 1),
  #     PARCAT1 = paste0(ARM, "Antibody"),

  ADAB <- expand.grid( # nolint
      STUDYID = unique(ADPC$STUDYID),
      USUBJID = ADPC$USUBJID,
      PARAM = as.factor(param_init_list$relvar1),

            # ARM = ADPC$ARM,
            # ARMCD = ADPC$ARMCD,
            # ACTARM = ADPC$ACTARM,
            # VISIT = ADPC$VISIT,
            # VISITDY = ADPC$VISITDY,
            # AVAL = ADPC$AVAL,
            # AVALC = ADPC$AVALC,
            # AVALU = ADPC$AVALU,
            # ARELTM1 = ADPC$ARELTM1,
            # NRELTM1 = ADPC$NRELTM1,
            # ARELTM2 = ADPC$ARELTM2,
            # NRELTM2 = ADPC$NRELTM2,
            # RELTMU = ADPC$RELTMU,
            # PCTPT = ADPC$PCTPT,

      # AVISIT = visit_schedule(visit_format = visit_format, n_assessments = 1L, n_days = n_days),
      stringsAsFactors = FALSE
    )

  # inner join

    # ADPP <- expand.grid( # nolint
    #   STUDYID = unique(ADSL$STUDYID),
    #   USUBJID = ADSL$USUBJID,
    #   PPCAT = as.factor(ppcat),
    #   PARAM = as.factor(param_init_list$relvar1),
    #   AVISIT = visit_schedule(visit_format = visit_format, n_assessments = 1L, n_days = n_days),
    #   stringsAsFactors = FALSE
    # )

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


  # We can filter the ADPC by PCTPT = "PRE-DOSE", "PREDOSE" toupper()
  # , then for ADAB.PARAM = PARAM = "Antibody titer units"

  # radab_core <- function(day) {
  #   ADAB_day <- tidyr::expand_grid( # nolint
  #     # nolint
  #     data.frame(
  #       STUDYID = ADPC$STUDYID,
  #       USUBJID = ADPC$USUBJID,
  #       ARM = ADPC$ARM,
  #       ARMCD = ADPC$ARMCD,
  #       ACTARM = ADPC$ACTARM,
  #       VISIT = ADPC$VISIT,
  #       VISITDY = ADPC$VISITDY,
  #       AVAL = ADPC$AVAL,
  #       AVALC = ADPC$AVALC,
  #       AVALU = ADPC$AVALU,
  #       PARAM = ADPC$PARAM,
  #       ARELTM1 = ADPC$ARELTM1,
  #       NRELTM1 = ADPC$NRELTM1,
  #       ARELTM2 = ADPC$ARELTM2,
  #       NRELTM2 = ADPC$NRELTM2,
  #       RELTMU = ADPC$RELTMU,
  #       PCTPT = ADPC$PCTPT,
  #       # "ISTPT"    "PARAMCD"  "PARCAT1"  "ADABLFL"  "ADAPBLFL" "ABLFL"
  #
  #
  #
  #       A0 = unname(constants["D"]),
  #       ka = unname(constants["ka"]) - stats::runif(length(ADPC$USUBJID), -0.2, 0.2),
  #       ke = unname(constants["ke"]) - stats::runif(length(ADPC$USUBJID), -0.2, 0.2)
  #     ),
  #     # PCTPTNUM = if (day == 1) c(0, 0.5, 1, 1.5, 2, 3, 4, 8, 12, 24) else 24 * day,
  #   ) %>%
  #     dplyr::mutate(
  #       # "ISTPT"    "PARAMCD"  "PARCAT1"  "ADABLFL"  "ADAPBLFL" "ABLFL"
  #       A0 = ifelse(.data$PARAM == "Plasma Drug Y", .data$A0, .data$A0 / 2)
  #     ) %>%
  #     dplyr::select(-c(.data$A0, .data$ka, .data$ke))
  #
  #   return(ADAB_day)
  # }

  # ADAB <- list() # nolint
  # for (day in seq(duration)) {
  #   ADAB[[day]] <- radab_core(day = day)
  # }
  #
  # ADAB <- do.call(rbind, ADAB) # nolint

  # ADAB <- ADAB %>% # nolint
  #   dplyr::filter(.data$ACTARM != "B: Placebo", !(.data$ACTARM == "A: Drug X" & .data$PARAM == "Plasma Drug Y"))

  # ADAB <- ADPC %>% # nolint
  #   select(-c("PARAM","PCTPTNUM")) %>%
  #   dplyr::right_join(ADAB, by = c("STUDYID", "USUBJID", "ARMCD")) %>% # nolint
  #   dplyr::filter(.data$ACTARM != "B: Placebo", !(.data$ACTARM == "A: Drug X" & .data$PARAM == "Plasma Drug Y"))

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADAB <- mutate_na(ds = ADAB, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADAB <- apply_metadata(ADAB, "metadata/ADAB.yml") # nolint
}

ADAB <- radab(ADPC, seed = 2, duration = 2)
