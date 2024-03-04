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
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' adeg <- radeg(adsl, visit_format = "WEEK", n_assessments = 7L, seed = 2)
#' adeg
#'
#' adeg <- radeg(adsl, visit_format = "CYCLE", n_assessments = 2L, seed = 2)
#' adeg
radeg <- function(adsl,
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

  checkmate::assert_data_frame(adsl)
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
  study_duration_secs <- lubridate::seconds(attr(adsl, "study_duration_secs"))

  adeg <- expand.grid(
    STUDYID = unique(adsl$STUDYID),
    USUBJID = adsl$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days),
    stringsAsFactors = FALSE
  )

  # assign related variable values: PARAMxEGCAT are related
  adeg <- adeg %>% rel_var(
    var_name = "EGCAT",
    related_var = "PARAM",
    var_values = egcat_init_list$relvar2
  )

  # assign related variable values: PARAMxPARAMCD are related
  adeg <- adeg %>% rel_var(
    var_name = "PARAMCD",
    related_var = "PARAM",
    var_values = param_init_list$relvar2
  )

  adeg <- adeg %>% dplyr::mutate(AVAL = dplyr::case_when(
    PARAMCD == "QT" ~ stats::rnorm(nrow(adeg), mean = 350, sd = 100),
    PARAMCD == "RR" ~ stats::rnorm(nrow(adeg), mean = 1050, sd = 300),
    PARAMCD == "HR" ~ stats::rnorm(nrow(adeg), mean = 70, sd = 20),
    PARAMCD == "ECGINTP" ~ NA_real_
  ))

  adeg <- adeg %>%
    dplyr::mutate(EGTESTCD = PARAMCD) %>%
    dplyr::mutate(EGTEST = PARAM)

  adeg <- adeg %>% dplyr::mutate(AVISITN = dplyr::case_when(
    AVISIT == "SCREENING" ~ -1,
    AVISIT == "BASELINE" ~ 0,
    (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
    TRUE ~ NA_real_
  ))

  adeg <- adeg %>% rel_var(
    var_name = "AVALU",
    related_var = "PARAM",
    var_values = unit_init_list$relvar2
  )

  # order to prepare for change from screening and baseline values
  adeg <- adeg[order(adeg$STUDYID, adeg$USUBJID, adeg$PARAMCD, adeg$AVISITN), ]

  adeg <- Reduce(rbind, lapply(split(adeg, adeg$USUBJID), function(x) {
    x$STUDYID <- adsl$STUDYID[which(adsl$USUBJID == x$USUBJID[1])]
    x$ABLFL <- ifelse(toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE",
      "Y",
      ifelse(toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1", "Y", "")
    )
    x
  }))

  adeg$BASE <- ifelse(adeg$AVISITN >= 0, retain(adeg, adeg$AVAL, adeg$ABLFL == "Y"), adeg$AVAL)

  adeg <- adeg %>% dplyr::mutate(ANRLO = dplyr::case_when(
    PARAMCD == "QT" ~ 200,
    PARAMCD == "RR" ~ 600,
    PARAMCD == "HR" ~ 40,
    PARAMCD == "ECGINTP" ~ NA_real_
  ))

  adeg <- adeg %>% dplyr::mutate(ANRHI = dplyr::case_when(
    PARAMCD == "QT" ~ 500,
    PARAMCD == "RR" ~ 1500,
    PARAMCD == "HR" ~ 100,
    PARAMCD == "ECGINTP" ~ NA_real_
  ))

  adeg <- adeg %>% dplyr::mutate(ANRIND = factor(dplyr::case_when(
    AVAL < ANRLO ~ "LOW",
    AVAL >= ANRLO & AVAL <= ANRHI ~ "NORMAL",
    AVAL > ANRHI ~ "HIGH"
  )))

  adeg <- adeg %>%
    dplyr::mutate(CHG = ifelse(AVISITN > 0, AVAL - BASE, NA)) %>%
    dplyr::mutate(PCHG = ifelse(AVISITN > 0, 100 * (CHG / BASE), NA)) %>%
    dplyr::mutate(BASETYPE = "LAST") %>%
    dplyr::group_by(USUBJID, PARAMCD, BASETYPE) %>%
    dplyr::mutate(BNRIND = ANRIND[ABLFL == "Y"]) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(ATPTN = 1) %>%
    dplyr::mutate(DTYPE = NA) %>%
    var_relabel(
      STUDYID = attr(adeg$STUDYID, "label"),
      USUBJID = attr(adeg$USUBJID, "label")
    )

  adeg$ANRIND <- factor(adeg$ANRIND, levels = c("LOW", "NORMAL", "HIGH"))
  adeg$BNRIND <- factor(adeg$BNRIND, levels = c("LOW", "NORMAL", "HIGH"))

  adeg <- var_relabel(
    adeg,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add EG date and study day variables
  adeg <- dplyr::inner_join(
    adeg,
    adsl,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(TRTENDT = lubridate::date(dplyr::case_when(
      is.na(TRTEDTM) ~ lubridate::floor_date(lubridate::date(TRTSDTM) + study_duration_secs, unit = "day"),
      TRUE ~ TRTEDTM
    ))) %>%
    dplyr::ungroup()

  adeg <- adeg %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::arrange(USUBJID, AVISITN) %>%
    dplyr::mutate(ADTM = rep(
      sort(sample(
        seq(lubridate::as_datetime(TRTSDTM[1]), lubridate::as_datetime(TRTENDT[1]), by = "day"),
        size = nlevels(AVISIT)
      )),
      each = n() / nlevels(AVISIT)
    )) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(ADY = ceiling(difftime(ADTM, TRTSDTM, units = "days"))) %>%
    dplyr::select(-TRTENDT) %>%
    dplyr::arrange(STUDYID, USUBJID, ADTM)

  adeg <- adeg %>%
    dplyr::mutate(ASPID = sample(seq_len(dplyr::n()))) %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(EGSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = EGSEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      STUDYID,
      USUBJID,
      PARAMCD,
      BASETYPE,
      AVISITN,
      ATPTN,
      DTYPE,
      ADTM,
      EGSEQ,
      ASPID
    )

  adeg <- adeg %>% dplyr::mutate(ONTRTFL = factor(dplyr::case_when(
    !AVISIT %in% c("SCREENING", "BASELINE") ~ "Y",
    TRUE ~ ""
  )))

  adeg <- adeg %>% dplyr::mutate(AVALC = ifelse(
    PARAMCD == "ECGINTP",
    as.character(sample_fct(c("ABNORMAL", "NORMAL"), nrow(adeg), prob = c(0.25, 0.75))),
    as.character(AVAL)
  ))

  # Temporarily creating a row_check column to easily match newly created
  # observations with their row correct arrangement.
  adeg <- adeg %>%
    dplyr::mutate(row_check = seq_len(nrow(adeg)))

  # Created function to add in new observations for DTYPE, "MINIMUM" & "MAXIMUM" in this case.
  get_groups <- function(data,
                         minimum) {
    data <- data %>%
      dplyr::group_by(USUBJID, PARAMCD, BASETYPE) %>%
      dplyr::arrange(ADTM, ASPID, EGSEQ) %>%
      dplyr::filter(
        (AVISIT != "BASELINE" & AVISIT != "SCREENING") &
          (ONTRTFL == "Y" | ADTM <= TRTSDTM)
      ) %>%
      {
        if (minimum == TRUE) {
          dplyr::filter(., AVAL == min(AVAL)) %>%
            dplyr::mutate(., DTYPE = "MINIMUM", AVISIT = "POST-BASELINE MINIMUM")
        } else {
          dplyr::filter(., AVAL == max(AVAL)) %>%
            dplyr::mutate(., DTYPE = "MAXIMUM", AVISIT = "POST-BASELINE MAXIMUM")
        }
      } %>%
      dplyr::slice(1) %>%
      dplyr::ungroup()

    return(data)
  }

  # Binding the new observations to the dataset from the function above and rearranging in the correct order.
  adeg <- rbind(adeg, get_groups(adeg, TRUE), get_groups(adeg, FALSE)) %>%
    dplyr::arrange(row_check) %>%
    dplyr::group_by(USUBJID, PARAMCD, BASETYPE) %>%
    dplyr::arrange(AVISIT, .by_group = TRUE) %>%
    dplyr::ungroup()

  # Dropping the "row_check" column created above.
  adeg <- adeg[, -which(names(adeg) %in% c("row_check"))]

  # Created function to easily match rows which comply to ONTRTFL derivation
  flag_variables <- function(data, worst_obs) {
    data_compare <- data %>%
      dplyr::mutate(row_check = seq_len(nrow(data)))

    data <- data_compare %>%
      {
        if (worst_obs == FALSE) {
          dplyr::group_by(., USUBJID, PARAMCD, BASETYPE, AVISIT) %>%
            dplyr::arrange(., ADTM, ASPID, EGSEQ)
        } else {
          dplyr::group_by(., USUBJID, PARAMCD, BASETYPE)
        }
      } %>%
      dplyr::filter(
        AVISITN > 0 & (ONTRTFL == "Y" | ADTM <= TRTSDTM) &
          is.na(DTYPE)
      ) %>%
      {
        if (worst_obs == TRUE) {
          dplyr::arrange(., AVALC) %>% dplyr::filter(., ifelse(
            PARAMCD == "ECGINTP",
            ifelse(AVALC == "ABNORMAL", AVALC == "ABNORMAL", AVALC == "NORMAL"),
            AVAL == min(AVAL)
          ))
        } else {
          dplyr::filter(., ifelse(
            PARAMCD == "ECGINTP",
            AVALC == "ABNORMAL" | AVALC == "NORMAL",
            AVAL == min(AVAL)
          ))
        }
      } %>%
      dplyr::slice(1) %>%
      {
        if (worst_obs == TRUE) {
          dplyr::mutate(., new_var = dplyr::case_when(
            (AVALC == "ABNORMAL" | AVALC == "NORMAL") ~ "Y",
            (!is.na(AVAL) & is.na(DTYPE)) ~ "Y",
            TRUE ~ ""
          ))
        } else {
          dplyr::mutate(., new_var = dplyr::case_when(
            (AVALC == "ABNORMAL" | AVALC == "NORMAL") ~ "Y",
            (!is.na(AVAL) & is.na(DTYPE)) ~ "Y",
            TRUE ~ ""
          ))
        }
      } %>%
      dplyr::ungroup()

    data_compare$new_var <- ifelse(data_compare$row_check %in% data$row_check, "Y", "")
    data_compare <- data_compare[, -which(names(data_compare) %in% c("row_check"))]

    return(data_compare)
  }

  adeg <- flag_variables(adeg, FALSE) %>% dplyr::rename(WORS01FL = "new_var")
  adeg <- flag_variables(adeg, TRUE) %>% dplyr::rename(WORS02FL = "new_var")

  adeg <- adeg %>% dplyr::mutate(ANL01FL = factor(ifelse(
    (ABLFL == "Y" | (is.na(DTYPE) & WORS01FL == "Y")) &
      (AVISIT != "SCREENING"),
    "Y",
    ""
  )))

  adeg <- adeg %>%
    dplyr::group_by(USUBJID, PARAMCD, BASETYPE) %>%
    dplyr::mutate(BASEC = ifelse(
      PARAMCD == "ECGINTP",
      AVALC[AVISIT == "BASELINE"],
      as.character(BASE)
    )) %>%
    dplyr::mutate(ANL03FL = dplyr::case_when(
      DTYPE == "MINIMUM" ~ "Y",
      ABLFL == "Y" & PARAMCD != "ECGINTP" ~ "Y",
      TRUE ~ ""
    )) %>%
    dplyr::mutate(ANL04FL = dplyr::case_when(
      DTYPE == "MAXIMUM" ~ "Y",
      ABLFL == "Y" & PARAMCD != "ECGINTP" ~ "Y",
      TRUE ~ ""
    )) %>%
    dplyr::ungroup()

  if (length(na_vars) > 0 && na_percentage > 0) {
    adeg <- mutate_na(ds = adeg, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  adeg <- apply_metadata(adeg, "metadata/ADEG.yml")

  return(adeg)
}
