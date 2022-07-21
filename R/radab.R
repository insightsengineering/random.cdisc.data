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
#' ADPC <- radpc(ADSL, seed = 2)
#' ADAB <- radab(ADSL, ADPC, seed = 2)
radab <- function(ADSL, # nolint
                  ADPC, # nolint
                  constants = c(D = 100, ka = 0.8, ke = 1),
                  paramcd = c(
                    "R1800000", "RESULT", "INDUCD",
                    "PERSADA", "TRANADA", "TIMADA", "ADADUR"
                  ),
                  param = c(
                    "Antibody titer units", "ADA interpreted per sample result",
                    "Treatment induced ADA (Y/N)", "Persistent ADA (Y/N)", "Transient ADA (Y/N)",
                    "Time to onset of ADA (Weeks)", "ADA Duration (Weeks)"
                  ),
                  avalu = c("titer", "", "", "", "", "week", "week"),
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

  if (!is.null(seed)) {
    set.seed(seed)
  }

  # validate and initialize related variables
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, avalu)

  ADAB <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = unique(ADSL$USUBJID),
    VISIT = unique(ADPC$VISIT),
    PARAM = as.factor(param_init_list$relvar1),
    PARCAT1 = "A: Drug X Antibody",
    PCTPT = unique(ADPC$PCTPT),
    stringsAsFactors = FALSE
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
        (PARAM == "ADA interpreted per sample result" & !is.na(AVAL2)) ~ 1,
        (PARAM == "ADA interpreted per sample result" & is.na(AVAL2)) ~ 0,
        (PARAM == "Antibody titer units" & !is.na(AVAL2)) ~ AVAL2,
        TRUE ~ as.numeric(NA)
      ),
      ISTPT = "Predose"
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

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADAB <- mutate_na(ds = ADAB, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  # mutate time from dose variables from ADPC to convert into Days
  ADAB <- ADAB %>% dplyr::mutate_at(c("ARELTM1", "NRELTM1", "ARELTM2", "NRELTM2"), ~ . / 24) # nolint
  ADAB <- ADAB %>% dplyr::mutate( # nolint
    RELTMU = "day", # nolint
    ADABLFL = "Y",
    ADAPBLFL = ifelse(ACTARM == "A: Drug X" | ACTARM == "C: Combination", "Y",
      NA
    ),
    ABLFL = ifelse(NRELTM1 == 0, "Y", NA)
  )

  # create flags to derive subject-level variables
  adab_subj <- ADAB %>%
    dplyr::filter(PARAM == "ADA interpreted per sample result") %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(
      pos_bl = any(!is.na(ABLFL) & AVALC == "POSITIVE"),
      any_pos_postbl = any(is.na(ABLFL) & AVALC == "POSITIVE"),
      pos_last_postbl = any(NRELTM1 == max(NRELTM1) & AVALC == "POSITIVE")
    )
  pos_tots <- adab_subj %>%
    dplyr::summarise(
      n_pos = sum(AVALC == "POSITIVE"),
      onset_ada = if (any(AVALC == "POSITIVE")) min(NRELTM1[AVALC == "POSITIVE"]) else NA,
      last_ada = if (any(AVALC == "POSITIVE")) max(NRELTM1[AVALC == "POSITIVE"]) else NA
    )
  adab_subj <- adab_subj %>%
    dplyr::left_join(pos_tots, by = "USUBJID") %>%
    dplyr::select(
      USUBJID, NRELTM1, pos_bl, any_pos_postbl,
      pos_last_postbl, n_pos, onset_ada, last_ada
    )

  # add flags to ADAB dataset
  ADAB <- ADAB %>% # nolint
    dplyr::left_join(adab_subj, by = c("USUBJID", "NRELTM1"))

  # derive subject-level variables
  ADAB[!(ADAB$PARAM %in% c("ADA interpreted per sample result", "Antibody titer units")), ] <- ADAB %>% # nolint
    dplyr::filter(!(PARAM %in% c("ADA interpreted per sample result", "Antibody titer units"))) %>%
    dplyr::mutate(
      AVALC = dplyr::case_when(
        (PARAM == "Treatment induced ADA (Y/N)" & !pos_bl & any_pos_postbl) ~ "Y",
        (PARAM == "Persistent ADA (Y/N)" & pos_last_postbl) ~ "Y",
        (PARAM == "Transient ADA (Y/N)" &
          (n_pos - ifelse(pos_bl, 1, 0) - ifelse(pos_last_postbl, 1, 0) == 1 | n_pos > 1)) ~ "Y",
        (PARAM == "Time to onset of ADA (Weeks)") ~ as.character(onset_ada / 7),
        (PARAM == "ADA Duration (Weeks)") ~ as.character((last_ada - onset_ada) / 7),
        TRUE ~ "N"
      ),
      AVAL = dplyr::case_when(
        (PARAM == "Treatment induced ADA (Y/N)" & !pos_bl & any_pos_postbl) ~ 1,
        (PARAM == "Persistent ADA (Y/N)" & pos_last_postbl) ~ 1,
        (PARAM == "Transient ADA (Y/N)" &
          (n_pos - ifelse(pos_bl, 1, 0) - ifelse(pos_last_postbl, 1, 0) == 1 | n_pos > 1)) ~ 1,
        (PARAM == "Time to onset of ADA (Weeks)") ~ onset_ada / 7,
        (PARAM == "ADA Duration (Weeks)") ~ (last_ada - onset_ada) / 7,
        TRUE ~ 0
      )
    )

  # remove intermediate flag variables from ADAB
  ADAB <- ADAB %>% # nolint
    dplyr::select(-c(pos_bl, any_pos_postbl, pos_last_postbl, n_pos, onset_ada, last_ada))

  ADAB <- apply_metadata(ADAB, "metadata/ADAB.yml") # nolint
}
