#' Exposure Analysis Dataset (ADEX)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating random Exposure Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: `STUDYID`, `USUBJID`, `EXSEQ`, `PARAMCD`, `PARCAT1`, `ASTDTM`, `AENDTM`, `ASTDY`, `AENDY`,
#' `AVISITN`, `EXDOSFRQ`, `EXROUTE`, `VISIT`, `VISITDY`, `EXSTDTC`, `EXENDTC`, `EXSTDY`, `EXENDY`
#'
#' @inheritParams argument_convention
#' @param parcat1 (`character vector`)\cr Dose amount categories. Defaults to "Individual" and "Overall".
#' @param parcat2 (`character vector`)\cr Types of drug received. Defaults to "Drug A" and "Drug B".
#' @param max_n_exs (`integer`)\cr Maximum number of exposures per patient. Defaults to 6.
#' @template param_cached
#' @templateVar data adex
#'
#' @return `data.frame`
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, study_duration = 2, seed = 1)
#'
#' ADEX <- radex(ADSL, seed = 2)
#' ADEX
radex <- function(ADSL,
                  param = c(
                    "Dose administered during constant dosing interval",
                    "Number of doses administered during constant dosing interval",
                    "Total dose administered",
                    "Total number of doses administered"
                  ),
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
                  na_vars = list(AVAL = c(NA, 0.1), AVALU = c(NA), 0.1),
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadex"))
  }

  checkmate::assert_data_frame(ADSL)
  checkmate::assert_character(param, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramcd, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(parcat1, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(parcat2, min.len = 1, any.missing = FALSE)
  checkmate::assert_string(visit_format)
  checkmate::assert_integer(n_assessments, len = 1, any.missing = FALSE)
  checkmate::assert_integer(n_days, len = 1, any.missing = FALSE)
  checkmate::assert_integer(max_n_exs, len = 1, any.missing = FALSE)
  checkmate::assert_data_frame(lookup, null.ok = TRUE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  # validate and initialize related variables
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADEX <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = c(
      rep(
        param_init_list$relvar1[1],
        length(levels(visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days)))
      ),
      rep(
        param_init_list$relvar1[2],
        length(levels(visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days)))
      ),
      param_init_list$relvar1[3:4]
    ),
    stringsAsFactors = FALSE
  )

  # assign related variable values: PARAMxPARAMCD are related
  ADEX <- ADEX %>% rel_var(
    var_name = "PARAMCD",
    related_var = "PARAM",
    var_values = param_init_list$relvar2
  )

  # assign related variable values: AVALUxPARAM are related
  ADEX <- ADEX %>% rel_var(
    var_name = "AVALU",
    related_var = "PARAM",
    var_values = unit_init_list$relvar2
  )

  ADEX <- ADEX %>%
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(PARCAT_ind = sample(c(1, 2), size = 1)) %>%
    dplyr::mutate(PARCAT2 = ifelse(.data$PARCAT_ind == 1, parcat2[1], parcat2[2])) %>%
    dplyr::select(-"PARCAT_ind")

  # Add in PARCAT1
  ADEX <- ADEX %>% dplyr::mutate(PARCAT1 = dplyr::case_when(
    (.data$PARAMCD == "TNDOSE" | .data$PARAMCD == "TDOSE") ~ "OVERALL",
    .data$PARAMCD == "DOSE" | .data$PARAMCD == "NDOSE" ~ "INDIVIDUAL"
  ))

  ADEX_VISIT <- ADEX %>%
    dplyr::filter(.data$PARAMCD == "DOSE" | .data$PARAMCD == "NDOSE") %>%
    dplyr::mutate(
      AVISIT = rep(visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days), 2)
    )

  ADEX <- dplyr::left_join(
    ADEX %>%
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
    ADEX_VISIT %>%
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
    by = c("USUBJID", "STUDYID", "PARCAT1", "PARCAT2", "id", "PARAMCD", "PARAM", "AVALU")
  ) %>%
    dplyr::select(-"id")

  # Visit numbers
  ADEX <- ADEX %>% dplyr::mutate(AVISITN = dplyr::case_when(
    AVISIT == "SCREENING" ~ -1,
    AVISIT == "BASELINE" ~ 0,
    (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
    TRUE ~ 999000
  ))


  ADEX2 <- split(ADEX, ADEX$USUBJID) %>%
    lapply(function(pinfo) {
      pinfo %>%
        dplyr::filter(.data$PARAMCD == "DOSE") %>%
        dplyr::group_by(.data$USUBJID, .data$PARCAT2, .data$AVISIT) %>%
        dplyr::mutate(changeind = dplyr::case_when(
          .data$AVISIT == "SCREENING" ~ 0,
          .data$AVISIT != "SCREENING" ~ sample(c(-1, 0, 1),
            size = 1,
            prob = c(0.25, 0.5, 0.25),
            replace = TRUE
          )
        )) %>%
        dplyr::ungroup() %>%
        dplyr::group_by(.data$USUBJID, .data$PARCAT2) %>%
        dplyr::mutate(
          csum = cumsum(.data$changeind),
          changeind = dplyr::case_when(
            .data$csum <= -3 ~ sample(c(0, 1), size = 1, prob = c(0.5, 0.5)),
            .data$csum >= 3 ~ sample(c(0, -1), size = 1, prob = c(0.5, 0.5)),
            TRUE ~ .data$changeind
          )
        ) %>%
        dplyr::mutate(csum = cumsum(.data$changeind)) %>%
        dplyr::ungroup() %>%
        dplyr::group_by(.data$USUBJID, .data$PARCAT2, .data$AVISIT) %>%
        dplyr::mutate(AVAL = dplyr::case_when(
          .data$csum == -2 ~ 480,
          .data$csum == -1 ~ 720,
          .data$csum == 0 ~ 960,
          .data$csum == 1 ~ 1200,
          .data$csum == 2 ~ 1440
        )) %>%
        dplyr::select(-c("csum", "changeind")) %>%
        dplyr::ungroup()
    }) %>%
    Reduce(rbind, .)

  ADEXTMP <- dplyr::full_join(ADEX2, ADEX, by = names(ADEX))
  ADEX <- ADEXTMP %>%
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(AVAL = ifelse(.data$PARAMCD == "NDOSE", 1, .data$AVAL)) %>%
    dplyr::mutate(AVAL = ifelse(
      .data$PARAMCD == "TNDOSE",
      sum(.data$AVAL[.data$PARAMCD == "NDOSE"]),
      .data$AVAL
    )) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(.data$USUBJID, .data$STUDYID, .data$PARCAT2) %>%
    dplyr::mutate(AVAL = ifelse(
      .data$PARAMCD == "TDOSE",
      sum(.data$AVAL[.data$PARAMCD == "DOSE"]),
      .data$AVAL
    ))

  ADEX <- var_relabel(
    ADEX,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add ADEX date and study day variables
  ADEX <- dplyr::inner_join(ADEX, ADSL, by = c("STUDYID", "USUBJID")) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    dplyr::mutate(trtedt_int = dplyr::case_when(
      !is.na(TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(TRTEDTM) ~ floor(.data$trtsdt_int + (.data$study_duration_secs) / 86400)
    )) %>%
    dplyr::mutate(ASTDTM = as.POSIXct(
      (sample(.data$trtsdt_int:.data$trtedt_int, size = 1) * 86400),
      origin = "1970-01-01"
    )) %>%
    dplyr::mutate(astdt_int = as.numeric(as.Date(.data$ASTDTM))) %>%
    # add 1 to end of range incase both values passed to sample() are the same
    dplyr::mutate(AENDTM = as.POSIXct(
      (sample(.data$astdt_int:(.data$trtedt_int + 1), size = 1) * 86400),
      origin = "1970-01-01"
    )) %>%
    dplyr::select(-"trtsdt_int", -"trtedt_int", -"astdt_int") %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$STUDYID, .data$USUBJID, .data$ASTDTM)


  ADEX <- ADEX %>%
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

  # Adding EXDOSFRQ
  ADEX <- ADEX %>%
    dplyr::mutate(EXDOSFRQ = dplyr::case_when(
      PARCAT1 == "INDIVIDUAL" ~ "ONCE",
      TRUE ~ ""
    ))

  # Adding EXROUTE
  ADEX <- ADEX %>%
    dplyr::mutate(EXROUTE = dplyr::case_when(
      PARCAT1 == "INDIVIDUAL" ~ sample(c("INTRAVENOUS", "SUBCUTANEOUS"),
        nrow(ADEX),
        replace = TRUE,
        prob = c(0.9, 0.1)
      ),
      TRUE ~ ""
    ))

  # Fix VISIT according to AVISIT
  ADEX <- ADEX %>%
    dplyr::mutate(VISIT = .data$AVISIT)

  # Hack for VISITDY - to fix in ADSL
  visit_levels <- str_extract(levels(ADEX$VISIT), pattern = "[0-9]+")
  vl_extracted <- vapply(visit_levels, function(x) as.numeric(x[2]), numeric(1))
  vl_extracted <- c(-1, 1, vl_extracted[!is.na(vl_extracted)])

  # Adding VISITDY
  ADEX <- ADEX %>%
    dplyr::mutate(VISITDY = as.numeric(as.character(factor(.data$VISIT, labels = vl_extracted))))

  # Exposure time stamps
  ADEX <- ADEX %>%
    dplyr::mutate(
      EXSTDTC = lubridate::as_datetime(.data$TRTSDTM) + lubridate::days(.data$VISITDY),
      EXENDTC = .data$EXSTDTC + lubridate::hours(1),
      EXSTDY = .data$VISITDY,
      EXENDY = .data$VISITDY
    )

  # Correcting last exposure to treatment
  ADEX <- ADEX %>%
    dplyr::group_by(.data$SUBJID) %>%
    dplyr::mutate(TRTEDTM = max(.data$EXENDTC, na.rm = TRUE)) %>%
    dplyr::ungroup()

  # Fixing Date - to add into ADSL
  ADEX <- ADEX %>%
    dplyr::mutate(
      TRTSDT = lubridate::as_date(.data$TRTSDTM),
      TRTEDT = lubridate::as_date(.data$TRTEDTM)
    )

  # Fixing analysis time stamps
  ADEX <- ADEX %>%
    dplyr::mutate(
      ASTDY = .data$EXSTDY,
      AENDY = .data$EXENDY,
      ASTDTM = .data$EXSTDTC,
      AENDTM = .data$EXENDTC
    )

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADEX <- mutate_na(ds = ADEX, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  ADEX <- apply_metadata(ADEX, "metadata/ADEX.yml")
}

# Equivalent of stringr::str_extract_all()
str_extract <- function(string, pattern) {
  regmatches(string, gregexpr(pattern, string))
}
