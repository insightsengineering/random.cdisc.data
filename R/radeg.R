#' ECG Analysis Dataset (ADEG)
#'
#' Function for generating random dataset from ECG Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: STUDYID, USUBJID, PARAMCD, BASETYPE, AVISITN, ATPTN, DTYPE, ADTM, EGSEQ, ASPID.
#'
#' @template ADSL_params
#' @template BDS_findings_params
#' @param egcat As character vector of eg category values.
#' @param paramu As character vector of parameter unit values.
#' @param max_n_eg As numeric. maximum number of eg results.
#' @param lookup control lookup process.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data adeg
#' @template param_cached
#' @template return_data.frame
#'
#'
#' @export
#'
#' @author tomlinsj, npaszty, Xuefeng Hou, dipietrc
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' radeg(ADSL, visit_format = "WEEK", n_assessments = 7L, seed = 2)
#' radeg(ADSL, visit_format = "CYCLE", n_assessments = 2L, seed = 2)
radeg <- function(ADSL, # nolint
                  egcat = c("INTERVAL", "INTERVAL", "MEASUREMENT", "FINDING"),
                  param = c(
                    "QT Duration",
                    "RR Duration",
                    "Heart Rate",
                    "ECG Interpretation"
                  ),
                  paramcd = c("QT", "RR", "HR", "ECGINTP"),
                  paramu = c("msec", "msec", "beats/min", ""),
                  visit_format = "WEEK",
                  n_assessments = 5L,
                  n_days = 5L,
                  max_n_eg = 10L,
                  lookup = NULL,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(
                    ABLFL = c(1235, 0.1), BASE = c(NA, 0.1), BASEC = c(NA, 0.1),
                    CHG = c(1234, 0.1), PCHG = c(1234, 0.1)
                  ),
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadeg"))
  }

  checkmate::assert_data_frame(ADSL)
  checkmate::assert_character(egcat, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(param, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramcd, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramu, min.len = 1, any.missing = FALSE)
  checkmate::assert_string(visit_format)
  checkmate::assert_integer(n_assessments, len = 1, any.missing = FALSE)
  checkmate::assert_integer(n_days, len = 1, any.missing = FALSE)
  checkmate::assert_integer(max_n_eg, len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1, na.ok = TRUE)
  # also check na_percentage is not 1
  stopifnot(is.na(na_percentage) || na_percentage < 1)

  # validate and initialize related variables
  egcat_init_list <- relvar_init(param, egcat)
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADEG <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days),
    stringsAsFactors = FALSE
  )

  # assign related variable values: PARAMxEGCAT are related
  ADEG$EGCAT <- as.factor(rel_var( # nolint
    df = ADEG,
    var_name = "EGCAT",
    var_values = egcat_init_list$relvar2,
    related_var = "PARAM"
  ))

  # assign related variable values: PARAMxPARAMCD are related
  ADEG$PARAMCD <- as.factor(rel_var( # nolint
    df = ADEG,
    var_name = "PARAMCD",
    var_values = param_init_list$relvar2,
    related_var = "PARAM"
  ))

  ADEG <- ADEG %>% dplyr::mutate(AVAL = dplyr::case_when( # nolint
    .data$PARAMCD == "QT" ~ stats::rnorm(nrow(ADEG), mean = 350, sd = 100),
    .data$PARAMCD == "RR" ~ stats::rnorm(nrow(ADEG), mean = 1050, sd = 300),
    .data$PARAMCD == "HR" ~ stats::rnorm(nrow(ADEG), mean = 70, sd = 20),
    .data$PARAMCD == "ECGINTP" ~ NA_real_
  ))

  ADEG <- ADEG %>% # nolint
    dplyr::mutate(EGTESTCD = .data$PARAMCD) %>%
    dplyr::mutate(EGTEST = .data$PARAM)

  ADEG <- ADEG %>% dplyr::mutate(AVISITN = dplyr::case_when( # nolint
    AVISIT == "SCREENING" ~ -1,
    AVISIT == "BASELINE" ~ 0,
    (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
    TRUE ~ NA_real_
  ))

  ADEG$AVALU <- as.factor(rel_var( # nolint
    df = ADEG,
    var_name = "AVALU",
    var_values = unit_init_list$relvar2,
    related_var = "PARAM"
  ))

  # order to prepare for change from screening and baseline values
  ADEG <- ADEG[order(ADEG$STUDYID, ADEG$USUBJID, ADEG$PARAMCD, ADEG$AVISITN), ] # nolint

  ADEG <- Reduce(rbind, lapply(split(ADEG, ADEG$USUBJID), function(x) { # nolint
    x$STUDYID <- ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])] # nolint
    x$ABLFL <- ifelse(toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE", # nolint
      "Y",
      ifelse(toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1", "Y", "")
    )
    x
  }))

  ADEG$BASE <- ifelse(ADEG$AVISITN >= 0, retain(ADEG, ADEG$AVAL, ADEG$ABLFL == "Y"), ADEG$AVAL) # nolint

  ADEG <- ADEG %>% dplyr::mutate(ANRLO = dplyr::case_when( # nolint
    .data$PARAMCD == "QT" ~ 200,
    .data$PARAMCD == "RR" ~ 600,
    .data$PARAMCD == "HR" ~ 40,
    .data$PARAMCD == "ECGINTP" ~ NA_real_
  ))

  ADEG <- ADEG %>% dplyr::mutate(ANRHI = dplyr::case_when( # nolint
    .data$PARAMCD == "QT" ~ 500,
    .data$PARAMCD == "RR" ~ 1500,
    .data$PARAMCD == "HR" ~ 100,
    .data$PARAMCD == "ECGINTP" ~ NA_real_
  ))

  ADEG <- ADEG %>% dplyr::mutate(ANRIND = factor(dplyr::case_when( # nolint
    .data$AVAL < .data$ANRLO ~ "LOW",
    .data$AVAL >= .data$ANRLO & .data$AVAL <= .data$ANRHI ~ "NORMAL",
    .data$AVAL > .data$ANRHI ~ "HIGH"
  )))

  ADEG <- ADEG %>%
    # nolint
    dplyr::mutate(CHG = ifelse(.data$AVISITN > 0, .data$AVAL - .data$BASE, NA)) %>%
    dplyr::mutate(PCHG = ifelse(.data$AVISITN > 0, 100 * (.data$CHG / .data$BASE), NA)) %>%
    dplyr::mutate(BASETYPE = "LAST") %>%
    dplyr::group_by(.data$USUBJID, .data$PARAMCD, .data$BASETYPE) %>%
    dplyr::mutate(BNRIND = .data$ANRIND[.data$ABLFL == "Y"]) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(ATPTN = 1) %>%
    dplyr::mutate(DTYPE = NA) %>%
    var_relabel(
      STUDYID = attr(ADEG$STUDYID, "label"),
      USUBJID = attr(ADEG$USUBJID, "label")
    )

  ADEG$ANRIND <- factor(ADEG$ANRIND, levels = c("LOW", "NORMAL", "HIGH")) # nolint
  ADEG$BNRIND <- factor(ADEG$BNRIND, levels = c("LOW", "NORMAL", "HIGH")) # nolint

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADEG <- mutate_na(ds = ADEG, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADEG <- var_relabel( # nolint
    ADEG,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add EG date and study day variables
  ADEG <- dplyr::inner_join( # nolint
    ADSL, # nolint
    ADEG,
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

  ADEG <- ADEG %>%
    # nolint
    dplyr::mutate(ASPID = sample(seq_len(dplyr::n()))) %>%
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(EGSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = .data$EGSEQ) %>%
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
      .data$EGSEQ,
      .data$ASPID
    )

  ADEG <- ADEG %>% dplyr::mutate(ONTRTFL = factor(dplyr::case_when( # nolint
    is.na(.data$TRTSDTM) ~ "",
    is.na(.data$ADTM) ~ "Y",
    (.data$ADTM < .data$TRTSDTM) ~ "",
    (.data$ADTM > .data$TRTEDTM) ~ "",
    TRUE ~ "Y"
  )))

  ADEG <- ADEG %>% dplyr::mutate(AVALC = ifelse( # nolint
    .data$PARAMCD == "ECGINTP",
    as.character(sample_fct(c("ABNORMAL", "NORMAL"), nrow(ADEG), prob = c(0.25, 0.75))),
    as.character(.data$AVAL)
  ))

  # Temporarily creating a row_check column to easily match newly created
  # observations with their row correct arrangement.
  ADEG <- ADEG %>% # nolint
    dplyr::mutate(row_check = seq_len(nrow(ADEG)))

  # Created function to add in new observations for DTYPE, "MINIMUM" & "MAXIMUM" in this case.
  get_groups <- function(data,
                         minimum) {
    data <- data %>%
      dplyr::group_by(.data$USUBJID, .data$PARAMCD, .data$BASETYPE) %>%
      dplyr::arrange(.data$ADTM, .data$ASPID, .data$EGSEQ) %>%
      dplyr::filter(
        (.data$AVISIT != "BASELINE" & .data$AVISIT != "SCREENING") &
          (.data$ONTRTFL == "Y" | .data$ADTM <= .data$TRTSDTM)
      ) %>%
      { # nolint
        if (minimum == TRUE) {
          dplyr::filter(., .data$AVAL == min(.data$AVAL)) %>%
            dplyr::mutate(., DTYPE = "MINIMUM", AVISIT = "POST-BASELINE MINIMUM")
        } else {
          dplyr::filter(., .data$AVAL == max(.data$AVAL)) %>%
            dplyr::mutate(., DTYPE = "MAXIMUM", AVISIT = "POST-BASELINE MAXIMUM")
        }
      } %>%
      dplyr::slice(1) %>%
      dplyr::ungroup()

    return(data)
  }

  # Binding the new observations to the dataset from the function above and rearranging in the correct order.
  ADEG <- rbind(ADEG, get_groups(ADEG, TRUE), get_groups(ADEG, FALSE)) %>%
    # nolint
    dplyr::arrange(.data$row_check) %>%
    dplyr::group_by(.data$USUBJID, .data$PARAMCD, .data$BASETYPE) %>%
    dplyr::arrange(.data$AVISIT, .by_group = TRUE) %>%
    dplyr::ungroup()

  # Dropping the "row_check" column created above.
  ADEG <- ADEG[, -which(names(ADEG) %in% c("row_check"))] # nolint

  # Created function to easily match rows which comply to ONTRTFL derivation
  flag_variables <- function(data, worst_obs) {
    data_compare <- data %>% # nolint
      dplyr::mutate(row_check = seq_len(nrow(data)))

    data <- data_compare %>%
      { # nolint
        if (worst_obs == FALSE) {
          dplyr::group_by(., .data$USUBJID, .data$PARAMCD, .data$BASETYPE, .data$AVISIT) %>%
            dplyr::arrange(., .data$ADTM, .data$ASPID, .data$EGSEQ)
        } else {
          dplyr::group_by(., .data$USUBJID, .data$PARAMCD, .data$BASETYPE)
        }
      } %>%
      dplyr::filter(
        .data$AVISITN > 0 & (.data$ONTRTFL == "Y" | .data$ADTM <= .data$TRTSDTM) &
          is.na(.data$DTYPE)
      ) %>%
      { # nolint
        if (worst_obs == TRUE) {
          dplyr::arrange(., .data$AVALC) %>% dplyr::filter(., ifelse(
            .data$PARAMCD == "ECGINTP",
            ifelse(.data$AVALC == "ABNORMAL", .data$AVALC == "ABNORMAL", .data$AVALC == "NORMAL"),
            .data$AVAL == min(.data$AVAL)
          ))
        } else {
          dplyr::filter(., ifelse(
            .data$PARAMCD == "ECGINTP",
            .data$AVALC == "ABNORMAL" | .data$AVALC == "NORMAL",
            .data$AVAL == min(.data$AVAL)
          ))
        }
      } %>%
      dplyr::slice(1) %>%
      { # nolint
        if (worst_obs == TRUE) {
          dplyr::mutate(., new_var = dplyr::case_when(
            (.data$AVALC == "ABNORMAL" | .data$AVALC == "NORMAL") ~ "Y",
            (!is.na(.data$AVAL) & is.na(.data$DTYPE)) ~ "Y",
            TRUE ~ ""
          ))
        } else {
          dplyr::mutate(., new_var = dplyr::case_when(
            (.data$AVALC == "ABNORMAL" | .data$AVALC == "NORMAL") ~ "Y",
            (!is.na(.data$AVAL) & is.na(.data$DTYPE)) ~ "Y",
            TRUE ~ ""
          ))
        }
      } %>%
      dplyr::ungroup()

    data_compare$new_var <- ifelse(data_compare$row_check %in% data$row_check, "Y", "")
    data_compare <- data_compare[, -which(names(data_compare) %in% c("row_check"))]

    return(data_compare)
  }

  ADEG <- flag_variables(ADEG, FALSE) %>% dplyr::rename(WORS01FL = .data$new_var) # nolint
  ADEG <- flag_variables(ADEG, TRUE) %>% dplyr::rename(WORS02FL = .data$new_var) # nolint

  ADEG <- ADEG %>% dplyr::mutate(ANL01FL = factor(ifelse( # nolint
    (.data$ABLFL == "Y" | (is.na(.data$DTYPE) & .data$WORS01FL == "Y")) &
      (.data$AVISIT != "SCREENING"),
    "Y",
    ""
  )))

  ADEG <- ADEG %>%
    # nolint
    dplyr::group_by(.data$USUBJID, .data$PARAMCD, .data$BASETYPE) %>%
    dplyr::mutate(BASEC = ifelse(
      .data$PARAMCD == "ECGINTP",
      .data$AVALC[.data$AVISIT == "BASELINE"],
      as.character(.data$BASE)
    )) %>%
    dplyr::mutate(ANL03FL = dplyr::case_when(
      .data$DTYPE == "MINIMUM" ~ "Y",
      .data$ABLFL == "Y" & .data$PARAMCD != "ECGINTP" ~ "Y",
      TRUE ~ ""
    )) %>%
    dplyr::mutate(ANL04FL = dplyr::case_when(
      .data$DTYPE == "MAXIMUM" ~ "Y",
      .data$ABLFL == "Y" & .data$PARAMCD != "ECGINTP" ~ "Y",
      TRUE ~ ""
    )) %>%
    dplyr::ungroup()

  # apply metadata
  ADEG <- apply_metadata(ADEG, "metadata/ADEG.yml") # nolint

  return(ADEG)
}
