#' EORTC QLQ-C30 V3 Analysis Dataset (ADQLQC)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating a random EORTC QLQ-C30 V3 Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details
#'
#' Keys: `STUDYID`, `USUBJID`, `PARCAT1N`, `PARAMCD`, `BASETYPE`, `AVISITN`, `ATPTN`, `ADTM`, `QSSEQ`
#'
#' @inheritParams argument_convention
#' @param percent (`numeric`)\cr Completion - Completed at least y percent of questions, 1 record per visit
#' @param number (`numeric`)\cr Completion - Completed at least x question(s), 1 record per visit
#' @template param_cached
#' @templateVar data adqlqc
#'
#' @return `data.frame`
#' @export
#'
#' @examples
#' adsl <- radsl(N = 10, study_duration = 2, seed = 1)
#'
#' adqlqc <- radqlqc(adsl, seed = 1, percent = 80, number = 2)
#' adqlqc
radqlqc <- function(adsl,
                    percent,
                    number,
                    seed = NULL,
                    cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadqlqc"))
  }

  checkmate::assert_data_frame(adsl)
  checkmate::assert_number(percent, lower = 1, upper = 100)
  checkmate::assert_number(number, lower = 1)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  # ADQLQC data -------------------------------------------------------------
  qs <- get_qs_data(adsl, n_assessments = 5L, seed = seed, na_percentage = 0.1)
  # prepare ADaM ADQLQC data
  adqlqc1 <- prep_adqlqc(df = qs)
  # derive AVAL and AVALC
  adqlqc1 <- mutate(
    adqlqc1,
    AVAL = as.numeric(QSSTRESC),
    AVALC = case_when(
      QSTESTCD == "QSALL" ~ QSREASND,
      TRUE ~ QSORRES
    ),
    AVISIT = VISIT,
    AVISITN = VISITNUM,
    ADTM = QSDTC
  )
  # include scale calculation
  adqlqc_tmp <- calc_scales(adqlqc1, ex028)
  # order to prepare for change from screening and baseline values
  adqlqc_tmp <- adqlqc_tmp[order(adqlqc_tmp$STUDYID, adqlqc_tmp$USUBJID, adqlqc_tmp$PARAMCD, adqlqc_tmp$AVISITN), ]

  adqlqc_tmp <- Reduce(
    rbind,
    lapply(
      split(adqlqc_tmp, adqlqc_tmp$USUBJID),
      function(x) {
        x$STUDYID <- adsl$STUDYID[which(adsl$USUBJID == x$USUBJID[1])]
        x$ABLFL2 <- ifelse(x$AVISIT == "SCREENING", "Y", "")
        x$ABLFL <- ifelse(
          x$AVISIT == "BASELINE" &
            x$PARAMCD != "EX028",
          "Y",
          ifelse(
            x$AVISIT == "CYCLE 1 DAY 1" &
              x$PARAMCD != "EX028",
            "Y",
            ""
          )
        )
        x
      }
    )
  )

  adqlqc_tmp$BASE2 <- ifelse(
    str_detect(adqlqc_tmp$PARCAT2, "Completion", negate = TRUE),
    retain(
      df = adqlqc_tmp,
      value_var = adqlqc_tmp$AVAL,
      event = adqlqc_tmp$ABLFL2 == "Y"
    ),
    NA
  )

  adqlqc_tmp$BASE <- ifelse(
    adqlqc_tmp$ABLFL2 != "Y" &
      str_detect(adqlqc_tmp$PARCAT2, "Completion", negate = TRUE),
    retain(
      adqlqc_tmp,
      adqlqc_tmp$AVAL,
      adqlqc_tmp$ABLFL == "Y"
    ),
    NA
  )

  adqlqc_tmp <- adqlqc_tmp %>%
    dplyr::mutate(CHG2 = AVAL - BASE2) %>%
    dplyr::mutate(PCHG2 = 100 * (CHG2 / BASE2)) %>%
    dplyr::mutate(CHG = AVAL - BASE) %>%
    dplyr::mutate(PCHG = 100 * (CHG / BASE)) %>%
    rcd_var_relabel(
      STUDYID = attr(adsl$STUDYID, "label"),
      USUBJID = attr(adsl$USUBJID, "label")
    )
  # derive CHGCAT1 ----------------------------------------------------------
  adqlqc_tmp <- derv_chgcat1(dataset = adqlqc_tmp)

  adqlqc_tmp <- rcd_var_relabel(
    adqlqc_tmp,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  adqlqc_tmp <- arrange(
    adqlqc_tmp,
    USUBJID,
    AVISITN
  )
  # Merge ADSL --------------------------------------------------------------
  # ADSL variables needed for ADQLQC
  adsl_vars <- c(
    "STUDYID", "USUBJID", "SUBJID", "SITEID", "REGION1", "COUNTRY", "ETHNIC", "AGE",
    "AGEU", "AAGE", "AAGEU", "AGEGR1", "AGEGR2", "AGEGR3", "STRATwNM", "STRATw", "STRATwV",
    "SEX", "RACE", "ITTFL", "SAFFL", "PPROTFL", "TRT01P", "TRT01A",
    "TRTSEQP", "TRTSEQA", "TRTSDTM", "TRTSDT", "TRTEDTM", "TRTEDT", "DCUTDT"
  )
  adsl <- select(
    adsl,
    any_of(adsl_vars)
  )
  adqlqc <- dplyr::inner_join(
    adqlqc_tmp,
    adsl,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::mutate(
      ADY_der = ceiling(difftime(ADTM, TRTSDTM, units = "days")),
      ADY = case_when(
        ADY_der >= 0 ~ ADY_der + 1,
        TRUE ~ ADY_der
      )
    ) %>%
    select(-ADY_der)

  # get compliance data ---------------------------------------------------
  compliance_data <- comp_derv(
    dataset = adqlqc,
    percent = percent,
    number = number
  )
  # add ADSL variables
  compliance_data <- left_join(
    compliance_data,
    adsl,
    by = c("STUDYID", "USUBJID")
  )
  # add completion to ADQLQC
  adqlqc <- bind_rows(
    adqlqc,
    compliance_data
  ) %>%
    arrange(
      USUBJID,
      AVISITN,
      QSTESTCD
    )
  # find first set of questionnaire observations
  adqlqc_x <- arrange(
    adqlqc,
    USUBJID,
    ADTM
  ) %>%
    filter(
      PARAMCD != "QSALL" &
        !str_detect(AVISIT, "SCREENING|UNSCHEDULED")
    ) %>%
    group_by(
      USUBJID,
      ADTM
    ) %>%
    summarise(first_date = first(ADTM), .groups = "drop")

  adqlqc <- left_join(
    adqlqc,
    adqlqc_x,
    by = c("USUBJID", "ADTM")
  ) %>%
    mutate(
      ANL01FL = case_when(
        PARAMCD != "QSALL" & ABLFL == "Y" ~ "Y",
        PARAMCD != "QSALL" &
          !str_detect(AVISIT, "UNSCHEDULED") &
          !is.na(first_date) ~ "Y"
      )
    ) %>%
    select(-first_date)

  # final dataset -----------------------------------------------------------
  adqlqc_final <- adqlqc %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(ASEQ = row_number()) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      STUDYID,
      USUBJID,
      AVISITN
    ) %>%
    select(
      -c("BASE2", "CHG2", "PCHG2", "ABLFL2")
    ) %>%
    ungroup()

  adam_vars <- c(
    adsl_vars, "QSSEQ", "QSCAT", "QSSCAT", "QSDTC", "QSSPID", "QSSTAT", "QSSTRESN",
    "QSSTRESC", "QSSTRESU", "QSORRES", "QSORRESU", "QSTEST", "QSTESTCD", "QSTPT",
    "QSTPTNUM", "QSTPTREF", "QSDY", "QSREASND", "QSTSTDTL", "QSEVAL", "VISIT", "VISITNUM",
    "PARAM", "PARAMCD", "PARCAT1", "PARCAT1N", "PARCAT2", "AVAL", "AVALC", "AREASND",
    "BASE", "BASETYPE", "ABLFL", "CHG", "PCHG", "CHGCAT1", "CRIT1", "CRIT1FL", "DTYPE",
    "ADTM", "ADT", "ADY", "ADTF", "ATMF", "ATPT", "ATPTN", "AVISIT", "AVISITN", "APHASE",
    "APHASEN", "APERIOD", "APERIODC", "APERIODC", "ASPER", "ASPERC", "PERADY", "TRTP",
    "TRTA", "ONTRTFL", "LAST02FL", "FIRS02FL", "ANL01FL", "ANL02FL", "ANL03FL",
    "ANL04FL", "CGCAT1NX"
  )
  # order variables in mapped qs by variables in adam_vars
  adqlqc_name_ordered <- names(adqlqc_final)[order(match(names(adqlqc_final), adam_vars))]
  # adqlqc with variables ordered per gdsr
  adqlqc_final <- adqlqc_final %>%
    select(
      any_of(adqlqc_name_ordered)
    )

  adqlqc_final <- relocate(adqlqc_final, "QSEVLINT", .after = "QSTESTCD") %>%
    arrange(
      USUBJID,
      AVISITN,
      ASEQ,
      QSTESTCD
    )
  # apply metadata
  adqlqc_final <- apply_metadata(adqlqc_final, "metadata/ADQLQC.yml")
  return(adqlqc_final)
}

#' Helper Functions for Constructing ADQLQC
#'
#' Internal functions used by `radqlqc`.
#'
#' @inheritParams argument_convention
#' @inheritParams radqlqc
#'
#' @examples
#' adsl <- radsl(N = 10, study_duration = 2, seed = 1)
#' adqlqc <- radqlqc(adsl, seed = 1, percent = 80, number = 2)
#'
#' @name h_adqlqc
NULL

#' @describeIn h_adqlqc Questionnaires EORTC QLQ-C30 V3.0 SDTM (QS)
#'
#' Function for generating random Questionnaires SDTM domain
#'
#' @return a dataframe with SDTM questionnaire data
#' @keywords internal
get_qs_data <- function(adsl,
                        visit_format = "CYCLE",
                        n_assessments = 5L,
                        n_days = 1L,
                        lookup = NULL,
                        seed = NULL,
                        na_percentage = 0,
                        na_vars = list(
                          QSORRES = c(1234, 0.2),
                          QSSTRESC = c(1234, 0.2)
                        )) {
  load(system.file("sysdata.rda", package = "random.cdisc.data"))
  checkmate::assert_string(visit_format)
  checkmate::assert_integer(n_assessments, len = 1, any.missing = FALSE)
  checkmate::assert_integer(n_days, len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1, na.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  # get subjects for QS data from ADSL
  # get studyid, subject for QS generation
  qs <- select(
    adsl,
    STUDYID,
    USUBJID
  ) %>%
    mutate(
      DOMAIN = "QS"
    )

  # QS prep -----------------------------------------------------------------
  # get questionnaire function for QS
  # QSTESTCD: EOR0101 to EOR0130
  eortc_qlq_c30_sub <- filter(
    eortc_qlq_c30,
    as.numeric(str_extract(QSTESTCD, "\\d+$")) >= 101 &
      as.numeric(str_extract(QSTESTCD, "\\d+$")) <= 130
  ) %>%
    select(-publication_name)

  # validate and initialize QSTEST vectors
  qstest_init_list <- relvar_init(
    unique(eortc_qlq_c30_sub$QSTEST),
    unique(eortc_qlq_c30_sub$QSTESTCD)
  )

  if (!is.null(seed)) {
    set.seed(seed)
  }

  checkmate::assert_data_frame(lookup, null.ok = TRUE)

  lookup_qs <- if (!is.null(lookup)) {
    lookup
  } else {
    expand.grid(
      STUDYID = unique(qs$STUDYID),
      USUBJID = qs$USUBJID,
      QSTEST = qstest_init_list$relvar1,
      VISIT = visit_schedule(
        visit_format = visit_format,
        n_assessments = n_assessments,
        n_days = n_days
      ),
      stringsAsFactors = FALSE
    )
  }

  # assign related variable values: QSTESTxQSTESTCD are related
  lookup_qs <- lookup_qs %>% rel_var(
    var_name = "QSTESTCD",
    related_var = "QSTEST",
    var_values = qstest_init_list$relvar2
  )

  lookup_qs <- left_join(
    lookup_qs,
    eortc_qlq_c30_sub,
    by = c(
      "QSTEST",
      "QSTESTCD"
    ),
    multiple = "all",
    relationship = "many-to-many"
  )

  lookup_qs <- dplyr::mutate(
    lookup_qs,
    VISITNUM = dplyr::case_when(
      VISIT == "SCREENING" ~ -1,
      VISIT == "BASELINE" ~ 0,
      (grepl("^WEEK", VISIT) | grepl("^CYCLE", VISIT)) ~ as.numeric(VISIT) - 2,
      TRUE ~ NA_real_
    )
  ) %>% arrange(USUBJID)

  # # prep QSALL --------------------------------------------------------------
  # get last subject and visit for QSALL
  last_subj_vis <- select(lookup_qs, USUBJID, VISIT) %>%
    distinct() %>%
    slice(n())
  last_subj_vis_full <- filter(
    lookup_qs,
    USUBJID == last_subj_vis$USUBJID,
    VISIT == last_subj_vis$VISIT
  )

  qsall_data1 <- tibble::tibble(
    STUDYID = unique(last_subj_vis_full$STUDYID),
    USUBJID = unique(last_subj_vis_full$USUBJID),
    VISIT = unique(last_subj_vis_full$VISIT),
    VISITNUM = unique(last_subj_vis_full$VISITNUM),
    QSTESTCD = "QSALL",
    QSTEST = "Questionnaires",
    QSSTAT = "NOT DONE",
    QSREASND = "SUBJECT REFUSED"
  )

  # remove last subject and visit from main data
  lookup_qs_sub <- anti_join(
    lookup_qs,
    last_subj_vis_full,
    by = c("USUBJID", "VISIT")
  )

  set.seed(seed)
  lookup_qs_sub_x <- lookup_qs_sub %>%
    group_by(
      USUBJID,
      QSTESTCD,
      VISIT
    ) %>%
    slice_sample(n = 1) %>%
    ungroup() %>%
    as.data.frame()

  lookup_qs_sub_x <- arrange(
    lookup_qs_sub_x,
    USUBJID,
    VISITNUM
  )

  # add date: QSDTC ---------------------------------------------------------
  # get treatment dates from ADSL
  adsl_trt <- select(
    adsl,
    USUBJID,
    TRTSDTM,
    TRTEDTM
  )
  # use to derive QSDTC
  # if no treatment end date, create an arbituary one
  trt_end_date <- max(adsl_trt$TRTEDTM, na.rm = TRUE)

  lookup_qs_sub_x <- left_join(
    lookup_qs_sub_x,
    adsl_trt,
    by = "USUBJID"
  ) %>%
    group_by(
      USUBJID
    ) %>%
    mutate(QSDTC = get_random_dates_between(
      from = TRTSDTM,
      to = ifelse(
        is.na(TRTEDTM),
        trt_end_date,
        TRTEDTM
      ),
      visit_id = VISITNUM
    )) %>%
    select(-c("TRTSDTM", "TRTEDTM"))

  # filter out subjects with missing dates
  lookup_qs_sub_x1 <- filter(
    lookup_qs_sub_x,
    !is.na(QSDTC)
  )

  # subjects with missing dates
  lookup_qs_sub_x2 <- filter(
    lookup_qs_sub_x,
    is.na(QSDTC)
  ) %>%
    select(
      STUDYID,
      USUBJID,
      VISIT,
      VISITNUM
    ) %>%
    distinct()

  # generate QSALL for subjects with missing dates
  qsall_data2 <- mutate(
    lookup_qs_sub_x2,
    QSTESTCD = "QSALL",
    QSTEST = "Questionnaires",
    QSSTAT = "NOT DONE",
    QSREASND = "SUBJECT REFUSED"
  )

  # add qsall data to original item data
  lookup_qs_sub_all <- bind_rows(
    lookup_qs_sub_x1,
    qsall_data1,
    qsall_data2
  )

  qs_all <- lookup_qs_sub_all %>%
    arrange(
      STUDYID,
      USUBJID,
      VISITNUM
    ) %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::ungroup()

  # get first and second subject ids
  first_second_subj <- select(qs_all, USUBJID) %>%
    distinct() %>%
    slice(1:2)

  qs1 <- filter(
    qs_all,
    USUBJID %in% first_second_subj$USUBJID
  )

  if (length(na_vars) > 0 && na_percentage > 0) {
    qs1 <- mutate_na(ds = qs1, na_vars = na_vars, na_percentage = na_percentage)
  }

  # QSSTAT = NOT DONE
  qs1 <- mutate(
    qs1,
    QSSTAT = case_when(
      is.na(QSORRES) & is.na(QSSTRESC) ~ "NOT DONE"
    )
  )

  # remove first and second subjects from main data
  qs2 <- anti_join(
    qs_all,
    qs1,
    by = c("USUBJID")
  )

  final_qs <- rbind(
    qs1,
    qs2
  ) %>%
    group_by(USUBJID) %>%
    dplyr::mutate(QSSEQ = row_number()) %>%
    arrange(
      STUDYID,
      USUBJID,
      VISITNUM
    ) %>%
    ungroup()

  # ordered variables as per gdsr
  final_qs <- select(
    final_qs,
    STUDYID,
    USUBJID,
    QSSEQ,
    QSTESTCD,
    QSTEST,
    QSCAT,
    QSSCAT,
    QSORRES,
    QSORRESU,
    QSSTRESC,
    QSSTRESU,
    QSSTAT,
    QSREASND,
    VISITNUM,
    VISIT,
    QSDTC,
    QSEVLINT
  )
  return(final_qs)
}

#' @describeIn h_adqlqc Function for generating random dates between 2 dates
#'
#' @param from (`datetime vector`)\cr Start date/times.
#' @param to (`datetime vector`)\cr End date/times.
#' @param visit_id (`vector`)\cr Visit identifiers.
#'
#' @return Data frame with new randomly generated dates variable.
#' @keywords internal
get_random_dates_between <- function(from, to, visit_id) {
  min_date <- min(lubridate::as_datetime(from), na.rm = TRUE)
  max_date <- max(lubridate::as_datetime(to), na.rm = TRUE)
  date_seq <- seq(from = min_date + lubridate::days(1), to = max_date, by = "28 days")

  visit_ids <- unique(visit_id)
  out <- sapply(visit_ids, simplify = TRUE, USE.NAMES = TRUE, FUN = function(x) {
    if (x == -1) {
      random_days_to_subtract <- lubridate::days(sample(1:10, size = 1))
      min_date - random_days_to_subtract
    } else if (x == 0) {
      min_date
    } else if (x > 0) {
      if (x %in% seq_along(date_seq)) {
        date_seq[[x]]
      } else {
        NA
      }
    }
  })
  lubridate::as_datetime(out[match(visit_id, visit_ids)])
}

#' @describeIn h_adqlqc Prepare ADaM ADQLQC data, adding PARAMCD to SDTM QS data
#'
#' @param df (`data.frame`)\cr SDTM QS dataset.
#'
#' @return `data.frame`
#' @keywords internal
prep_adqlqc <- function(df) {
  # create PARAMCD from QSTESTCD
  adqlqc <- dplyr::mutate(
    df,
    PARAMCD = case_when(
      QSTESTCD == "EOR0101" ~ "QS02801",
      QSTESTCD == "EOR0102" ~ "QS02802",
      QSTESTCD == "EOR0103" ~ "QS02803",
      QSTESTCD == "EOR0104" ~ "QS02804",
      QSTESTCD == "EOR0105" ~ "QS02805",
      QSTESTCD == "EOR0106" ~ "QS02806",
      QSTESTCD == "EOR0107" ~ "QS02807",
      QSTESTCD == "EOR0108" ~ "QS02808",
      QSTESTCD == "EOR0109" ~ "QS02809",
      QSTESTCD == "EOR0110" ~ "QS02810",
      QSTESTCD == "EOR0111" ~ "QS02811",
      QSTESTCD == "EOR0112" ~ "QS02812",
      QSTESTCD == "EOR0113" ~ "QS02813",
      QSTESTCD == "EOR0114" ~ "QS02814",
      QSTESTCD == "EOR0115" ~ "QS02815",
      QSTESTCD == "EOR0116" ~ "QS02816",
      QSTESTCD == "EOR0117" ~ "QS02817",
      QSTESTCD == "EOR0118" ~ "QS02818",
      QSTESTCD == "EOR0119" ~ "QS02819",
      QSTESTCD == "EOR0120" ~ "QS02820",
      QSTESTCD == "EOR0121" ~ "QS02821",
      QSTESTCD == "EOR0122" ~ "QS02822",
      QSTESTCD == "EOR0123" ~ "QS02823",
      QSTESTCD == "EOR0124" ~ "QS02824",
      QSTESTCD == "EOR0125" ~ "QS02825",
      QSTESTCD == "EOR0126" ~ "QS02826",
      QSTESTCD == "EOR0127" ~ "QS02827",
      QSTESTCD == "EOR0128" ~ "QS02828",
      QSTESTCD == "EOR0129" ~ "QS02829",
      QSTESTCD == "EOR0130" ~ "QS02830",
      TRUE ~ QSTESTCD
    )
  )
  load(system.file("sysdata.rda", package = "random.cdisc.data"))
  adqlqc1 <- dplyr::left_join(
    adqlqc,
    gdsr_param_adqlqc,
    by = "PARAMCD"
  )
  return(adqlqc1)
}

#' @describeIn h_adqlqc derive EX028
#'
#' @return `data.frame`
#' @keywords internal
#'
#' @examples
get_ex028 <- function(adsl) {
  # https://rochewiki.roche.com/confluence/pages/viewpage.action?spaceKey=GDSO&title=ADQLQC
  # EX028
  # start with the cartesian (i.e. outer) product of all possible combinations of
  # subjects (ADSL.USUBJID) and protocol-defined visits (TV-domain)

  # If questionnaire data is collected by an ePRO-device,
  # a list of possible assessments will usually have to be created manually
  # by the statistical programmer.

  # common scenarios, why a subject wasn't expected to complete a questionnaire, are:
  # Questionnaires aren't to be completed at the specific visit (e.g. ADQLQC.AVISIT has a certain value).
  # The subject hasn't reached the visit yet (e.g. ADQLQC.AVISIT is greater than the last visit present in the SV-domain for this subject).
  # The subject switched to the follow-up period after disease progression
  # (e.g. ADQLQC.AVISIT is not a follow-up visit and is greater than the last non-follow-up visit present in the SV-domain for this subject).
  # The subject died (e.g. ADSL.DTHDT is not missing and the difference between ADSL.DTHDT and ADSL.TRTSDT is less than the study day at
  # which the visit should have occurred).
  # The subject discontinued from the study (e.g. ADSL.EOSDT is not missing and the difference between ADSL.EOSDT and ADSL.TRTSDT is less
  # than the study day at which the visit should have occurred).
  # The above list is not complete. The study protocol must be consulted and the derivations must be chosen in a way to accurately reflect the protocol.
  # The details of the derivation have to be documented in the DAP M3.

  # using ADSL
  adsl_subj <- select(
    adsl,
    USUBJID,
    TRTSDTM,
    EOSDT,
    EOSSTT,
    DCSREAS,
    DTHDT
  )

  # We are not fully following the creation of 'expected' visit metadata due to the data limitation.
  # using visits from QS (should use TV or SV)
  # select VISIT, VISITNUM only
  qs <- get_qs_data(adsl, n_assessments = 5L, seed = 1, na_percentage = 0.1)
  qs_sub <- select(
    qs,
    STUDYID,
    VISIT,
    VISITNUM
  ) %>%
    distinct()
  # cartesian product of subjects and visits
  subj_vis <- crossing(
    adsl_subj,
    qs_sub
  ) %>%
    # bring in QSDTC from QS
    left_join(
      select(
        qs,
        STUDYID,
        USUBJID,
        VISIT,
        VISITNUM,
        QSDTC,
        QSREASND
      ) %>%
        distinct(),
      by = c("STUDYID","USUBJID", "VISIT", "VISITNUM")
    )
  # evaluate each combination to see if a subject is expected to complete a
  # questionnaire at the specific visit or not.
  # start with AVAL = 1
  subj_vis_param <- mutate(
    subj_vis,
    PARAMCD = "EX028",
    AVAL = 1
  )
  # Look for a reason why subject wasn't expected to complete a question i.e.
  # switch to AVAL = 0, if a certain condition is met.
  subj_vis_param2 <- mutate(
    subj_vis_param,
    AVAL = case_when(
      EOSSTT == "DISCONTINUED" & is.na(QSDTC) ~ 0,
      EOSSTT == "ONGOING" & is.na(QSDTC) & !is.na(QSREASND) ~ 0,
      TRUE ~ AVAL
    ),
    AVALC = case_when(
      AVAL == 0 ~ "Not expected to complete questionnaire",
      AVAL == 1 ~ "Expected to complete questionnaire"
    ),
    AREASND = case_when(
      is.na(QSDTC) & !is.na(DCSREAS) ~ str_to_sentence(DCSREAS),
      is.na(QSDTC) & is.na(DCSREAS) ~ str_to_sentence(QSREASND),
      is.na(QSDTC) & is.na(DCSREAS) & is.na(QSREASND) ~ "Visit not reached"
    )
  )
  # select only required variables
  subj_vis_param3 <- select(
    subj_vis_param2,
    STUDYID,
    USUBJID,
    VISITNUM,
    VISIT,
    PARAMCD,
    AVISITN = VISITNUM,
    AVISIT = VISIT,
    AVAL,
    AVALC,
    AREASND
  )

  load(system.file("sysdata.rda", package = "random.cdisc.data"))

  subj_vis_param4 <- left_join(
    subj_vis_param3,
    expect,
    by = c("PARAMCD")
  )

  return (subj_vis_param4)
}

#' @describeIn h_adqlqc Scale calculation for ADQLQC data
#'
#' @param adqlqc1 (`data.frame`)\cr Prepared data generated from the [prep_adqlqc()] function.
#' @param ex028 (`data.frame`)\cr Prepared data generated from the [get_ex028()] function.
#' @return `data.frame`
#' @keywords internal
calc_scales <- function(adqlqc1, ex028) {
  # Prep scale data ---------------------------------------------------------
  # parcat2 = scales or global health status
  # global health status/scales data
  # QSTESTCD: EOR0131 to EOR0145 (global health status and scales)
  load(system.file("sysdata.rda", package = "random.cdisc.data"))
  eortc_qlq_c30_sub <- filter(
    eortc_qlq_c30,
    !(as.numeric(str_extract(QSTESTCD, "\\d+$")) >= 101 & as.numeric(str_extract(QSTESTCD, "\\d+$")) <= 130)
  ) %>%
    mutate(
      PARAMCD = case_when(
        QSTESTCD == "EOR0131" ~ "QS028QL2",
        QSTESTCD == "EOR0132" ~ "QS028PF2",
        QSTESTCD == "EOR0133" ~ "QS028RF2",
        QSTESTCD == "EOR0134" ~ "QS028EF",
        QSTESTCD == "EOR0135" ~ "QS028CF",
        QSTESTCD == "EOR0136" ~ "QS028SF",
        QSTESTCD == "EOR0137" ~ "QS028FA",
        QSTESTCD == "EOR0138" ~ "QS028NV",
        QSTESTCD == "EOR0139" ~ "QS028PA",
        QSTESTCD == "EOR0140" ~ "QS028DY",
        QSTESTCD == "EOR0141" ~ "QS028SL",
        QSTESTCD == "EOR0142" ~ "QS028AP",
        QSTESTCD == "EOR0143" ~ "QS028CO",
        QSTESTCD == "EOR0144" ~ "QS028DI",
        QSTESTCD == "EOR0145" ~ "QS028FI",
        TRUE ~ QSTESTCD
      )
    ) %>%
    select(-publication_name)

  # ADaM global health status and scales from gdsr
  gdsr_param_adqlqc <- gdsr_param_adqlqc %>%
    filter(
      !str_detect(PARCAT2, "Original Items|Completion")
    )

  ghs_scales <- left_join(
    eortc_qlq_c30_sub,
    gdsr_param_adqlqc,
    by = "PARAMCD"
  )
  # scale data
  df <- data.frame(index = seq_len(nrow(ghs_scales)))
  df$previous <- list(
    c("QS02826", "QS02827"),
    c("QS02811"),
    c("QS02810", "QS02812", "QS02818"),
    c("QS02806", "QS02807"),
    c("QS02814", "QS02815"),
    c("QS02808"),
    c("QS02817"),
    c("QS02816"),
    c("QS02821", "QS02822", "QS02823", "QS02824"),
    c("QS02829", "QS02830"),
    c("QS02813"),
    c("QS02801", "QS02802", "QS02803", "QS02804", "QS02805"),
    c("QS02809", "QS02819"),
    c("QS02820", "QS02825"),
    c("QS02828")
  )
  df$newName <- list(
    "QS028SF",
    "QS028SL",
    "QS028FA",
    "QS028RF2",
    "QS028NV",
    "QS028DY",
    "QS028DI",
    "QS028CO",
    "QS028EF",
    "QS028QL2",
    "QS028AP",
    "QS028PF2",
    "QS028PA",
    "QS028CF",
    "QS028FI"
  )
  df$newNamelabel <- list(
    "EORTC QLQ-C30: Social functioning",
    "EORTC QLQ-C30: Insomnia",
    "EORTC QLQ-C30: Fatigue",
    "EORTC QLQ-C30: Role functioning (revised)",
    "EORTC QLQ-C30: Nausea and vomiting",
    "EORTC QLQ-C30: Dyspnoea",
    "EORTC QLQ-C30: Diarrhoea",
    "EORTC QLQ-C30: Constipation",
    "EORTC QLQ-C30: Emotional functioning",
    "EORTC QLQ-C30: Global health status/QoL (revised)",
    "EORTC QLQ-C30: Appetite loss",
    "EORTC QLQ-C30: Physical functioning (revised)",
    "EORTC QLQ-C30: Pain",
    "EORTC QLQ-C30: Cognitive functioning",
    "EORTC QLQ-C30: Financial difficulties"
  )
  df$newNameCategory <- list(
    "Functional Scales",
    "Symptom Scales",
    "Symptom Scales",
    "Functional Scales",
    "Symptom Scales",
    "Symptom Scales",
    "Symptom Scales",
    "Symptom Scales",
    "Functional Scales",
    "Global Health Status",
    "Symptom Scales",
    "Functional Scales",
    "Symptom Scales",
    "Functional Scales",
    "Symptom Scales"
  )
  df$num_param <- list(
    "1",
    "1",
    "2",
    "1",
    "1",
    "1",
    "1",
    "1",
    "2",
    "1",
    "1",
    "3",
    "1",
    "1",
    "1"
  )
  df$equation <- list(
    "new_value = (1 - ((temp_val/var_length)-1)/3)*100.0",
    "new_value = ((temp_val/var_length-1)/3)*100.0",
    "new_value = ((temp_val/var_length-1)/3)*100.0",
    "new_value = (1 - ((temp_val/var_length)-1)/3)*100.0",
    "new_value = ((temp_val/var_length-1)/3)*100.0",
    "new_value = ((temp_val/var_length-1)/3)*100.0",
    "new_value = ((temp_val/var_length-1)/3)*100.0",
    "new_value = ((temp_val/var_length-1)/3)*100.0",
    "new_value = (1 - ((temp_val/var_length)-1)/3)*100.0",
    "new_value = ((temp_val/var_length-1)/6)*100.0",
    "new_value = ((temp_val/var_length-1)/3)*100.0",
    "new_value = (1 - ((temp_val/var_length)-1)/3)*100.0",
    "new_value = ((temp_val/var_length-1)/3)*100.0",
    "new_value = (1 - ((temp_val/var_length)-1)/3)*100.0",
    "new_value = ((temp_val/var_length-1)/3)*100.0"
  )
  # ex028 data
  ex028 <- get_ex028()

  df_saved <- data.frame()

  unique_id <- unique(adqlqc1$USUBJID)

  for (id in unique_id) {
    id_data <- adqlqc1[adqlqc1$USUBJID == id, ]
    unique_avisit <- unique(id_data$AVISIT)
    for (visit in unique_avisit) {
      if (is.na(visit)) {
        if(ex028$AVAL == 1)
        next
      }
      id_data_at_visit <- id_data[id_data$AVISIT == visit, ]

      if (any(id_data_at_visit$PARAMCD != "QSALL")) {
        for (idx in seq_along(df$index)) {
          previous_names <- df$previous[idx]
          current_name <- df$newName[idx]
          current_name_label <- df$newNamelabel[idx]
          current_name_category <- df$newNameCategory[idx]
          eqn <- df$equation[idx]
          temp_val <- 0
          var_length <- 0
          for (param_name in previous_names[[1]]) {
            if (param_name %in% id_data_at_visit$PARAMCD) { ####
              current_val <- as.numeric(as.character(id_data_at_visit$AVAL[id_data_at_visit$PARAMCD == param_name]))
              if (!is.na(current_val)) {
                temp_val <- temp_val + current_val ###
                var_length <- var_length + 1
              }
            } # if
          } # param_name
          # eval
          if (var_length >= as.numeric(df$num_param[idx])) {
            eval(parse(text = eqn)) #####
          } else {
            new_value <- NA
          }

          new_data_row <- data.frame(
            study = str_extract(id, "[A-Z]+[0-9]+"),
            id,
            visit,
            id_data_at_visit$AVISITN[1],
            id_data_at_visit$QSDTC[1],
            current_name_category,
            current_name_label,
            current_name,
            new_value,
            NA,
            stringsAsFactors = FALSE
          )
          colnames(new_data_row) <- c(
            "STUDYID", "USUBJID", "AVISIT", "AVISITN",
            "ADTM", "PARCAT2", "PARAM", "PARAMCD",
            "AVAL", "AVALC"
          ) ###
          df_saved <- rbind(df_saved, new_data_row) #####
        } # idx
      }
    } # visit
  } # id

  df_saved1 <- left_join(
    df_saved,
    ghs_scales,
    by = c(
      "PARAM",
      "PARAMCD",
      "PARCAT2"
    )
  )

  adqlqc_tmp <- bind_rows(adqlqc1, df_saved1, ex028) %>%
    arrange(
      USUBJID,
      AVISITN,
      QSTESTCD
    )
  return(adqlqc_tmp)
}

#' @describeIn h_adqlqc Calculate Change from Baseline Category 1
#'
#' @param dataset (`data.frame`)\cr ADaM dataset.
#'
#' @return `data.frame`
#' @keywords internal
derv_chgcat1 <- function(dataset) {
  # derivation of CHGCAT1
  check_vars <- c("PARCAT2", "CHG")

  if (all(check_vars %in% names(dataset))) {
    dataset$CHGCAT1 <- ifelse(
      dataset$PARCAT2 == "Symptom Scales" & !is.na(dataset$CHG) & dataset$CHG <= -10,
      "Improved", ""
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARCAT2 == "Symptom Scales" & !is.na(dataset$CHG) & dataset$CHG >= 10,
      "Worsened", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARCAT2 == "Symptom Scales" &
        !is.na(dataset$CHG) & dataset$CHG > -10 &
        dataset$CHG < 10,
      "No change", dataset$CHGCAT1
    )

    dataset$CHGCAT1 <- ifelse(
      dataset$PARCAT2 %in% c("Functional Scales", "Global Health Status") &
        !is.na(dataset$CHG) & dataset$CHG >= 10,
      "Improved", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARCAT2 %in% c("Functional Scales", "Global Health Status") &
        !is.na(dataset$CHG) & dataset$CHG <= -10,
      "Worsened", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARCAT2 %in% c("Functional Scales", "Global Health Status") &
        !is.na(dataset$CHG) &
        dataset$CHG > -10 & dataset$CHG < 10,
      "No change", dataset$CHGCAT1
    )

    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 6,
      "Improved by six levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 5,
      "Improved by five levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 4,
      "Improved by four levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 3,
      "Improved by three levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 2,
      "Improved by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 1,
      "Improved by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 0,
      "No change", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == -1,
      "Worsened by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == -2,
      "Worsened by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == -3,
      "Worsened by three levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == -4,
      "Worsened by four levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == -5,
      "Worsened by five levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == -6,
      "Worsened by six levels", dataset$CHGCAT1
    )

    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == -3,
      "Improved by three levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == -2,
      "Improved by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == -1,
      "Improved by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == 0,
      "No change", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == 1,
      "Worsened by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == 2,
      "Worsened by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == 3,
      "Worsened by three levels", dataset$CHGCAT1
    )

    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD == "QS02801" & dataset$CHG == -3,
      "Improved by three levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD == "QS02801" & dataset$CHG == -2,
      "Improved by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD == "QS02801" & dataset$CHG == -1,
      "Improved by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD == "QS02801" & dataset$CHG == 0,
      "No changed", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD == "QS02801" & dataset$CHG == 1,
      "Worsened by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD == "QS02801" & dataset$CHG == 2,
      "Worsened by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD == "QS02801" & dataset$CHG == 3,
      "Worsened by three levels", dataset$CHGCAT1
    )

    paramcd_vec <- c(
      "QS02803", "QS02804", "QS02805", "QS02807", "QS02808", "QS02809", "QS02810",
      "QS02811", "QS02812", "QS02813", "QS02814", "QS02815", "QS02816", "QS02817",
      "QS02818", "QS02819", "QS02820", "QS02821", "QS02822", "QS02823", "QS02824",
      "QS02825", "QS02826", "QS02827", "QS02828"
    )

    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% paramcd_vec & dataset$CHG == -3,
      "Improved by three levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% paramcd_vec & dataset$CHG == -2,
      "Improved by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% paramcd_vec & dataset$CHG == -1,
      "Improved by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% paramcd_vec & dataset$CHG == 0,
      "No change", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% paramcd_vec & dataset$CHG == 1,
      "Worsened by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% paramcd_vec & dataset$CHG == 2,
      "Worsened by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(
      dataset$PARAMCD %in% paramcd_vec & dataset$CHG == 3,
      "Worsened by three levels", dataset$CHGCAT1
    )

    return(dataset)
  } else {
    collapse_vars <- paste(check_vars, collapse = ", ")
    stop(sprintf(
      "%s: one or both variables is/are missing, needed for derivation",
      collapse_vars
    ))
  }
}

#' @describeIn h_adqlqc Completion/Compliance Data Calculation
#'
#' @param dataset (`data.frame`)\cr Dataset.
#'
#' @return `data.frame`
#' @keywords internal
comp_derv <- function(dataset, percent, number) {
  # original items data
  orig_data <- filter(
    dataset,
    PARCAT2 == "Original Items"
  )
  # total number of questionnaires
  comp_count_all <- select(
    orig_data,
    PARAMCD
  ) %>%
    distinct() %>%
    count()
  comp_count_all <- comp_count_all$n
  # original items data count of questions answered
  orig_data_summ <- group_by(
    orig_data,
    STUDYID,
    USUBJID,
    PARCAT1,
    AVISIT,
    AVISITN,
    ADTM,
    ADY
  ) %>%
    summarise(
      comp_count = sum(!is.na(AVAL)),
      comp_count_all = comp_count_all,
      .groups = "drop"
    ) %>%
    mutate(
      per_comp = trunc((comp_count / comp_count_all) * 100)
    )
  # expected data
  ex028_data <- filter(
    dataset,
    PARAMCD == "EX028",
    AVAL == 1
  ) %>%
    select(
      STUDYID,
      USUBJID,
      PARCAT1,
      AVISIT,
      AVISITN,
      ADTM,
      ADY,
      AVAL_ex028 = AVAL
    ) %>%
    mutate(
      comp_count_all = comp_count_all
    )

  joined <- left_join(
    ex028_data,
    orig_data_summ,
    by = c(
      "STUDYID",
      "USUBJID",
      "PARCAT1",
      "AVISIT",
      "AVISITN",
      "comp_count_all"
    )
  ) %>%
    select(-c("ADTM.x", "ADY.x"))

  joined <- rename(
    joined,
    ADTM = ADTM.y,
    ADY = ADY.y
  )
  # CO028ALL
  co028all <- mutate(
    joined,
    PARAMCD = "CO028ALL",
    PARAM = "EORTC QLQ-C30: Completion - Completed all questions",
    PARCAT2 = "Completion",
    AVAL = case_when(
      AVAL_ex028 == 1 & comp_count == comp_count_all ~ 1,
      AVAL_ex028 == 1 & (is.na(comp_count) | comp_count < comp_count_all) ~ 0
    ),
    AVALC = case_when(
      AVAL == 1 ~ "Completed all questions",
      AVAL == 0 ~ "Did not complete all questions"
    )
  )
  # CO028<y>P
  co028p <- mutate(
    joined,
    PARAMCD = paste0("CO028", as.character(percent), "P"),
    PARAM = sprintf(
      "EORTC QLQ-C30: Completion - Completed at least %s%% of questions",
      as.character(percent)
    ),
    PARCAT2 = "Completion",
    AVAL = case_when(
      AVAL_ex028 == 1 & per_comp >= percent ~ 1,
      AVAL_ex028 == 1 & (is.na(per_comp) | per_comp < percent) ~ 0
    ),
    AVALC = case_when(
      AVAL == 1 ~ sprintf(
        "Completed at least %s%% of questions",
        as.character(percent)
      ),
      AVAL == 0 ~ sprintf(
        "Did not complete at least %s%% of questions",
        as.character(percent)
      )
    )
  )
  # CO028<x>Q
  co028q <- mutate(
    joined,
    PARAMCD = paste0("CO028", as.character(number), "Q"),
    PARAM = sprintf(
      "EORTC QLQ-C30: Completion - Completed at least %s question(s)",
      as.character(number)
    ),
    PARCAT2 = "Completion",
    AVAL = case_when(
      AVAL_ex028 == 1 & comp_count >= number ~ 1,
      AVAL_ex028 == 1 & (comp_count < number | is.na(comp_count)) ~ 0
    ),
    AVALC = case_when(
      AVAL == 1 ~ sprintf(
        "Completed at least %s questions",
        as.character(number)
      ),
      AVAL == 0 ~ sprintf(
        "Did not complete at least %s question(s)",
        as.character(number)
      )
    )
  )

  co028_bind <- rbind(
    co028all,
    co028p,
    co028q
  ) %>%
    select(
      -c("AVAL_ex028", "comp_count", "comp_count_all", "per_comp")
    )
  return(co028_bind)
}
