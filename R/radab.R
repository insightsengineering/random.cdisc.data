#' Anti-Drug Antibody Analysis Dataset (ADAB)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating a random Anti-Drug Antibody Analysis Dataset for a given
#' Subject-Level Analysis Dataset and Pharmacokinetics Analysis Dataset.
#'
#' @inheritParams argument_convention
#' @inheritParams radpc
#' @param adpc (`data.frame`)\cr Pharmacokinetics Analysis Dataset.
#' @template param_cached
#' @templateVar data adab
#'
#' @return `data.frame`
#' @export
#'
#' @details One record per study per subject per parameter per time point: "R1800000", "RESULT1", "R1800001", "RESULT2".
#'
#' @examples
#' library(random.cdisc.data)
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#' adpc <- radpc(adsl, seed = 2, duration = 9 * 7)
#'
#' adab <- radab(adsl, adpc, seed = 2)
#' adab
radab <- function(adsl,
                  adpc,
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
                  seed = 1,
                  na_percentage = 0,
                  na_vars = list(
                    AVAL = c(NA, 0.1)
                  ),
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadpc"))
  }

  checkmate::assert_data_frame(adpc)
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

  adpc <- adpc %>% dplyr::filter(ASMED == "PLASMA")
  adab0 <- expand.grid(
    STUDYID = unique(adsl$STUDYID),
    USUBJID = unique(adsl$USUBJID),
    VISIT = unique(adpc$VISIT),
    PARAM = as.factor(param_init_list$relvar1[c(1:4)]),
    PARCAT1 = "A: Drug X Antibody",
    stringsAsFactors = FALSE
  )
  # Set random values for observations
  visit_lvl_params <- c(
    "Antibody titer units", "Neutralizing Antibody titer units",
    "ADA interpreted per sample result", "NAB interpreted per sample result"
  )
  aval_random <- stats::rnorm(nrow(unique(adab0 %>% dplyr::select(USUBJID, VISIT))), mean = 1, sd = 0.2)
  aval_random <- cbind(unique(adab0 %>% dplyr::select(USUBJID, VISIT)), AVAL1 = aval_random)

  adab_visit <- adab0 %>% dplyr::left_join(aval_random, by = c("USUBJID", "VISIT"))
  adab_visit <- adab_visit %>%
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
      )
    ) %>%
    dplyr::select(-c(AVAL1, AVAL2))

  # retrieve other variables from adpc
  adab_visit <- adab_visit %>%
    dplyr::inner_join(
      adpc %>%
        dplyr::filter(PCTPT %in% c("Predose", "24H")) %>%
        dplyr::select(
          STUDYID,
          USUBJID,
          VISIT,
          PCTPT,
          ARM,
          ACTARM,
          VISITDY,
          AFRLT,
          NFRLT,
          ARRLT,
          NRRLT,
          RELTMU
        ) %>%
        unique(),
      by = c("STUDYID", "USUBJID", "VISIT")
    ) %>%
    rename(ISTPT = PCTPT)

  # mutate time from dose variables from adpc to convert into Days
  adab_visit <- adab_visit %>% dplyr::mutate_at(c("AFRLT", "NFRLT", "ARRLT", "NRRLT"), ~ . / 24)



  # Set random values for subject level paramaters (Y/N)

  adab1 <- expand.grid(
    STUDYID = unique(adsl$STUDYID),
    USUBJID = unique(adpc$USUBJID),
    VISIT = NA,
    PARAM = as.factor(param_init_list$relvar1[c(5:13, 16:22)]),
    PARCAT1 = "A: Drug X Antibody",
    stringsAsFactors = FALSE
  )

  sub_lvl_params <- c(
    "ADA Status of a patient", "Treatment induced ADA", "Treatment enhanced ADA",
    "Treatment unaffected", "Treatment Emergent - Negative",
    "Treatment Emergent - Positive", "Persistent ADA", "Transient ADA", "Baseline",
    # "Time to onset of ADA", "ADA Duration",
    "NAB Status of a patient",
    "Treatment induced ADA, Neutralizing Antibody",
    "Treatment enhanced ADA, Neutralizing Antibody",
    "Treatment Emergent - Negative, Neutralizing Antibody",
    "Treatment Emergent - Positive, Neutralizing Antibody",
    "Baseline, Neutralizing Antibody",
    "Treatment unaffected, Neutralizing Antibody"
  )

  aval_random_sub <- stats::rbinom(nrow(unique(adab1 %>% dplyr::select(USUBJID))), 1, 0.5)
  aval_random_sub <- cbind(unique(adab1 %>% dplyr::select(USUBJID)), AVAL1 = aval_random_sub)

  adab_sub <- adab1 %>% dplyr::left_join(aval_random_sub, by = c("USUBJID"))
  adab_sub <- adab_sub %>%
    dplyr::mutate(
      AVAL = AVAL1,
      AVALC = dplyr::case_when(
        PARAM %in% c("ADA Status of a patient", "NAB Status of a patient") & AVAL1 == 1 ~ "POSITIVE",
        PARAM %in% c("ADA Status of a patient", "NAB Status of a patient") & AVAL1 == 0 ~ "NEGATIVE",
        !(PARAM %in% c("ADA Status of a patient", "NAB Status of a patient")) & AVAL1 == 1 ~ "Y",
        !(PARAM %in% c("ADA Status of a patient", "NAB Status of a patient")) & AVAL1 == 0 ~ "N"
      )
    ) %>%
    dplyr::select(-c(AVAL1))

  # Set random values for subject level paramaters (numeric)

  adab2 <- expand.grid(
    STUDYID = unique(adsl$STUDYID),
    USUBJID = unique(adpc$USUBJID),
    VISIT = NA,
    PARAM = as.factor(param_init_list$relvar1[c(14, 15)]),
    PARCAT1 = "A: Drug X Antibody",
    stringsAsFactors = FALSE
  )

  sub_lvl_params_num <- c("Time to onset of ADA", "ADA Duration")

  aval_random_sub_num <- stats::rnorm(nrow(unique(adab2 %>% dplyr::select(USUBJID))), mean = 1, sd = 1)
  aval_random_sub_num <- cbind(unique(adab2 %>% dplyr::select(USUBJID)), AVAL1 = aval_random_sub_num)

  adab_sub_num <- adab2 %>% dplyr::left_join(aval_random_sub_num, by = c("USUBJID"))
  adab_sub_num <- adab_sub_num %>%
    dplyr::mutate(
      AVAL = ifelse(AVAL1 >= 1, round(AVAL1, 2), NA),
      AVALC = as.character(AVAL)
    ) %>%
    dplyr::select(-c(AVAL1))


  adab <- bind_rows(adab_visit, adab_sub, adab_sub_num)


  # assign related variable values: PARAMxPARAMCD are related
  adab <- adab %>% rel_var(
    var_name = "PARAMCD",
    related_var = "PARAM",
    var_values = param_init_list$relvar2
  )

  # assign related variable values: PARAMxAVALU are related
  adab <- adab %>% rel_var(
    var_name = "AVALU",
    related_var = "PARAM",
    var_values = unit_init_list$relvar2
  )


  adab <- adab %>%
    dplyr::mutate(
      RELTMU = "day",
      ABLFL = ifelse(!is.na(NFRLT) & NFRLT == 0, "Y", NA) # Baseline Record Flag
      ,
      ADABLPFL = ifelse(PARAMCD == "RESULT1" & !is.na(NFRLT) & NFRLT == 0, "Y", NA)
      # Baseline ADA Eval. Param-Level Flag, only populate for ADA, not for NAB
      ,
      ADPBLPFL = ifelse(PARAMCD == "RESULT1" & !is.na(NFRLT) & NFRLT > 0 & !is.na(AVAL), "Y", NA)
      # Post-Baseline ADA Eval. Param-Level Flag, only populate for ADA, not for NAB
    ) %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::ungroup()

  # create temporary flags to derive subject-level variables
  adab_subj <- adab %>%
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
        NFRLT == max(NFRLT) & AVALC == "POSITIVE"),
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
        min(NFRLT[PARAM == "ADA interpreted per sample result" & AVALC == "POSITIVE"])
      } else {
        NA
      },
      last_ada = if (any(PARAM == "ADA interpreted per sample result" &
        AVALC == "POSITIVE")) {
        max(NFRLT[PARAM == "ADA interpreted per sample result" & AVALC == "POSITIVE"])
      } else {
        NA
      }
    )
  adab_subj <- adab_subj %>%
    dplyr::left_join(pos_tots, by = "USUBJID") %>%
    dplyr::select(
      USUBJID,
      NFRLT,
      pos_bl,
      pos_bl_nab,
      any_pos_postbl,
      any_pos_postbl_nab,
      inc_postbl,
      inc_postbl_nab,
      pos_last_postbl,
      n_pos,
      onset_ada,
      last_ada
    ) %>%
    unique()

  # add flags to ADAB dataset
  adab <- adab %>%
    dplyr::left_join(adab_subj, by = c("USUBJID", "NFRLT"))

  # derive subject-level variables
  adab[!(adab$PARAM %in% visit_lvl_params), ] <- adab %>%
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

  # remove intermediate flag variables from adab
  adab <- adab %>%
    dplyr::select(-c(
      pos_bl,
      pos_bl_nab,
      any_pos_postbl,
      any_pos_postbl_nab,
      pos_last_postbl,
      inc_postbl,
      inc_postbl_nab,
      n_pos,
      onset_ada,
      last_ada
    ))

  if (length(na_vars) > 0 && na_percentage > 0) {
    adab <- mutate_na(ds = adab, na_vars = na_vars, na_percentage = na_percentage)
  }

  adab <- apply_metadata(adab, "metadata/ADAB.yml")
}
