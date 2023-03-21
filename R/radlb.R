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
radlb <- function(ADSL,
                  lbcat = c("CHEMISTRY", "CHEMISTRY", "IMMUNOLOGY"),
                  param = c(
                    "Alanine Aminotransferase Measurement",
                    "C-Reactive Protein Measurement",
                    "Immunoglobulin A Measurement"
                  ),
                  paramcd = c("ALT", "CRP", "IGA"),
                  paramu = c("U/L", "mg/L", "g/L"),
                  aval_mean = c(18, 9, 2.2),
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
                  cached = FALSE) {
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
  checkmate::assert_data_frame(lookup, null.ok = TRUE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  # validate and initialize related variables
  lbcat_init_list <- relvar_init(param, lbcat)
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  if (!is.null(seed)) {
    set.seed(seed)
  }
  study_duration_secs <- attr(ADSL, "study_duration_secs")

  ADLB <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments, n_days = n_days),
    stringsAsFactors = FALSE
  )

  # assign AVAL based on different tests
  ADLB <- ADLB %>% mutate(AVAL = case_when(
    PARAM == param[1] ~ stats::rnorm(nrow(ADLB), mean = aval_mean[1], sd = 10),
    PARAM == param[2] ~ stats::rnorm(nrow(ADLB), mean = aval_mean[2], sd = 1),
    PARAM == param[3] ~ stats::rnorm(nrow(ADLB), mean = aval_mean[3], sd = 0.1)
  ))

  # assign related variable values: PARAMxLBCAT are related
  ADLB <- ADLB %>% rel_var(
    var_name = "LBCAT",
    related_var = "PARAM",
    var_values = lbcat_init_list$relvar2
  )

  # assign related variable values: PARAMxPARAMCD are related
  ADLB <- ADLB %>% rel_var(
    var_name = "PARAMCD",
    related_var = "PARAM",
    var_values = param_init_list$relvar2
  )

  ADLB <- ADLB %>%
    dplyr::mutate(LBTESTCD = PARAMCD) %>%
    dplyr::mutate(LBTEST = PARAM)

  ADLB <- ADLB %>% dplyr::mutate(AVISITN = dplyr::case_when(
    AVISIT == "SCREENING" ~ -1,
    AVISIT == "BASELINE" ~ 0,
    (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
    TRUE ~ NA_real_
  ))

  ADLB <- ADLB %>% rel_var(
    var_name = "AVALU",
    related_var = "PARAM",
    var_values = unit_init_list$relvar2
  )

  ADLB <- ADLB %>%
    dplyr::mutate(AVISITN = dplyr::case_when(
      AVISIT == "SCREENING" ~ -1,
      AVISIT == "BASELINE" ~ 0,
      (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
      TRUE ~ NA_real_
    ))

  # order to prepare for change from screening and baseline values
  ADLB <- ADLB[order(ADLB$STUDYID, ADLB$USUBJID, ADLB$PARAMCD, ADLB$AVISITN), ]

  ADLB <- Reduce(rbind, lapply(split(ADLB, ADLB$USUBJID), function(x) {
    x$STUDYID <- ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])]
    x$ABLFL2 <- ifelse(x$AVISIT == "SCREENING", "Y", "")
    x$ABLFL <- ifelse(toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE",
      "Y",
      ifelse(toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1", "Y", "")
    )
    x
  }))

  ADLB$BASE2 <- retain(ADLB, ADLB$AVAL, ADLB$ABLFL2 == "Y")
  ADLB$BASE <- ifelse(ADLB$ABLFL2 != "Y", retain(ADLB, ADLB$AVAL, ADLB$ABLFL == "Y"), NA)

  ADLB <- ADLB %>%
    dplyr::mutate(CHG2 = AVAL - BASE2) %>%
    dplyr::mutate(PCHG2 = 100 * (CHG2 / BASE2)) %>%
    dplyr::mutate(CHG = AVAL - BASE) %>%
    dplyr::mutate(PCHG = 100 * (CHG / BASE)) %>%
    dplyr::mutate(BASETYPE = "LAST") %>%
    dplyr::mutate(ANRLO = dplyr::case_when(
      PARAMCD == "ALT" ~ 7,
      PARAMCD == "CRP" ~ 8,
      PARAMCD == "IGA" ~ 0.8
    )) %>%
    dplyr::mutate(ANRHI = dplyr::case_when(
      PARAMCD == "ALT" ~ 55,
      PARAMCD == "CRP" ~ 10,
      PARAMCD == "IGA" ~ 3
    )) %>%
    dplyr::mutate(ANRIND = factor(dplyr::case_when(
      AVAL < ANRLO ~ "LOW",
      AVAL > ANRHI ~ "HIGH",
      TRUE ~ "NORMAL"
    ))) %>%
    dplyr::mutate(LBSTRESC = factor(dplyr::case_when(
      PARAMCD == "ALT" ~ "<7",
      PARAMCD == "CRP" ~ "<8",
      PARAMCD == "IGA" ~ ">3"
    ))) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(LOQFL = factor(
      ifelse(eval(parse(text = paste(AVAL, LBSTRESC))), "Y", "N")
    )) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(USUBJID, PARAMCD, BASETYPE) %>%
    dplyr::mutate(BNRIND = ANRIND[ABLFL == "Y"]) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(SHIFT1 = factor(ifelse(
      AVISITN > 0,
      paste(
        retain(
          ADLB, as.character(BNRIND),
          AVISITN == 0
        ),
        ANRIND,
        sep = " to "
      ),
      ""
    ))) %>%
    dplyr::mutate(ATOXGR = factor(dplyr::case_when(
      ANRIND == "LOW" ~ sample(
        c("-1", "-2", "-3", "-4", "-5"),
        nrow(ADLB),
        replace = TRUE,
        prob = c(0.30, 0.25, 0.20, 0.15, 0)
      ),
      ANRIND == "HIGH" ~ sample(
        c("1", "2", "3", "4", "5"),
        nrow(ADLB),
        replace = TRUE,
        prob = c(0.30, 0.25, 0.20, 0.15, 0)
      ),
      ANRIND == "NORMAL" ~ "0"
    ))) %>%
    dplyr::group_by(USUBJID, PARAMCD, BASETYPE) %>%
    dplyr::mutate(BTOXGR = ATOXGR[ABLFL == "Y"]) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(ATPTN = 1) %>%
    dplyr::mutate(DTYPE = NA) %>%
    dplyr::mutate(BTOXGRL = factor(dplyr::case_when(
      BTOXGR == "0" ~ "0",
      BTOXGR == "-1" ~ "1",
      BTOXGR == "-2" ~ "2",
      BTOXGR == "-3" ~ "3",
      BTOXGR == "-4" ~ "4",
      BTOXGR == "1" ~ "<Missing>",
      BTOXGR == "2" ~ "<Missing>",
      BTOXGR == "3" ~ "<Missing>",
      BTOXGR == "4" ~ "<Missing>"
    ))) %>%
    dplyr::mutate(BTOXGRH = factor(dplyr::case_when(
      BTOXGR == "0" ~ "0",
      BTOXGR == "1" ~ "1",
      BTOXGR == "2" ~ "2",
      BTOXGR == "3" ~ "3",
      BTOXGR == "4" ~ "4",
      BTOXGR == "-1" ~ "<Missing>",
      BTOXGR == "-2" ~ "<Missing>",
      BTOXGR == "-3" ~ "<Missing>",
      BTOXGR == "-4" ~ "<Missing>",
    ))) %>%
    dplyr::mutate(ATOXGRL = factor(dplyr::case_when(
      ATOXGR == "0" ~ "0",
      ATOXGR == "-1" ~ "1",
      ATOXGR == "-2" ~ "2",
      ATOXGR == "-3" ~ "3",
      ATOXGR == "-4" ~ "4",
      ATOXGR == "1" ~ "<Missing>",
      ATOXGR == "2" ~ "<Missing>",
      ATOXGR == "3" ~ "<Missing>",
      ATOXGR == "4" ~ "<Missing>",
    ))) %>%
    dplyr::mutate(ATOXGRH = factor(dplyr::case_when(
      ATOXGR == "0" ~ "0",
      ATOXGR == "1" ~ "1",
      ATOXGR == "2" ~ "2",
      ATOXGR == "3" ~ "3",
      ATOXGR == "4" ~ "4",
      ATOXGR == "-1" ~ "<Missing>",
      ATOXGR == "-2" ~ "<Missing>",
      ATOXGR == "-3" ~ "<Missing>",
      ATOXGR == "-4" ~ "<Missing>",
    ))) %>%
    var_relabel(
      STUDYID = attr(ADSL$STUDYID, "label"),
      USUBJID = attr(ADSL$USUBJID, "label")
    )

  # High and low descriptions of the different PARAMCD values
  # This is currently hard coded as the GDSR does not have these descriptions yet
  grade_lookup <- tibble::tribble(
    ~PARAMCD, ~ATOXDSCL, ~ATOXDSCH,
    "ALB", "Hypoalbuminemia", NA_character_,
    "ALKPH", NA_character_, "Alkaline phosphatase increased",
    "ALT", NA_character_, "Alanine aminotransferase increased",
    "AST", NA_character_, "Aspartate aminotransferase increased",
    "BILI", NA_character_, "Blood bilirubin increased",
    "CA", "Hypocalcemia", "Hypercalcemia",
    "CHOLES", NA_character_, "Cholesterol high",
    "CK", NA_character_, "CPK increased",
    "CREAT", NA_character_, "Creatinine increased",
    "CRP", NA_character_, "C reactive protein increased",
    "GGT", NA_character_, "GGT increased",
    "GLUC", "Hypoglycemia", "Hyperglycemia",
    "HGB", "Anemia", "Hemoglobin increased",
    "IGA", NA_character_, "Immunoglobulin A increased",
    "POTAS", "Hypokalemia", "Hyperkalemia",
    "LYMPH", "CD4 lymphocytes decreased", NA_character_,
    "PHOS", "Hypophosphatemia", NA_character_,
    "PLAT", "Platelet count decreased", NA_character_,
    "SODIUM", "Hyponatremia", "Hypernatremia",
    "WBC", "White blood cell decreased", "Leukocytosis",
  )

  # merge grade_lookup onto ADLB
  ADLB <- dplyr::left_join(ADLB, grade_lookup, by = "PARAMCD")

  ADLB <- var_relabel(
    ADLB,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add LB date and study day variables
  ADLB <- dplyr::inner_join(
    ADLB,
    ADSL,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(TRTENDT = lubridate::date(dplyr::case_when(
      is.na(TRTEDTM) ~ lubridate::floor_date(lubridate::date(TRTSDTM) + study_duration_secs, unit = "day"),
      TRUE ~ TRTEDTM
    ))) %>%
    dplyr::ungroup()

  ADLB <- ADLB %>%
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

  ADLB <- ADLB %>%
    dplyr::mutate(ASPID = sample(seq_len(dplyr::n()))) %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(LBSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = LBSEQ) %>%
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
      LBSEQ,
      ASPID
    )

  ADLB <- ADLB %>% dplyr::mutate(ONTRTFL = factor(dplyr::case_when(
    !AVISIT %in% c("SCREENING", "BASELINE") ~ "Y",
    TRUE ~ ""
  )))

  flag_variables <- function(data,
                             apply_grouping,
                             apply_filter,
                             apply_mutate) {
    data_compare <- data %>%
      dplyr::mutate(row_check = seq_len(nrow(data)))

    data <- data_compare %>%
      {
        if (apply_grouping == TRUE) {
          dplyr::group_by(., USUBJID, PARAMCD, BASETYPE, AVISIT)
        } else {
          dplyr::group_by(., USUBJID, PARAMCD, BASETYPE)
        }
      } %>%
      dplyr::arrange(ADTM, ASPID, LBSEQ) %>%
      {
        if (apply_filter == TRUE) {
          dplyr::filter(
            .,
            (AVISIT != "BASELINE" & AVISIT != "SCREENING") &
              (ONTRTFL == "Y" | ADTM <= TRTSDTM)
          ) %>%
            dplyr::filter(ATOXGR == max(as.numeric(as.character(ATOXGR))))
        } else if (apply_filter == FALSE) {
          dplyr::filter(
            .,
            (AVISIT != "BASELINE" & AVISIT != "SCREENING") &
              (ONTRTFL == "Y" | ADTM <= TRTSDTM)
          ) %>%
            dplyr::filter(ATOXGR == min(as.numeric(as.character(ATOXGR))))
        } else {
          dplyr::filter(
            .,
            AVAL == min(AVAL) &
              (AVISIT != "BASELINE" & AVISIT != "SCREENING") &
              (ONTRTFL == "Y" | ADTM <= TRTSDTM)
          )
        }
      } %>%
      dplyr::slice(1) %>%
      {
        if (apply_mutate == TRUE) {
          dplyr::mutate(., new_var = ifelse(is.na(DTYPE), "Y", ""))
        } else {
          dplyr::mutate(., new_var = ifelse(is.na(AVAL) == FALSE & is.na(DTYPE), "Y", ""))
        }
      } %>%
      dplyr::ungroup()

    data_compare$new_var <- ifelse(data_compare$row_check %in% data$row_check, "Y", "")

    data_compare <- data_compare[, -which(names(data_compare) %in% c("row_check"))]

    return(data_compare)
  }

  ADLB <- flag_variables(ADLB, TRUE, "ELSE", FALSE) %>% dplyr::rename(WORS01FL = "new_var")
  ADLB <- flag_variables(ADLB, FALSE, TRUE, TRUE) %>% dplyr::rename(WGRHIFL = "new_var")
  ADLB <- flag_variables(ADLB, FALSE, FALSE, TRUE) %>% dplyr::rename(WGRLOFL = "new_var")
  ADLB <- flag_variables(ADLB, TRUE, TRUE, TRUE) %>% dplyr::rename(WGRHIVFL = "new_var")
  ADLB <- flag_variables(ADLB, TRUE, FALSE, TRUE) %>% dplyr::rename(WGRLOVFL = "new_var")

  ADLB <- ADLB %>% dplyr::mutate(ANL01FL = ifelse(
    (ABLFL == "Y" | (WORS01FL == "Y" & is.na(DTYPE))) &
      (AVISIT != "SCREENING"),
    "Y",
    ""
  ))

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADLB <- mutate_na(ds = ADLB, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata

  ADLB <- apply_metadata(ADLB, "metadata/ADLB.yml")

  return(ADLB)
}
