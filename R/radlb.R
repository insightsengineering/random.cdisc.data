#' Laboratory Data Analysis Dataset (ADLB)
#'
#' Function for generating random dataset from Laboratory Data Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: STUDYID, USUBJID, PARAMCD, BASETYPE, AVISITN, ATPTN, DTYPE, ADTM, LBSEQ, ASPID.
#
#' @template ADSL_params
#' @template BDS_findings_params
#' @param lbcat As character vector of lb category values.
#' @param paramu As character vector of parameter unit values.
#' @param aval_mean As numerical vector of appropriate mean values for each lab test.
#' @param max_n_lbs As numeric. maximum number of labs.
#' @param lookup control lookup process.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data adlb
#' @template param_cached
#' @template return_data.frame
#'
#' @export
#'
#' @author tomlinsj, npaszty, Xuefeng Hou
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' radlb(ADSL, visit_format = "WEEK", n_assessments = 7L, seed = 2)
#' radlb(ADSL, visit_format = "CYCLE", n_assessments = 2L, seed = 2)
radlb <- function(ADSL, # nolint
                  lbcat = c("CHEMISTRY", "CHEMISTRY", "IMMUNOLOGY"),
                  param = c(
                    "Alanine Aminotransferase Measurement",
                    "C-Reactive Protein Measurement",
                    "Immunoglobulin A Measurement"
                  ),
                  paramcd = c("ALT", "CRP", "IGA"),
                  paramu = c("U/L", "mg/L", "g/L"),
                  aval_mean = c(20, 1, 2),
                  visit_format = "WEEK",
                  n_assessments = 5L,
                  n_days = 5L,
                  max_n_lbs = 10L,
                  lookup = NULL,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(
                    LOQFL = c(NA, 0.1), ABLFL2 = c(1234, 0.1), ABLFL = c(1235, 0.1),
                    BASE2 = c(NA, 0.1), BASE = c(NA, 0.1),
                    CHG2 = c(1235, 0.1), PCHG2 = c(1235, 0.1), CHG = c(1234, 0.1), PCHG = c(1234, 0.1)
                  ),
                  cached = FALSE) { # nolint

  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadlb"))
  }

  checkmate::assert_data_frame(ADSL)
  checkmate::assert_character(param, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramcd, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramu, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(lbcat, min.len = 1, any.missing = FALSE)
  checkmate::assert_string(visit_format)
  checkmate::assert_integer(n_assessments, len = 1, any.missing = FALSE)
  checkmate::assert_integer(n_days, len = 1, any.missing = FALSE)
  checkmate::assert_integer(max_n_lbs, len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1, na.ok = TRUE)
  # also check na_percentage is not 1
  stopifnot(is.na(na_percentage) || na_percentage < 1)

  # validate and initialize related variables
  lbcat_init_list <- relvar_init(param, lbcat)
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADLB <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days),
    stringsAsFactors = FALSE
  )

  # assign AVAL based on different test
  ADLB <- ADLB %>% # nolint
    dplyr::mutate(AVAL = stats::rnorm(nrow(ADLB), mean = 1, sd = 0.2)) %>%
    dplyr::left_join(data.frame(PARAM = param, ADJUST = aval_mean), by = "PARAM") %>%
    dplyr::mutate(AVAL = .data$AVAL * .data$ADJUST) %>%
    dplyr::select(-.data$ADJUST)

  ADLB$LBSTRESC <- ADLB$AVAL # nolint

  # assign related variable values: PARAMxLBCAT are related
  ADLB$LBCAT <- as.factor(rel_var( # nolint
    df = ADLB,
    var_name = "LBCAT",
    var_values = lbcat_init_list$relvar2,
    related_var = "PARAM"
  ))

  # assign related variable values: PARAMxPARAMCD are related
  ADLB$PARAMCD <- as.factor(rel_var( # nolint
    df = ADLB,
    var_name = "PARAMCD",
    var_values = param_init_list$relvar2,
    related_var = "PARAM"
  ))

  ADLB <- ADLB %>% # nolint
    dplyr::mutate(LBTESTCD = .data$PARAMCD) %>%
    dplyr::mutate(LBTEST = .data$PARAM)

  ADLB <- ADLB %>% dplyr::mutate(AVISITN = dplyr::case_when( # nolint
    AVISIT == "SCREENING" ~ -1,
    AVISIT == "BASELINE" ~ 0,
    (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
    TRUE ~ NA_real_
  ))

  ADLB$AVALU <- as.factor(rel_var( # nolint
    df = ADLB,
    var_name = "AVALU",
    var_values = unit_init_list$relvar2,
    related_var = "PARAM"
  ))

  ADLB <- ADLB %>% # nolint
    dplyr::mutate(AVISITN = dplyr::case_when(
      AVISIT == "SCREENING" ~ -1,
      AVISIT == "BASELINE" ~ 0,
      (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
      TRUE ~ NA_real_
    ))

  # order to prepare for change from screening and baseline values
  ADLB <- ADLB[order(ADLB$STUDYID, ADLB$USUBJID, ADLB$PARAMCD, ADLB$AVISITN), ] # nolint

  ADLB <- Reduce(rbind, lapply(split(ADLB, ADLB$USUBJID), function(x) { # nolint
    x$STUDYID <- ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])] # nolint
    x$ABLFL2 <- ifelse(x$AVISIT == "SCREENING", "Y", "") # nolint
    x$ABLFL <- ifelse(toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE", # nolint
      "Y",
      ifelse(toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1", "Y", "")
    )
    x$LOQFL <- ifelse(x$AVAL < 32, "Y", "N") # nolint
    x
  }))

  ADLB$BASE2 <- retain(ADLB, ADLB$AVAL, ADLB$ABLFL2 == "Y") # nolint
  ADLB$BASE <- ifelse(ADLB$ABLFL2 != "Y", retain(ADLB, ADLB$AVAL, ADLB$ABLFL == "Y"), NA) # nolint

  ANRIND_choices <- c("HIGH", "LOW", "NORMAL") # nolint

  ADLB <- ADLB %>% # nolint
    dplyr::mutate(CHG2 = .data$AVAL - .data$BASE2) %>%
    dplyr::mutate(PCHG2 = 100 * (.data$CHG2 / .data$BASE2)) %>%
    dplyr::mutate(CHG = .data$AVAL - .data$BASE) %>%
    dplyr::mutate(PCHG = 100 * (.data$CHG / .data$BASE)) %>%
    dplyr::mutate(BASETYPE = "LAST") %>%
    dplyr::mutate(ANRIND = sample_fct(ANRIND_choices, nrow(ADLB), prob = c(0.1, 0.1, 0.8))) %>%
    dplyr::group_by(.data$USUBJID, .data$PARAMCD, .data$BASETYPE) %>%
    dplyr::mutate(BNRIND = .data$ANRIND[.data$ABLFL == "Y"]) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(SHIFT1 = factor(ifelse(
      .data$AVISITN > 0,
      paste(retain(
        ADLB, as.character(.data$BNRIND),
        .data$AVISITN == 0
      ),
      .data$ANRIND,
      sep = " to "
      ),
      ""
    ))) %>%
    dplyr::mutate(ATOXGR = factor(dplyr::case_when(
      .data$ANRIND == "LOW" ~ sample(
        c("-1", "-2", "-3", "-4", "-5"),
        nrow(ADLB),
        replace = TRUE,
        prob = c(0.30, 0.25, 0.20, 0.15, 0)
      ),
      .data$ANRIND == "HIGH" ~ sample(
        c("1", "2", "3", "4", "5"),
        nrow(ADLB),
        replace = TRUE,
        prob = c(0.30, 0.25, 0.20, 0.15, 0)
      ),
      .data$ANRIND == "NORMAL" ~ "0"
    ))) %>%
    dplyr::group_by(.data$USUBJID, .data$PARAMCD, .data$BASETYPE) %>%
    dplyr::mutate(BTOXGR = .data$ATOXGR[.data$ABLFL == "Y"]) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(ATPTN = 1) %>%
    dplyr::mutate(DTYPE = NA) %>%
    var_relabel(
      STUDYID = attr(ADSL$STUDYID, "label"),
      USUBJID = attr(ADSL$USUBJID, "label")
    )

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADLB <- mutate_na(ds = ADLB, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADLB <- var_relabel( # nolint
    ADLB,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add LB date and study day variables
  ADLB <- dplyr::inner_join( # nolint
    ADSL,
    ADLB,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    dplyr::mutate(trtedt_int = dplyr::case_when(
      !is.na(TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(TRTEDTM) ~ floor(.data$trtsdt_int + (.data$study_duration_secs) / 86400)
    )) %>%
    dplyr::mutate(ADTM = as.POSIXct(
      (sample(.data$trtsdt_int:.data$trtedt_int, size = 1) * 86400),
      origin = "1970-01-01"
    )) %>%
    dplyr::mutate(ADY = ceiling(as.numeric(difftime(.data$ADTM, .data$TRTSDTM, units = "days")))) %>%
    dplyr::select(-.data$trtsdt_int, -.data$trtedt_int) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$STUDYID, .data$USUBJID, .data$ADTM)

  ADLB <- ADLB %>% # nolint
    dplyr::mutate(ASPID = sample(seq_len(dplyr::n()))) %>%
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(LBSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = .data$LBSEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      .data$STUDYID,
      .data$USUBJID,
      .data$PARAMCD,
      .data$BASETYPE,
      .data$AVISITN,
      .data$ATPTN,
      .data$DTYPE,
      .data$ADTM,
      .data$LBSEQ,
      .data$ASPID
    )

  ADLB <- ADLB %>% dplyr::mutate(ONTRTFL = factor(dplyr::case_when( # nolint
    is.na(.data$TRTSDTM) ~ "",
    is.na(.data$ADTM) ~ "Y",
    (.data$ADTM < .data$TRTSDTM) ~ "",
    (.data$ADTM > .data$TRTEDTM) ~ "",
    TRUE ~ "Y"
  )))

  flag_variables <- function(data,
                             apply_grouping,
                             apply_filter,
                             apply_mutate) {
    data_compare <- data %>%
      dplyr::mutate(row_check = seq_len(nrow(data)))

    data <- data_compare %>%
      { # nolint
        if (apply_grouping == TRUE) {
          dplyr::group_by(., .data$USUBJID, .data$PARAMCD, .data$BASETYPE, .data$AVISIT) # nolint
        } else {
          dplyr::group_by(., .data$USUBJID, .data$PARAMCD, .data$BASETYPE)
        }
      } %>%
      dplyr::arrange(.data$ADTM, .data$ASPID, .data$LBSEQ) %>%
      { # nolint
        if (apply_filter == TRUE) {
          dplyr::filter( # nolint
            .,
            (.data$AVISIT != "BASELINE" & .data$AVISIT != "SCREENING") & # nolint
              (.data$ONTRTFL == "Y" | .data$ADTM <= .data$TRTSDTM)
          ) %>%
            dplyr::filter(.data$ATOXGR == max(as.numeric(as.character(.data$ATOXGR))))
        } else if (apply_filter == FALSE) {
          dplyr::filter(
            .,
            (.data$AVISIT != "BASELINE" & .data$AVISIT != "SCREENING") &
              (.data$ONTRTFL == "Y" | .data$ADTM <= .data$TRTSDTM)
          ) %>%
            dplyr::filter(.data$ATOXGR == min(as.numeric(as.character(.data$ATOXGR))))
        } else {
          dplyr::filter(
            .,
            .data$AVAL == min(.data$AVAL) &
              (.data$AVISIT != "BASELINE" & .data$AVISIT != "SCREENING") &
              (.data$ONTRTFL == "Y" | .data$ADTM <= .data$TRTSDTM)
          )
        }
      } %>%
      dplyr::slice(1) %>%
      { # nolint
        if (apply_mutate == TRUE) {
          dplyr::mutate(., new_var = ifelse(is.na(.data$DTYPE), "Y", ""))
        } else {
          dplyr::mutate(., new_var = ifelse(is.na(.data$AVAL) == FALSE & is.na(.data$DTYPE), "Y", ""))
        }
      } %>%
      dplyr::ungroup()

    data_compare$new_var <- ifelse(data_compare$row_check %in% data$row_check, "Y", "")

    data_compare <- data_compare[, -which(names(data_compare) %in% c("row_check"))]

    return(data_compare)
  }

  ADLB <- flag_variables(ADLB, TRUE, "ELSE", FALSE) %>% dplyr::rename(WORS01FL = .data$new_var) # nolint
  ADLB <- flag_variables(ADLB, FALSE, TRUE, TRUE) %>% dplyr::rename(WGRHIFL = .data$new_var) # nolint
  ADLB <- flag_variables(ADLB, FALSE, FALSE, TRUE) %>% dplyr::rename(WGRLOFL = .data$new_var) # nolint
  ADLB <- flag_variables(ADLB, TRUE, TRUE, TRUE) %>% dplyr::rename(WGRHIVFL = .data$new_var) # nolint
  ADLB <- flag_variables(ADLB, TRUE, FALSE, TRUE) %>% dplyr::rename(WGRLOVFL = .data$new_var) # nolint

  ADLB <- ADLB %>% dplyr::mutate(ANL01FL = ifelse( # nolint
    (.data$ABLFL == "Y" | (.data$WORS01FL == "Y" & is.na(.data$DTYPE))) &
      (.data$AVISIT != "SCREENING"),
    "Y",
    ""
  ))

  # apply metadata

  ADLB <- apply_metadata(ADLB, "metadata/ADLB.yml") # nolint

  return(ADLB)
}
