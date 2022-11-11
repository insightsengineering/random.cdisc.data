#' ADA dataset
#'
#' @param constants (`character vector`)\cr Constant parameters to be used for creating analysis values.
#' @inheritParams radpc
#' @param ADPC (`character`)\cr parameter code.
#' @param paramcd (`character`)\cr parameter code.
#' @param param (`character`)\cr parameters.
#'
#' @details One record per study per subject per parameter per time point
#'
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' ADPC <- radpc(ADSL, seed = 2, duration = 9*7)
#' ADAB <- radab(ADSL, ADPC, seed = 2)
radab <- function(ADSL, # nolint
                  ADPC, # nolint
                  constants = c(D = 100, ka = 0.8, ke = 1),
                  paramcd = c(
                    "R1800000", "RESULT1", "R1800001", "RESULT2", "ADASTAT1", "INDUCD1", "ENHANC1",
                    "TRUNAFF1", "EMERNEG1", "EMERPOS1", "PERSADA1", "TRANADA1", "BFLAG1", "TIMADA1",
                    "ADADUR1", "ADASTAT2", "INDUCD2", "ENHANC2", "EMERNEG2", "EMERPOS2", "BFLAG2",
                    "TRUNAFF2"
                  ),
                  param = c(
                    "Antibody titer units", "ADA interpreted per sample result",
                    "Neutralizing Antibody titer units", "NAB interpreted per sample result",
                    "ADA Status of a patient", "Treatment induced ADA", "Treatment enhanced ADA",
                    "Treatment unaffected", "Treatment Emergent - Negative",
                    "Treatment Emergent - Positive", "Persistent ADA", "Transient ADA", "Baseline",
                    "Time to onset of ADA", "ADA Duration", "NAB Status of a patient",
                    "Treatment induced ADA, Neutralizing Antibody",
                    "Treatment enhanced ADA, Neutralizing Antibody",
                    "Treatment Emergent - Negative, Neutralizing Antibody",
                    "Treatment Emergent - Positive, Neutralizing Antibody",
                    "Baseline, Neutralizing Antibody",
                    "Treatment unaffected, Neutralizing Antibody"
                  ),
                  avalu = c(
                    "titer", "", "titer", "", "", "", "", "", "", "", "", "", "", "weeks", "weeks",
                    "", "", "", "", "", "", ""
                  ),
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
  checkmate::assert_character(param, len = length(paramcd))
  checkmate::assert_character(avalu, len = length(paramcd))
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  # validate and initialize related variables
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, avalu)

  ADPC <- ADPC %>% filter((ADPC$PCTPTNUM %% (4*7*24)) == 0)
  ADAB <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = unique(ADSL$USUBJID),
    VISIT = unique(ADPC$VISIT),
    PARAM = as.factor(param_init_list$relvar1),
    PARCAT1 = "A: Drug X Antibody",
    PCTPT = unique(ADPC$PCTPT),
    stringsAsFactors = FALSE
  )

  visit_lvl_params <- c(
    "Antibody titer units", "Neutralizing Antibody titer units",
    "ADA interpreted per sample result", "NAB interpreted per sample result"
  )
  aval_random <- stats::rnorm(nrow(unique(ADAB %>% dplyr::select(USUBJID, VISIT))), mean = 1, sd = 0.2)
  aval_random <- cbind(unique(ADAB %>% dplyr::select(USUBJID, VISIT)), AVAL1 = aval_random)

  ADAB <- ADAB %>% dplyr::left_join(aval_random, by = c("USUBJID", "VISIT")) # nolint
  ADAB <- ADAB %>% # nolint
    dplyr::mutate(
      AVAL2 = ifelse(AVAL1 >= 1, AVAL1, NA),
      AVALC = dplyr::case_when(
        !is.na(AVAL2) ~ "POSITIVE",
        is.na(AVAL2) ~ "NEGATIVE"
      ),
      AVAL = dplyr::case_when(
        (PARAM %in% visit_lvl_params[3:4] & !is.na(AVAL2)) ~ 1,
        (PARAM %in% visit_lvl_params[3:4] & is.na(AVAL2)) ~ 0,
        (PARAM %in% visit_lvl_params[1:2] & !is.na(AVAL2)) ~ AVAL2,
        TRUE ~ as.numeric(NA)
      ),
      ISTPT = ifelse(VISIT == "Day 1", "Predose", "")
    ) %>%
    dplyr::select(-c(AVAL1, AVAL2))

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
    dplyr::inner_join(ADPC %>% dplyr::select(
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
    dplyr::select(-PCTPT)

  # mutate time from dose variables from ADPC to convert into Days
  ADAB <- ADAB %>% dplyr::mutate_at(c("ARELTM1", "NRELTM1", "ARELTM2", "NRELTM2"), ~ . / 24) # nolint
  ADAB <- ADAB %>% dplyr::mutate( # nolint
    RELTMU = "day", # nolint
    ADABLFL = "Y",
    ADAPBLFL = ifelse(ACTARM == "A: Drug X" | ACTARM == "C: Combination", "Y",
      NA
    ),
    ABLFL = ifelse(NRELTM1 == 0, "Y", NA)
  ) %>%
    group_by(USUBJID) %>%
    mutate(ATACHAR = paste0(LETTERS[cur_group_id() %% 10], "+")) %>%
    ungroup()

  # create temporary flags to derive subject-level variables
  adab_subj <- ADAB %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(
      pos_bl = any(PARAM == "ADA interpreted per sample result" &
        !is.na(ABLFL) & AVALC == "POSITIVE"),
      pos_bl_nab = any(PARAM == "NAB interpreted per sample result" &
        !is.na(ABLFL) & AVALC == "POSITIVE"),
      any_pos_postbl = any(PARAM == "ADA interpreted per sample result" &
        is.na(ABLFL) & AVALC == "POSITIVE"),
      any_pos_postbl_nab = any(PARAM == "NAB interpreted per sample result" &
        is.na(ABLFL) & AVALC == "POSITIVE"),
      pos_last_postbl = any(PARAM == "ADA interpreted per sample result" &
        NRELTM1 == max(NRELTM1) & AVALC == "POSITIVE"),
      ada_bl = AVAL[PARAM == "Antibody titer units" & !is.na(ABLFL)],
      nab_bl = AVAL[PARAM == "Neutralizing Antibody titer units" & !is.na(ABLFL)]
    )
  pos_tots <- adab_subj %>%
    dplyr::summarise(
      n_pos = sum(PARAM == "ADA interpreted per sample result" & AVALC == "POSITIVE"),
      inc_postbl = sum(PARAM == "ADA interpreted per sample result" &
        is.na(ABLFL) & (AVAL - ada_bl) > 0.60),
      inc_postbl_nab = sum(PARAM == "NAB interpreted per sample result" &
        is.na(ABLFL) & (AVAL - nab_bl) > 0.60),
      onset_ada = if (any(PARAM == "ADA interpreted per sample result" &
        AVALC == "POSITIVE")) {
        min(NRELTM1[PARAM == "ADA interpreted per sample result" & AVALC == "POSITIVE"])
      } else {
        NA
      },
      last_ada = if (any(PARAM == "ADA interpreted per sample result" &
        AVALC == "POSITIVE")) {
        max(NRELTM1[PARAM == "ADA interpreted per sample result" & AVALC == "POSITIVE"])
      } else {
        NA
      }
    )
  adab_subj <- adab_subj %>%
    dplyr::left_join(pos_tots, by = "USUBJID") %>%
    dplyr::select(
      USUBJID, NRELTM1, pos_bl, pos_bl_nab, any_pos_postbl, any_pos_postbl_nab, inc_postbl,
      inc_postbl_nab, pos_last_postbl, n_pos, onset_ada, last_ada
    ) %>%
    unique()

  # add flags to ADAB dataset
  ADAB <- ADAB %>% # nolint
    dplyr::left_join(adab_subj, by = c("USUBJID", "NRELTM1"))

  # derive subject-level variables
  ADAB[!(ADAB$PARAM %in% visit_lvl_params), ] <- ADAB %>% # nolint
    dplyr::filter(!(PARAM %in% visit_lvl_params)) %>%
    dplyr::mutate(
      AVALC = dplyr::case_when(
        (PARAM == "ADA Status of a patient" & any_pos_postbl) ~ "POSITIVE",
        (PARAM == "ADA Status of a patient" & !any_pos_postbl) ~ "NEGATIVE",
        (PARAM == "Treatment induced ADA" & !pos_bl & any_pos_postbl) ~ "Y",
        (PARAM == "Treatment enhanced ADA" & pos_bl & inc_postbl > 0) ~ "Y",
        (PARAM == "Treatment unaffected" & pos_bl & (inc_postbl == 0 | !any_pos_postbl)) ~ "Y",
        (PARAM == "Treatment Emergent - Positive" &
          ((!pos_bl & any_pos_postbl) | (pos_bl & inc_postbl > 0))) ~ "Y",
        (PARAM == "Treatment Emergent - Negative" &
          !((!pos_bl & any_pos_postbl) | (pos_bl & inc_postbl > 0))) ~ "Y",
        (PARAM == "Persistent ADA" & pos_last_postbl) ~ "Y",
        (PARAM == "Transient ADA" &
          (n_pos - pos_bl - pos_last_postbl == 1 | n_pos > 1)) ~ "Y",
        (PARAM == "Baseline" & pos_bl) ~ "POSITIVE",
        (PARAM == "Baseline" & !pos_bl) ~ "NEGATIVE",
        (PARAM == "Time to onset of ADA") ~ as.character(onset_ada / 7),
        (PARAM == "ADA Duration") ~ as.character((last_ada - onset_ada) / 7),
        (PARAM == "NAB Status of a patient" & any_pos_postbl_nab) ~ "POSITIVE",
        (PARAM == "NAB Status of a patient" & !any_pos_postbl_nab) ~ "NEGATIVE",
        (PARAM == "Treatment induced ADA, Neutralizing Antibody" &
          !pos_bl_nab & any_pos_postbl_nab) ~ "Y",
        (PARAM == "Treatment enhanced ADA, Neutralizing Antibody" &
          pos_bl_nab & inc_postbl_nab > 0) ~ "Y",
        (PARAM == "Baseline, Neutralizing Antibody" & pos_bl_nab) ~ "POSITIVE",
        (PARAM == "Baseline, Neutralizing Antibody" & !pos_bl_nab) ~ "NEGATIVE",
        (PARAM == "Treatment unaffected, Neutralizing Antibody" & pos_bl_nab &
          (inc_postbl_nab == 0 | !any_pos_postbl_nab)) ~ "Y",
        (PARAM == "Treatment Emergent - Positive, Neutralizing Antibody" &
          ((!pos_bl_nab & any_pos_postbl_nab) | (pos_bl_nab & inc_postbl_nab > 0))) ~ "Y",
        (PARAM == "Treatment Emergent - Negative, Neutralizing Antibody" &
          !((!pos_bl_nab & any_pos_postbl_nab) | (pos_bl_nab & inc_postbl_nab > 0))) ~ "Y",
        TRUE ~ "N"
      ),
      AVAL = dplyr::case_when(
        (PARAM == "ADA Status of a patient" & any_pos_postbl) ~ 1,
        (PARAM == "Treatment induced ADA" & !pos_bl & any_pos_postbl) ~ 1,
        (PARAM == "Treatment enhanced ADA" & pos_bl & inc_postbl > 0) ~ 1,
        (PARAM == "Treatment unaffected" & pos_bl & (inc_postbl == 0 | !any_pos_postbl)) ~ 1,
        (PARAM == "Treatment Emergent - Positive" &
          ((!pos_bl & any_pos_postbl) | (pos_bl & inc_postbl > 0))) ~ 1,
        (PARAM == "Treatment Emergent - Negative" &
          !((!pos_bl & any_pos_postbl) | (pos_bl & inc_postbl > 0))) ~ 1,
        (PARAM == "Persistent ADA" & pos_last_postbl) ~ 1,
        (PARAM == "Transient ADA" &
          (n_pos - ifelse(pos_bl, 1, 0) - ifelse(pos_last_postbl, 1, 0) == 1 | n_pos > 1)) ~ 1,
        (PARAM == "Baseline" & pos_bl) ~ 1,
        (PARAM == "Time to onset of ADA") ~ onset_ada / 7,
        (PARAM == "ADA Duration") ~ (last_ada - onset_ada) / 7,
        (PARAM == "NAB Status of a patient" & any_pos_postbl_nab) ~ 1,
        (PARAM == "Treatment induced ADA, Neutralizing Antibody" &
          !pos_bl_nab & any_pos_postbl_nab) ~ 1,
        (PARAM == "Treatment enhanced ADA, Neutralizing Antibody" &
          pos_bl_nab & inc_postbl_nab > 0) ~ 1,
        (PARAM == "Baseline, Neutralizing Antibody" & pos_bl_nab) ~ 1,
        (PARAM == "Treatment unaffected, Neutralizing Antibody" & pos_bl_nab &
          (inc_postbl_nab == 0 | !any_pos_postbl_nab)) ~ 1,
        (PARAM == "Treatment Emergent - Positive, Neutralizing Antibody" &
          ((!pos_bl_nab & any_pos_postbl_nab) | (pos_bl_nab & inc_postbl_nab > 0))) ~ 1,
        (PARAM == "Treatment Emergent - Negative, Neutralizing Antibody" &
          !((!pos_bl_nab & any_pos_postbl_nab) | (pos_bl_nab & inc_postbl_nab > 0))) ~ 1,
        TRUE ~ 0
      ),
      PARCAT1 = dplyr::case_when(
        PARAM %in% c(
          "Neutralizing Antibody titer units", "NAB interpreted per sample result",
          "NAB Status of a patient", "Treatment induced ADA, Neutralizing Antibody",
          "Treatment enhanced ADA, Neutralizing Antibody",
          "Treatment Emergent - Negative, Neutralizing Antibody",
          "Treatment Emergent - Positive, Neutralizing Antibody",
          "Treatment unaffected, Neutralizing Antibody"
        ) ~ "A: Drug X Neutralizing Antibody",
        TRUE ~ PARCAT1
      )
    )

  # remove intermediate flag variables from ADAB
  ADAB <- ADAB %>% # nolint
    dplyr::select(-c(
      pos_bl, pos_bl_nab, any_pos_postbl, any_pos_postbl_nab, pos_last_postbl,
      inc_postbl, inc_postbl_nab, n_pos, onset_ada, last_ada
    ))

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADAB <- mutate_na(ds = ADAB, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADAB <- apply_metadata(ADAB, "metadata/ADAB.yml") # nolint
}
