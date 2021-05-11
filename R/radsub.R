#' Generate anthropometric measurements for males and females.
#'
#' Anthropometric measurements are randomly generated using normal approximation.
#' The default mean and standard deviation values used are based on US National Health
#' Statistics for adults aged 20 years or over. The measurements are generated in same units
#' as provided to the function.
#'
#' @details One record per subject.
#'
#' @param df (data frame)\cr analysis dataset.
#' @param seed Seed for random number generation.
#' @param id_var (string)\cr patient identifier variable name.
#' @param sex_var (string)\cr name of variable representing sex of patient.
#' @param sex_var_level_male (string)\cr level of `sex_var` representing males.
#' @param male_weight_in_kg (named list)\cr list of mean and sd of male weight in kilograms.
#' @param female_weight_in_kg (named list)\cr list of mean and sd of female weight in kilograms.
#' @param male_height_in_m (named list)\cr list of mean and sd of male height in metres.
#' @param female_height_in_m (named list)\cr list of mean and sd of female height in metres.
#'
#' @return a dataframe with anthropometric measurements for each subject in analysis dataset.
#'
#' @examples
#' library(random.cdisc.data)
#'
#' ADSL <- radsl(N = 5, seed = 1)
#' df_with_measurements <- random.cdisc.data:::h_anthropometrics_by_sex(df = ADSL)
#' df_with_measurements
#'
h_anthropometrics_by_sex <- function(df,
                                     seed = 1,
                                     id_var = "USUBJID",
                                     sex_var = "SEX",
                                     sex_var_level_male = "M",
                                     male_weight_in_kg = list(mean = 90.6, sd = 44.9),
                                     female_weight_in_kg = list(mean = 77.5, sd = 46.2),
                                     male_height_in_m = list(mean = 1.75, sd = 0.14),
                                     female_height_in_m = list(mean = 1.61, sd = 0.24)) { # nolint
  stopifnot(is.data.frame(df))
  stopifnot(is_character_single(id_var))
  stopifnot(is_character_single(sex_var))
  stopifnot(is_character_single(sex_var_level_male))
  stopifnot(is_numeric_list(male_weight_in_kg))
  stopifnot(names(male_weight_in_kg) %in% c("mean", "sd"))
  stopifnot(is_numeric_list(female_weight_in_kg))
  stopifnot(names(female_weight_in_kg) %in% c("mean", "sd"))
  stopifnot(is_numeric_list(male_height_in_m))
  stopifnot(names(male_height_in_m) %in% c("mean", "sd"))
  stopifnot(is_numeric_list(female_height_in_m))
  stopifnot(names(female_height_in_m) %in% c("mean", "sd"))

  n <- length(unique(df[[id_var]]))
  set.seed(seed)

  df_by_sex <- unique(subset(df, select = c(id_var, sex_var)))

  df_with_measurements <- df_by_sex %>%
    dplyr::mutate(
      WEIGHT = ifelse(
        .data[[sex_var]] == sex_var_level_male,
        stats::rnorm(n = n, mean = male_weight_in_kg$mean, sd = male_weight_in_kg$sd),
        stats::rnorm(n = n, mean = female_weight_in_kg$mean, sd = female_weight_in_kg$sd)
      )
    ) %>%
    dplyr::mutate(
      HEIGHT = ifelse(
        .data[[sex_var]] == sex_var_level_male,
        stats::rnorm(n = n, mean = male_height_in_m$mean, sd = male_height_in_m$sd),
        stats::rnorm(n = n, mean = female_height_in_m$mean, sd = female_height_in_m$sd)
      )
    ) %>%
    dplyr::mutate(
      BMI = .data$WEIGHT / ((.data$HEIGHT)^2)
    )

  return(df_with_measurements)
}


#' Subcategory Analysis Dataset (ADSUB)
#'
#' Function for generating random dataset from Subcategory Analysis Dataset for a given
#' Subject-Level Analysis Dataset
#'
#' @details One record per subject
#'
#' Keys: STUDYID, USUBJID, PARAMCD, AVISITN, ADTM, SRCSEQ
#'
#' @template ADSL_params
#' @param param param character vector with parameter value strings.
#' @param paramcd paramcd character vector with parameter code values.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data adsub
#' @template param_cached
#' @template return_data.frame
#'
#' @export
#'
#' @author tomlinsj, npaszty, Xuefeng Hou, dipietrc
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' radsub(ADSL, seed = 2)
radsub <- function(ADSL, # nolint
                   param = c(
                     "Baseline Weight",
                     "Baseline Height",
                     "Baseline BMI",
                     "Baseline ECOG",
                     "Baseline Biomarker Mutation"
                   ),
                   paramcd = c("BWGHTSI", "BHGHTSI", "BBMISI", "BECOG", "BBMRKR1"),
                   seed = NULL,
                   na_percentage = 0,
                   na_vars = list(),
                   cached = FALSE) {
  stopifnot(is_logical_single(cached))
  if (cached) {
    return(get_cached_data("cadsub"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is_character_vector(param))
  stopifnot(is_character_vector(paramcd))
  stopifnot(is.null(seed) || is_numeric_single(seed))
  stopifnot((is_numeric_single(na_percentage) && na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  # Validate and initialize related variables.
  param_init_list <- relvar_init(param, paramcd)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADSUB <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = "BASELINE",
    stringsAsFactors = FALSE
  )

  # Assign related variable values: PARAM and PARAMCD are related.
  ADSUB <- ADSUB %>% # nolint
    dplyr::mutate(PARAMCD = as.factor(as.character(rel_var( # nolint
      df = ADSUB,
      var_name = "PARAMCD",
      var_values = param_init_list$relvar2,
      related_var = "PARAM"
    ))))

  ADSUB <- ADSUB[order(ADSUB$STUDYID, ADSUB$USUBJID, ADSUB$PARAMCD), ] # nolint

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADSUB <- mutate_na(ds = ADSUB, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADSUB <- var_relabel( # nolint
    ADSUB,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # Merge ADSL to be able to add EG date and study day variables.
  # Sample ADTM to be a few days before TRTSDTM.
  ADSUB <- dplyr::inner_join( # nolint
    ADSL, # nolint
    ADSUB,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(ADTM = as.POSIXct(
      (as.Date(.data$TRTSDTM) - sample(1:10, size = 1)),
      origin = "1970-01-01")) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$STUDYID, .data$USUBJID, .data$ADTM)

  # Generate a dataset with height, weight and BMI measurements for each subject.
  if (!is.null(seed)) {
    df_with_measurements <- h_anthropometrics_by_sex(ADSUB, seed = seed)  # nolint
  } else {
    df_with_measurements <- h_anthropometrics_by_sex(ADSUB) # nolint
  }

  # Add this to ADSUB and create other measurements.
  ADSUB <- ADSUB %>% # nolint
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(
      AVAL = dplyr::case_when(
        .data$PARAMCD ==
          "BWGHTSI" ~ df_with_measurements$WEIGHT[df_with_measurements$USUBJID == .data$USUBJID],
        .data$PARAMCD ==
          "BHGHTSI" ~ df_with_measurements$HEIGHT[df_with_measurements$USUBJID == .data$USUBJID],
        .data$PARAMCD ==
          "BBMISI" ~ df_with_measurements$BMI[df_with_measurements$USUBJID == .data$USUBJID],
        .data$PARAMCD == "BECOG" ~ sample(c(0, 1, 2, 3, 4, 5), 1),
        .data$PARAMCD == "BBMRKR1" ~ sample(c(1, 2), prob = c(0.5, 0.5), 1)
      )) %>%
    dplyr::arrange(.data$PARAMCD) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(AVAL = dplyr::case_when(
      .data$PARAMCD != "BBMRKR1" | .data$PARAMCD != "BECOG" ~ round(.data$AVAL, 1),
      TRUE ~ round(.data$AVAL)
    ))

  ADSUB <- ADSUB %>% #nolint
    dplyr::mutate(
      AVALC = dplyr::case_when(
        .data$PARAMCD == "BBMRKR1" ~ dplyr::case_when(
          .data$AVAL == "1" ~ "WILD TYPE",
          .data$AVAL == "2" ~ "MUTANT",
          TRUE ~ ""),
        TRUE ~ as.character(.data$AVAL)
      ),
      AVALU = dplyr::case_when(
        .data$PARAMCD == "BWGHTSI" ~ "kg",
        .data$PARAMCD == "BHGHTSI" ~ "m",
        .data$PARAMCD == "BBMISI" ~ "kg/m2",
        TRUE ~ ""
      ),
      AVALCAT1 = dplyr::case_when(
        .data$PARAMCD == "BBMISI" ~ dplyr::case_when(
          .data$AVAL < 18.5 ~ "<18.5",
          .data$AVAL >= 18.5 & .data$AVAL < 25 ~ "18.5 - 24.9",
          .data$AVAL >= 25 & .data$AVAL < 30 ~ "25 - 29.9",
          TRUE ~ ">30"
        ),
        .data$PARAMCD == "BECOG" ~ dplyr::case_when(
          .data$AVAL <= 1 ~ "0-1",
          .data$AVAL > 1 & .data$AVAL <= 3 ~ "2-3",
          TRUE ~ "4-5"
        ),
        TRUE ~ ""
      ),
      AVISITN = "0",
      SRCSEQ = "1"
      ) %>%
    dplyr::arrange(
      .data$USUBJID,
      factor(.data$PARAMCD, levels = c("BWGHTSI", "BHGHTSI", "BBMISI", "BECOG", "BBMRKR1"))
    )

  # Apply metadata.
  ADSUB <- apply_metadata(ADSUB, "metadata/ADSUB.yml") # nolint

  return(ADSUB)
}
