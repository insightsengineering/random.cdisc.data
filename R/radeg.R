#' ECG Analysis Dataset (ADEG)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating random dataset from ECG Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: `STUDYID`, `USUBJID`, `PARAMCD`, `BASETYPE`, `AVISITN`, `ATPTN`, `DTYPE`, `ADTM`, `EGSEQ`, `ASPID`
#'
#' @inheritParams argument_convention
#' @param egcat (`character vector`)\cr EG category values.
#' @param max_n_eg (`integer`)\cr Maximum number of EG results per patient. Defaults to 10.
#' @template param_cached
#' @templateVar data adeg
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
#' ADEG <- radeg(ADSL, visit_format = "WEEK", n_assessments = 7L, seed = 2)
#' ADEG
#'
#' ADEG <- radeg(ADSL, visit_format = "CYCLE", n_assessments = 2L, seed = 2)
#' ADEG
radeg <- function(ADSL,
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
  checkmate::assert_data_frame(lookup, null.ok = TRUE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  # validate and initialize related variables
  egcat_init_list <- relvar_init(param, egcat)
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADEG <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days),
    stringsAsFactors = FALSE
  )

  # assign related variable values: PARAMxEGCAT are related
  ADEG <- ADEG %>% rel_var(
    var_name = "EGCAT",
    related_var = "PARAM",
    var_values = egcat_init_list$relvar2
  )

  # assign related variable values: PARAMxPARAMCD are related
  ADEG <- ADEG %>% rel_var(
    var_name = "PARAMCD",
    related_var = "PARAM",
    var_values = param_init_list$relvar2
  )

  ADEG <- ADEG %>% dplyr::mutate(AVAL = dplyr::case_when(
    .data$PARAMCD == "QT" ~ stats::rnorm(nrow(ADEG), mean = 350, sd = 100),
    .data$PARAMCD == "RR" ~ stats::rnorm(nrow(ADEG), mean = 1050, sd = 300),
    .data$PARAMCD == "HR" ~ stats::rnorm(nrow(ADEG), mean = 70, sd = 20),
    .data$PARAMCD == "ECGINTP" ~ NA_real_
  ))

  ADEG <- ADEG %>%
    dplyr::mutate(EGTESTCD = .data$PARAMCD) %>%
    dplyr::mutate(EGTEST = .data$PARAM)

  ADEG <- ADEG %>% dplyr::mutate(AVISITN = dplyr::case_when(
    AVISIT == "SCREENING" ~ -1,
    AVISIT == "BASELINE" ~ 0,
    (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
    TRUE ~ NA_real_
  ))

  ADEG <- ADEG %>% rel_var(
    var_name = "AVALU",
    related_var = "PARAM",
    var_values = unit_init_list$relvar2
  )

  # order to prepare for change from screening and baseline values
  ADEG <- ADEG[order(ADEG$STUDYID, ADEG$USUBJID, ADEG$PARAMCD, ADEG$AVISITN), ]

  ADEG <- Reduce(rbind, lapply(split(ADEG, ADEG$USUBJID), function(x) {
    x$STUDYID <- ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])]
    x$ABLFL <- ifelse(toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE",
      "Y",
      ifelse(toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1", "Y", "")
    )
    x
  }))

  ADEG$BASE <- ifelse(ADEG$AVISITN >= 0, retain(ADEG, ADEG$AVAL, ADEG$ABLFL == "Y"), ADEG$AVAL)

  ADEG <- ADEG %>% dplyr::mutate(ANRLO = dplyr::case_when(
    .data$PARAMCD == "QT" ~ 200,
    .data$PARAMCD == "RR" ~ 600,
    .data$PARAMCD == "HR" ~ 40,
    .data$PARAMCD == "ECGINTP" ~ NA_real_
  ))

  ADEG <- ADEG %>% dplyr::mutate(ANRHI = dplyr::case_when(
    .data$PARAMCD == "QT" ~ 500,
    .data$PARAMCD == "RR" ~ 1500,
    .data$PARAMCD == "HR" ~ 100,
    .data$PARAMCD == "ECGINTP" ~ NA_real_
  ))

  ADEG <- ADEG %>% dplyr::mutate(ANRIND = factor(dplyr::case_when(
    .data$AVAL < .data$ANRLO ~ "LOW",
    .data$AVAL >= .data$ANRLO & .data$AVAL <= .data$ANRHI ~ "NORMAL",
    .data$AVAL > .data$ANRHI ~ "HIGH"
  )))

  ADEG <- ADEG %>%
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

  ADEG$ANRIND <- factor(ADEG$ANRIND, levels = c("LOW", "NORMAL", "HIGH"))
  ADEG$BNRIND <- factor(ADEG$BNRIND, levels = c("LOW", "NORMAL", "HIGH"))

  ADEG <- var_relabel(
    ADEG,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add EG date and study day variables
  ADEG <- dplyr::inner_join(
    ADEG,
    ADSL,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    dplyr::mutate(trtedt_int = dplyr::case_when(
      !is.na(TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(TRTEDTM) ~ floor(.data$trtsdt_int + (.data$study_duration_secs) / 86400)
    )) %>%
    dplyr::ungroup()

  ADEG <- ADEG %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::arrange(USUBJID, AVISITN) %>%
    dplyr::mutate(ADTM = rep(
      sort(as.POSIXct(
        sample(.data$trtsdt_int[1]:.data$trtedt_int[1], size = nlevels(AVISIT)) * 86400,
        origin = "1970-01-01"
      )),
      each = n() / nlevels(AVISIT)
    )) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(ADY = ceiling(as.numeric(difftime(.data$ADTM, .data$TRTSDTM, units = "days")))) %>%
    dplyr::select(-"trtsdt_int", -"trtedt_int") %>%
    dplyr::arrange(.data$STUDYID, .data$USUBJID, .data$ADTM)

  ADEG <- ADEG %>%
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

  ADEG <- ADEG %>% dplyr::mutate(ONTRTFL = factor(dplyr::case_when(
    !AVISIT %in% c("SCREENING", "BASELINE") ~ "Y",
    TRUE ~ ""
  )))

  ADEG <- ADEG %>% dplyr::mutate(AVALC = ifelse(
    .data$PARAMCD == "ECGINTP",
    as.character(sample_fct(c("ABNORMAL", "NORMAL"), nrow(ADEG), prob = c(0.25, 0.75))),
    as.character(.data$AVAL)
  ))

  # Temporarily creating a row_check column to easily match newly created
  # observations with their row correct arrangement.
  ADEG <- ADEG %>%
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
      {
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
    dplyr::arrange(.data$row_check) %>%
    dplyr::group_by(.data$USUBJID, .data$PARAMCD, .data$BASETYPE) %>%
    dplyr::arrange(.data$AVISIT, .by_group = TRUE) %>%
    dplyr::ungroup()

  # Dropping the "row_check" column created above.
  ADEG <- ADEG[, -which(names(ADEG) %in% c("row_check"))]

  # Created function to easily match rows which comply to ONTRTFL derivation
  flag_variables <- function(data, worst_obs) {
    data_compare <- data %>%
      dplyr::mutate(row_check = seq_len(nrow(data)))

    data <- data_compare %>%
      {
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
      {
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
      {
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

  ADEG <- flag_variables(ADEG, FALSE) %>% dplyr::rename(WORS01FL = "new_var")
  ADEG <- flag_variables(ADEG, TRUE) %>% dplyr::rename(WORS02FL = "new_var")

  ADEG <- ADEG %>% dplyr::mutate(ANL01FL = factor(ifelse(
    (.data$ABLFL == "Y" | (is.na(.data$DTYPE) & .data$WORS01FL == "Y")) &
      (.data$AVISIT != "SCREENING"),
    "Y",
    ""
  )))

  ADEG <- ADEG %>%
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

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADEG <- mutate_na(ds = ADEG, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  ADEG <- apply_metadata(ADEG, "metadata/ADEG.yml")

  return(ADEG)
}
