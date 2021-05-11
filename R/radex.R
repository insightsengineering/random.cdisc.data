#' Exposure Analysis Dataset (ADEX)
#'
#' Function for generating random Exposure Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: STUDYID USUBJID EXSEQ PARAMCD PARCAT1 ASTDTM AVISITN
#'
#' @template ADSL_params
#' @template BDS_findings_params
#' @param paramu As character vector of parameter unit value
#' @param parcat1 Individual/Overall dose amount
#' @param parcat2 Type of drug received Drug A / Drug B
#' @param max_n_exs As numeric. maximum number of exposures
#' @param lookup control lookup process
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data adex
#' @template param_cached
#' @template return_data.frame
#'
#'
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' library(utils.nest)
#' library(dplyr)
#'
#' ADSL <- radsl(N = 10, study_duration = 2, seed = 1)
#' ADEX <- radex(ADSL, seed = 2)
#'
radex <- function(ADSL, # nolint
                  param = c(
                    "Dose administered during constant dosing interval",
                    "Number of doses administered during constant dosing interval",
                    "Total dose administered",
                    "Total number of doses administered"),
                  paramcd = c("DOSE", "NDOSE", "TDOSE", "TNDOSE"),
                  paramu = c("mg", " ", "mg", " "),
                  parcat1 = c("INDIVIDUAL", "OVERALL"),
                  parcat2 = c("Drug A", "Drug B"),
                  visit_format = "WEEK",
                  n_assessments = 5L,
                  n_days = 5L,
                  max_n_exs = 6L,
                  lookup = NULL,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars =  list(AVAL = c(NA, 0.1), AVALU = c(NA), 0.1),
                  cached = FALSE) {

  stopifnot(is_logical_single(cached))
  if (cached) {
    return(get_cached_data("cadex"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is_character_vector(param))
  stopifnot(is_character_vector(paramcd))
  stopifnot(is_character_vector(parcat1))
  stopifnot(is_character_vector(parcat2))
  stopifnot(is_character_single(visit_format))
  stopifnot(is_integer_single(n_assessments))
  stopifnot(is_integer_single(n_days))
  stopifnot(is_integer_single(max_n_exs))
  stopifnot(is.null(seed) || is_numeric_single(seed))
  stopifnot((is_numeric_single(na_percentage) && na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  #validate and initialize related variables
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  adex <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = c(rep(
      param_init_list$relvar1[1],
      length(levels(visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days)))),
      rep(
        param_init_list$relvar1[2],
        length(levels(visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days)))),
      param_init_list$relvar1[3:4]),
    stringsAsFactors = FALSE
  )

  # assign related variable values: PARAMxPARAMCD are related
  adex$PARAMCD <- as.factor(rel_var( # nolint
    df = adex,
    var_name = "PARAMCD",
    var_values = param_init_list$relvar2,
    related_var = "PARAM"
  ))

  #assign related variable values: AVALUxPARAM are related
  adex$AVALU <- as.factor(rel_var( # nolint
    df = adex,
    var_name = "AVALU",
    var_values = unit_init_list$relvar2,
    related_var = "PARAM"
  ))

  adex <- adex %>%
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(PARCAT_ind = sample(c(1, 2), size = 1)) %>%
    dplyr::mutate(PARCAT2 = ifelse(.data$PARCAT_ind == 1, parcat2[1], parcat2[2])) %>%
    dplyr::select(-.data$PARCAT_ind)

  # Add in PARCAT1
  adex <- adex %>% dplyr::mutate(PARCAT1 = dplyr::case_when(
    (.data$PARAMCD == "TNDOSE" | .data$PARAMCD == "TDOSE") ~ "OVERALL",
    .data$PARAMCD == "DOSE" | .data$PARAMCD == "NDOSE" ~ "INDIVIDUAL"))

  adex_visit <- adex %>%
    dplyr::filter(.data$PARAMCD == "DOSE" | .data$PARAMCD == "NDOSE") %>%
    dplyr::mutate(
      AVISIT = rep(visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days), 2)
    )

  adex <- dplyr::left_join(
    adex %>%
    dplyr::group_by(
      .data$USUBJID,
      .data$STUDYID,
      .data$PARAM,
      .data$PARAMCD,
      .data$AVALU,
      .data$PARCAT1,
      .data$PARCAT2
      ) %>%
      dplyr::mutate(id = dplyr::row_number()),
    adex_visit %>%
    dplyr::group_by(
      .data$USUBJID,
      .data$STUDYID,
      .data$PARAM,
      .data$PARAMCD,
      .data$AVALU,
      .data$PARCAT1,
      .data$PARCAT2
      ) %>%
      dplyr::mutate(id = dplyr::row_number()),
    by = c("USUBJID", "STUDYID", "PARCAT1", "PARCAT2", "id", "PARAMCD", "PARAM", "AVALU")) %>%
  dplyr::select(-.data$id)

  #Visit numbers
  adex <- adex %>% dplyr::mutate(AVISITN = dplyr::case_when(
    AVISIT == "SCREENING" ~ -1,
    AVISIT == "BASELINE" ~ 0,
    (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
    TRUE ~ 999000
  ))


  adex2 <- split(adex, adex$USUBJID) %>%
    lapply(function(pinfo) {
      pinfo %>%
        dplyr::filter(.data$PARAMCD == "DOSE") %>%
        dplyr::group_by(.data$USUBJID, .data$PARCAT2, .data$AVISIT) %>%
        dplyr::mutate(changeind = dplyr::case_when(
          .data$AVISIT == "SCREENING" ~ 0,
          .data$AVISIT != "SCREENING" ~ sample(c(-1, 0, 1),
          size = 1,
          prob = c(0.25, 0.5, 0.25),
          replace = TRUE))) %>%
        dplyr::ungroup() %>%
        dplyr::group_by(.data$USUBJID, .data$PARCAT2) %>%
        dplyr::mutate(
          csum = cumsum(.data$changeind),
          changeind = dplyr::case_when(
            .data$csum <= -3 ~ sample(c(0, 1), size = 1, prob = c(0.5, 0.5)),
            .data$csum >= 3 ~ sample(c(0, -1), size = 1, prob = c(0.5, 0.5)),
            TRUE ~ .data$changeind)
          ) %>%
        dplyr::mutate(csum = cumsum(.data$changeind)) %>%
        dplyr::ungroup() %>%
        dplyr::group_by(.data$USUBJID, .data$PARCAT2, .data$AVISIT) %>%
        dplyr::mutate(AVAL = dplyr::case_when(
          .data$csum == -2 ~ 480,
          .data$csum == -1 ~ 720,
          .data$csum == 0 ~ 960,
          .data$csum == 1 ~ 1200,
          .data$csum == 2 ~ 1440)) %>%
        dplyr::select(-c(.data$csum, .data$changeind)) %>%
        dplyr::ungroup()
    })  %>%
    Reduce(rbind, .)

  adextmp <- dplyr::full_join(adex2, adex, by = names(adex))
  adex <- adextmp %>%
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(AVAL = ifelse(.data$PARAMCD == "NDOSE", 1, .data$AVAL)) %>%
    dplyr::mutate(AVAL = ifelse(
      .data$PARAMCD == "TNDOSE",
      sum(.data$AVAL[.data$PARAMCD == "NDOSE"]),
      .data$AVAL)) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(.data$USUBJID, .data$STUDYID, .data$PARCAT2) %>%
    dplyr::mutate(AVAL = ifelse(
      .data$PARAMCD == "TDOSE",
      sum(.data$AVAL[.data$PARAMCD == "DOSE"]),
      .data$AVAL)
    )


  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    adex <- mutate_na(ds = adex, na_vars = na_vars, na_percentage = na_percentage)
  }

  adex <- var_relabel(
    adex,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add adex date and study day variables
  adex <- dplyr::inner_join(ADSL, adex, by = c("STUDYID", "USUBJID")) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    dplyr::mutate(trtedt_int = dplyr::case_when(
      !is.na(TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(TRTEDTM) ~ floor(.data$trtsdt_int + (.data$study_duration_secs) / 86400)
    )) %>%
    dplyr::mutate(ASTDTM = as.POSIXct(
      (sample(.data$trtsdt_int:.data$trtedt_int, size = 1) * 86400),
      origin = "1970-01-01")) %>%
    dplyr::mutate(astdt_int = as.numeric(as.Date(.data$ASTDTM))) %>%
    # add 1 to end of range incase both values passed to sample() are the same
    dplyr::mutate(AENDTM = as.POSIXct(
      (sample(.data$astdt_int:(.data$trtedt_int + 1), size = 1) * 86400),
      origin = "1970-01-01")) %>%
    dplyr::select(-.data$trtsdt_int, -.data$trtedt_int, -.data$astdt_int) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$STUDYID, .data$USUBJID, .data$ASTDTM)


  adex <- adex %>%
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(EXSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = .data$EXSEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      .data$STUDYID,
      .data$USUBJID,
      .data$PARAMCD,
      .data$ASTDTM,
      .data$AVISITN,
      .data$EXSEQ
    )

  # apply metadata
  adex <- apply_metadata(adex, "metadata/ADEX.yml")

}
