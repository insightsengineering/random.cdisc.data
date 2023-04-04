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
#' adsl <- radsl(N = 10, study_duration = 2, seed = 1)
#'
#' adex <- radex(adsl, seed = 2)
#' adex
radex <- function(adsl,
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

  checkmate::assert_data_frame(adsl)
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
  study_duration_secs <- lubridate::seconds(attr(adsl, "study_duration_secs"))

  adex <- expand.grid(
    STUDYID = unique(adsl$STUDYID),
    USUBJID = adsl$USUBJID,
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
  adex <- adex %>% rel_var(
    var_name = "PARAMCD",
    related_var = "PARAM",
    var_values = param_init_list$relvar2
  )

  # assign related variable values: AVALUxPARAM are related
  adex <- adex %>% rel_var(
    var_name = "AVALU",
    related_var = "PARAM",
    var_values = unit_init_list$relvar2
  )

  adex <- adex %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(PARCAT_ind = sample(c(1, 2), size = 1)) %>%
    dplyr::mutate(PARCAT2 = ifelse(PARCAT_ind == 1, parcat2[1], parcat2[2])) %>%
    dplyr::select(-"PARCAT_ind")

  # Add in PARCAT1
  adex <- adex %>% dplyr::mutate(PARCAT1 = dplyr::case_when(
    (PARAMCD == "TNDOSE" | PARAMCD == "TDOSE") ~ "OVERALL",
    PARAMCD == "DOSE" | PARAMCD == "NDOSE" ~ "INDIVIDUAL"
  ))

  adex_visit <- adex %>%
    dplyr::filter(PARAMCD == "DOSE" | PARAMCD == "NDOSE") %>%
    dplyr::mutate(
      AVISIT = rep(visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days), 2)
    )

  adex <- dplyr::left_join(
    adex %>%
      dplyr::group_by(
        USUBJID,
        STUDYID,
        PARAM,
        PARAMCD,
        AVALU,
        PARCAT1,
        PARCAT2
      ) %>%
      dplyr::mutate(id = dplyr::row_number()),
    adex_visit %>%
      dplyr::group_by(
        USUBJID,
        STUDYID,
        PARAM,
        PARAMCD,
        AVALU,
        PARCAT1,
        PARCAT2
      ) %>%
      dplyr::mutate(id = dplyr::row_number()),
    by = c("USUBJID", "STUDYID", "PARCAT1", "PARCAT2", "id", "PARAMCD", "PARAM", "AVALU")
  ) %>%
    dplyr::select(-"id")

  # Visit numbers
  adex <- adex %>% dplyr::mutate(AVISITN = dplyr::case_when(
    AVISIT == "SCREENING" ~ -1,
    AVISIT == "BASELINE" ~ 0,
    (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
    TRUE ~ 999000
  ))


  adex2 <- split(adex, adex$USUBJID) %>%
    lapply(function(pinfo) {
      pinfo %>%
        dplyr::filter(PARAMCD == "DOSE") %>%
        dplyr::group_by(USUBJID, PARCAT2, AVISIT) %>%
        dplyr::mutate(changeind = dplyr::case_when(
          AVISIT == "SCREENING" ~ 0,
          AVISIT != "SCREENING" ~ sample(c(-1, 0, 1),
            size = 1,
            prob = c(0.25, 0.5, 0.25),
            replace = TRUE
          )
        )) %>%
        dplyr::ungroup() %>%
        dplyr::group_by(USUBJID, PARCAT2) %>%
        dplyr::mutate(
          csum = cumsum(changeind),
          changeind = dplyr::case_when(
            csum <= -3 ~ sample(c(0, 1), size = 1, prob = c(0.5, 0.5)),
            csum >= 3 ~ sample(c(0, -1), size = 1, prob = c(0.5, 0.5)),
            TRUE ~ changeind
          )
        ) %>%
        dplyr::mutate(csum = cumsum(changeind)) %>%
        dplyr::ungroup() %>%
        dplyr::group_by(USUBJID, PARCAT2, AVISIT) %>%
        dplyr::mutate(AVAL = dplyr::case_when(
          csum == -2 ~ 480,
          csum == -1 ~ 720,
          csum == 0 ~ 960,
          csum == 1 ~ 1200,
          csum == 2 ~ 1440
        )) %>%
        dplyr::select(-c("csum", "changeind")) %>%
        dplyr::ungroup()
    }) %>%
    Reduce(rbind, .)

  adex_tmp <- dplyr::full_join(adex2, adex, by = names(adex))
  adex <- adex_tmp %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(AVAL = ifelse(PARAMCD == "NDOSE", 1, AVAL)) %>%
    dplyr::mutate(AVAL = ifelse(
      PARAMCD == "TNDOSE",
      sum(AVAL[PARAMCD == "NDOSE"]),
      AVAL
    )) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(USUBJID, STUDYID, PARCAT2) %>%
    dplyr::mutate(AVAL = ifelse(
      PARAMCD == "TDOSE",
      sum(AVAL[PARAMCD == "DOSE"]),
      AVAL
    ))

  adex <- var_relabel(
    adex,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add ADEX date and study day variables
  adex <- dplyr::inner_join(adex, adsl, by = c("STUDYID", "USUBJID")) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(TRTENDT = lubridate::date(dplyr::case_when(
      is.na(TRTEDTM) ~ lubridate::floor_date(lubridate::date(TRTSDTM) + study_duration_secs, unit = "day"),
      TRUE ~ TRTEDTM
    ))) %>%
    dplyr::mutate(ASTDTM = sample(
      seq(lubridate::as_datetime(TRTSDTM), lubridate::as_datetime(TRTENDT), by = "day"),
      size = 1
    )) %>%
    # add 1 to end of range incase both values passed to sample() are the same
    dplyr::mutate(AENDTM = sample(
      seq(lubridate::as_datetime(ASTDTM), lubridate::as_datetime(TRTENDT + 1), by = "day"),
      size = 1
    )) %>%
    dplyr::select(-TRTENDT) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(STUDYID, USUBJID, ASTDTM)


  adex <- adex %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(EXSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = EXSEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      STUDYID,
      USUBJID,
      PARAMCD,
      ASTDTM,
      AVISITN,
      EXSEQ
    )

  # Adding EXDOSFRQ
  adex <- adex %>%
    dplyr::mutate(EXDOSFRQ = dplyr::case_when(
      PARCAT1 == "INDIVIDUAL" ~ "ONCE",
      TRUE ~ ""
    ))

  # Adding EXROUTE
  adex <- adex %>%
    dplyr::mutate(EXROUTE = dplyr::case_when(
      PARCAT1 == "INDIVIDUAL" ~ sample(c("INTRAVENOUS", "SUBCUTANEOUS"),
        nrow(adex),
        replace = TRUE,
        prob = c(0.9, 0.1)
      ),
      TRUE ~ ""
    ))

  # Fix VISIT according to AVISIT
  adex <- adex %>%
    dplyr::mutate(VISIT = AVISIT)

  # Hack for VISITDY - to fix in ADSL
  visit_levels <- str_extract(levels(adex$VISIT), pattern = "[0-9]+")
  vl_extracted <- vapply(visit_levels, function(x) as.numeric(x[2]), numeric(1))
  vl_extracted <- c(-1, 1, vl_extracted[!is.na(vl_extracted)])

  # Adding VISITDY
  adex <- adex %>%
    dplyr::mutate(VISITDY = as.numeric(as.character(factor(VISIT, labels = vl_extracted))))

  # Exposure time stamps
  adex <- adex %>%
    dplyr::mutate(
      EXSTDTC = TRTSDTM + lubridate::days(VISITDY),
      EXENDTC = EXSTDTC + lubridate::hours(1),
      EXSTDY = VISITDY,
      EXENDY = VISITDY
    )

  # Correcting last exposure to treatment
  adex <- adex %>%
    dplyr::group_by(SUBJID) %>%
    dplyr::mutate(TRTEDTM = lubridate::as_datetime(max(EXENDTC, na.rm = TRUE))) %>%
    dplyr::ungroup()

  # Fixing Date - to add into ADSL
  adex <- adex %>%
    dplyr::mutate(
      TRTSDT = lubridate::date(TRTSDTM),
      TRTEDT = lubridate::date(TRTEDTM)
    )

  # Fixing analysis time stamps
  adex <- adex %>%
    dplyr::mutate(
      ASTDY = EXSTDY,
      AENDY = EXENDY,
      ASTDTM = EXSTDTC,
      AENDTM = EXENDTC
    )

  if (length(na_vars) > 0 && na_percentage > 0) {
    adex <- mutate_na(ds = adex, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  adex <- apply_metadata(adex, "metadata/adex.yml")
}

# Equivalent of stringr::str_extract_all()
str_extract <- function(string, pattern) {
  regmatches(string, gregexpr(pattern, string))
}
