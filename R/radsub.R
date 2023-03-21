#' Generate Anthropometric Measurements for Males and Females.
#'
#' Anthropometric measurements are randomly generated using normal approximation.
#' The default mean and standard deviation values used are based on US National Health
#' Statistics for adults aged 20 years or over. The measurements are generated in same units
#' as provided to the function.
#'
#' @details One record per subject.
#'
#' @inheritParams argument_convention
#' @param df (`data.frame`)\cr Analysis dataset.
#' @param id_var (`character`)\cr Patient identifier variable name.
#' @param sex_var (`character`)\cr Name of variable representing sex of patient.
#' @param sex_var_level_male (`character`)\cr Level of `sex_var` representing males.
#' @param male_weight_in_kg (named `list`)\cr List of means and SDs of male weights in kilograms.
#' @param female_weight_in_kg (named `list`)\cr List of means and SDs of female weights in kilograms.
#' @param male_height_in_m (named `list`)\cr List of means and SDs of male heights in metres.
#' @param female_height_in_m (named `list`)\cr list of means and SDs of female heights in metres.
#'
#' @return a dataframe with anthropometric measurements for each subject in analysis dataset.
#' @keywords internal
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 5, seed = 1)
#'
#' df_with_measurements <- random.cdisc.data:::h_anthropometrics_by_sex(df = ADSL)
#' df_with_measurements
h_anthropometrics_by_sex <- function(df,
                                     seed = 1,
                                     id_var = "USUBJID",
                                     sex_var = "SEX",
                                     sex_var_level_male = "M",
                                     male_weight_in_kg = list(mean = 90.6, sd = 44.9),
                                     female_weight_in_kg = list(mean = 77.5, sd = 46.2),
                                     male_height_in_m = list(mean = 1.75, sd = 0.14),
                                     female_height_in_m = list(mean = 1.61, sd = 0.24)) {
  checkmate::assert_data_frame(df)
  checkmate::assert_string(id_var)
  checkmate::assert_string(sex_var)
  checkmate::assert_string(sex_var_level_male)
  checkmate::assert_list(male_weight_in_kg, types = "numeric")
  checkmate::assert_subset(names(male_weight_in_kg), choices = c("mean", "sd"))
  checkmate::assert_list(female_weight_in_kg, types = "numeric")
  checkmate::assert_subset(names(female_weight_in_kg), choices = c("mean", "sd"))
  checkmate::assert_list(male_height_in_m, types = "numeric")
  checkmate::assert_subset(names(male_height_in_m), choices = c("mean", "sd"))
  checkmate::assert_list(female_height_in_m, types = "numeric")
  checkmate::assert_subset(names(female_height_in_m), choices = c("mean", "sd"))


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
      BMI = WEIGHT / ((HEIGHT)^2)
    )

  return(df_with_measurements)
}

#' Subcategory Analysis Dataset (ADSUB)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating a random Subcategory Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject.
#'
#' Keys: `STUDYID`, `USUBJID`, `PARAMCD`, `AVISITN`, `ADTM`, `SRCSEQ`
#'
#' @inheritParams argument_convention
#' @template param_cached
#' @templateVar data adsub
#'
#' @return `data.frame`
#' @export
#'
#' @author tomlinsj, npaszty, Xuefeng Hou, dipietrc
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' ADSUB <- radsub(ADSL, seed = 2)
#' ADSUB
radsub <- function(ADSL,
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
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadsub"))
  }

  checkmate::assert_data_frame(ADSL)
  checkmate::assert_character(param, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramcd, min.len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  # Validate and initialize related variables.
  param_init_list <- relvar_init(param, paramcd)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADSUB <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = "BASELINE",
    stringsAsFactors = FALSE
  )

  # Assign related variable values: PARAM and PARAMCD are related.
  ADSUB <- ADSUB %>% rel_var(
    var_name = "PARAMCD",
    related_var = "PARAM",
    var_values = param_init_list$relvar2
  )

  ADSUB <- ADSUB[order(ADSUB$STUDYID, ADSUB$USUBJID, ADSUB$PARAMCD), ]

  ADSUB <- var_relabel(
    ADSUB,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # Merge ADSL to be able to add EG date and study day variables.
  # Sample ADTM to be a few days before TRTSDTM.
  ADSUB <- dplyr::inner_join(
    ADSUB,
    ADSL,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(ADTM = rep(
      lubridate::date(TRTSDTM)[1] - lubridate::days(sample(1:10, size = 1)),
      each = n()
    )) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(STUDYID, USUBJID, ADTM)

  # Generate a dataset with height, weight and BMI measurements for each subject.
  if (!is.null(seed)) {
    df_with_measurements <- h_anthropometrics_by_sex(ADSUB, seed = seed)
  } else {
    df_with_measurements <- h_anthropometrics_by_sex(ADSUB)
  }

  # Add this to ADSUB and create other measurements.
  ADSUB <- ADSUB %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(
      AVAL = dplyr::case_when(
        PARAMCD ==
          "BWGHTSI" ~ df_with_measurements$WEIGHT[df_with_measurements$USUBJID == USUBJID],
        PARAMCD ==
          "BHGHTSI" ~ df_with_measurements$HEIGHT[df_with_measurements$USUBJID == USUBJID],
        PARAMCD ==
          "BBMISI" ~ df_with_measurements$BMI[df_with_measurements$USUBJID == USUBJID],
        PARAMCD == "BECOG" ~ sample(c(0, 1, 2, 3, 4, 5), 1),
        PARAMCD == "BBMRKR1" ~ sample(c(1, 2), prob = c(0.5, 0.5), 1)
      )
    ) %>%
    dplyr::arrange(PARAMCD) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(AVAL = dplyr::case_when(
      PARAMCD != "BBMRKR1" | PARAMCD != "BECOG" ~ round(AVAL, 1),
      TRUE ~ round(AVAL)
    ))

  ADSUB <- ADSUB %>%
    dplyr::mutate(
      AVALC = dplyr::case_when(
        PARAMCD == "BBMRKR1" ~ dplyr::case_when(
          AVAL == "1" ~ "WILD TYPE",
          AVAL == "2" ~ "MUTANT",
          TRUE ~ ""
        ),
        TRUE ~ as.character(AVAL)
      ),
      AVALU = dplyr::case_when(
        PARAMCD == "BWGHTSI" ~ "kg",
        PARAMCD == "BHGHTSI" ~ "m",
        PARAMCD == "BBMISI" ~ "kg/m2",
        TRUE ~ ""
      ),
      AVALCAT1 = dplyr::case_when(
        PARAMCD == "BBMISI" ~ dplyr::case_when(
          AVAL < 18.5 ~ "<18.5",
          AVAL >= 18.5 & AVAL < 25 ~ "18.5 - 24.9",
          AVAL >= 25 & AVAL < 30 ~ "25 - 29.9",
          TRUE ~ ">30"
        ),
        PARAMCD == "BECOG" ~ dplyr::case_when(
          AVAL <= 1 ~ "0-1",
          AVAL > 1 & AVAL <= 3 ~ "2-3",
          TRUE ~ "4-5"
        ),
        TRUE ~ ""
      ),
      AVISITN = "0",
      SRCSEQ = "1"
    ) %>%
    dplyr::arrange(
      USUBJID,
      factor(PARAMCD, levels = c("BWGHTSI", "BHGHTSI", "BBMISI", "BECOG", "BBMRKR1"))
    )

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADSUB <- mutate_na(ds = ADSUB, na_vars = na_vars, na_percentage = na_percentage)
  }

  # Apply metadata.
  ADSUB <- apply_metadata(ADSUB, "metadata/ADSUB.yml")

  return(ADSUB)
}
