#' EORTC QLQ-C30 V3 Analysis Dataset (ADQLQC)
#'
#' @param ADSL Subject-Level Analysis Dataset
#' @param seed Seed for random number generation
#' @param percent Completion - Completed at least y percent of questions, 1 record per visit
#' @param number Completion - Completed at least x question(s), 1 record per visit
#' @param cached boolean whether the cached <%= toupper(data) %> data \code{c<%=data%>}
#' should be returned or new data
#' @templateVar data adqlqc
#'
#' @return a dataframe with EORTC QLQ-C30 V3 Analysis Dataset
#'
#' @import dplyr
#' @export
#'
#' @examples
#' \dontrun{
#' ADQLQC <- radqlqc(ADSL, seed = 1, percent = 80, number = 2)
#' }
radqlqc <- function(ADSL, # nolint
                    percent,
                    number,
                    seed = NULL,
                    cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(random.cdisc.data:::get_cached_data("cadqlqc"))
  }

  checkmate::assert_data_frame(ADSL)
  checkmate::assert_number(percent, lower = 1, upper = 100)
  checkmate::assert_number(number, lower = 1)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  # ADQLQC data -------------------------------------------------------------
  QS <- get_qs_data(ADSL, n_assessments = 5L, seed = seed, na_percentage = 0.1) # nolint
  # prepare ADaM adqlqc data
  adqlqc1 <- prep_adqlqc(df = QS)
  # derive AVAL and AVALC
  adqlqc1 <- mutate(
    adqlqc1,
    AVAL = as.numeric(.data$QSSTRESC),
    AVALC = case_when(
      .data$QSTESTCD == "QSALL" ~ .data$QSREASND,
      TRUE ~ .data$QSORRES
    ),
    AVISIT = .data$VISIT,
    AVISITN = .data$VISITNUM,
    ADTM = .data$QSDTC
  )
  # include scale calculation
  ADQLQCtmp <- calc_scales(adqlqc1) # nolint
  # order to prepare for change from screening and baseline values
  ADQLQCtmp <- ADQLQCtmp[order(ADQLQCtmp$STUDYID, ADQLQCtmp$USUBJID, ADQLQCtmp$PARAMCD, ADQLQCtmp$AVISITN), ] # nolint

  ADQLQCtmp <- Reduce( # nolint
    rbind,
    lapply(
      split(ADQLQCtmp, ADQLQCtmp$USUBJID),
      function(x) {
        x$STUDYID <- ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])] # nolint
        x$ABLFL2 <- ifelse(x$AVISIT == "SCREENING", "Y", "") # nolint
        x$ABLFL <- ifelse( # nolint
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

  ADQLQCtmp$BASE2 <- ifelse( # nolint
    str_detect(ADQLQCtmp$PARCAT2, "Completion", negate = TRUE),
    random.cdisc.data:::retain(
      df = ADQLQCtmp,
      value_var = ADQLQCtmp$AVAL,
      event = ADQLQCtmp$ABLFL2 == "Y"
    ),
    NA
  ) # nolint

  ADQLQCtmp$BASE <- ifelse( # nolint
    ADQLQCtmp$ABLFL2 != "Y" &
      str_detect(ADQLQCtmp$PARCAT2, "Completion", negate = TRUE),
    random.cdisc.data:::retain(
      ADQLQCtmp,
      ADQLQCtmp$AVAL,
      ADQLQCtmp$ABLFL == "Y"
    ),
    NA
  ) # nolint

  ADQLQCtmp <- ADQLQCtmp %>% # nolint
    dplyr::mutate(CHG2 = .data$AVAL - .data$BASE2) %>%
    dplyr::mutate(PCHG2 = 100 * (.data$CHG2 / .data$BASE2)) %>%
    dplyr::mutate(CHG = .data$AVAL - .data$BASE) %>%
    dplyr::mutate(PCHG = 100 * (.data$CHG / .data$BASE)) %>%
    random.cdisc.data:::var_relabel(
      STUDYID = attr(ADSL$STUDYID, "label"),
      USUBJID = attr(ADSL$USUBJID, "label")
    )
  # derive CHGCAT1 ----------------------------------------------------------
  ADQLQCtmp <- derv_chgcat1(dataset = ADQLQCtmp) # nolint

  ADQLQCtmp <- random.cdisc.data:::var_relabel( # nolint
    ADQLQCtmp,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  ADQLQCtmp <- arrange( # nolint
    ADQLQCtmp,
    .data$USUBJID,
    .data$AVISITN
  )
  # Merge ADSL --------------------------------------------------------------
  # adsl variables needed for ADQLQC
  adsl_vars <- c(
    "STUDYID", "USUBJID", "SUBJID", "SITEID", "REGION1", "COUNTRY", "ETHNIC", "AGE",
    "AGEU", "AAGE", "AAGEU", "AGEGR1", "AGEGR2", "AGEGR3", "STRATwNM", "STRATw", "STRATwV",
    "SEX", "RACE", "ITTFL", "SAFFL", "PPROTFL", "TRT01P", "TRT01A",
    "TRTSEQP", "TRTSEQA", "TRTSDTM", "TRTSDT", "TRTEDTM", "TRTEDT", "DCUTDT"
  )
  ADSL <- select( # nolint
    ADSL,
    any_of(adsl_vars)
  )
  ADQLQC <- dplyr::inner_join( # nolint
    ADSL, # nolint
    ADQLQCtmp,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::mutate(
      ADY_der = ceiling(as.numeric(difftime(.data$ADTM, .data$TRTSDTM, units = "days"))),
      ADY = case_when(
        ADY_der >= 0 ~ ADY_der + 1,
        TRUE ~ ADY_der
      )
    ) %>%
    select(
      -.data$ADY_der
    )
  # get compliance data ---------------------------------------------------
  compliance_data <- comp_derv(
    dataset = ADQLQC,
    percent = percent,
    number = number
  )
  # add ADSL variables
  compliance_data <- left_join(
    compliance_data,
    ADSL
  )
  # add completion to ADQLQC
  ADQLQC <- bind_rows( # nolint
    ADQLQC,
    compliance_data
  ) %>%
    arrange(
      .data$USUBJID,
      .data$AVISITN,
      .data$QSTESTCD
    )
  # find first set of questionnaire observations
  ADQLQC_x <- arrange( # nolint
    ADQLQC,
    .data$USUBJID,
    .data$ADTM
  ) %>%
    filter(
      .data$PARAMCD != "QSALL" &
        !str_detect(.data$AVISIT, "SCREENING|UNSCHEDULED")
    ) %>%
    group_by(
      .data$USUBJID,
      .data$ADTM
    ) %>%
    summarise(first_date = first(.data$ADTM), .groups = "drop")

  ADQLQC <- left_join( # nolint
    ADQLQC,
    ADQLQC_x
  ) %>%
    mutate(
      ANL01FL = case_when(
        PARAMCD != "QSALL" & ABLFL == "Y" ~ "Y",
        PARAMCD != "QSALL" &
          !str_detect(.data$AVISIT, "UNSCHEDULED") &
          !is.na(.data$first_date) ~ "Y"
      )
    ) %>%
    select(-.data$first_date)
  # final dataset -----------------------------------------------------------
  ADQLQC_final <- ADQLQC %>% # nolint
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(ASEQ = row_number()) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      .data$STUDYID,
      .data$USUBJID,
      .data$AVISITN
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
  adqlqc_name_ordered <- names(ADQLQC_final)[order(match(names(ADQLQC_final), adam_vars))]
  # adqlqc with variables ordered per gdsr
  ADQLQC_final <- ADQLQC_final %>% # nolint
    select(
      any_of(adqlqc_name_ordered)
    )

  ADQLQC_final <- relocate(ADQLQC_final, "QSEVLINT", .after = "QSTESTCD") %>% # nolint
    arrange(
      .data$USUBJID,
      .data$AVISITN,
      .data$ASEQ,
      .data$QSTESTCD
    )
  # apply metadata
  ADQLQC_final <- random.cdisc.data:::apply_metadata(ADQLQC_final, "metadata/ADQLQC.yml") # nolint
  return(ADQLQC_final)
}

#' Questionnaires EORTC QLQ-C30 V3.0 SDTM (QS)
#'
#' Function for generating random Questionnaires SDTM domain
#' @param ADSL ADSL dataset
#' @param visit_format as character string. Valid values: WEEK, CYCLE.
#' @param n_assessments number of assessments. Valid values: integer.
#' @param n_days number of days for each cycle: Valid values: integer.
#' @param lookup control lookup process.
#' @param seed Seed for random number generation.
#' @param na_percentage (\code{numeric}) Default percentage of values to be replaced by NA
#' @param na_vars na_vars (\code{list}) A named list where the name of each element is a column name of \code{ds}. Each
#' element of this list should be a numeric vector with two elements
#'  \itemize{
#'     \item{seed }{The seed to be used for this element - can be left NA}
#'     \item{percentage }{How many element should be replaced. 0 is 0 \% 1 is 100 \%, can be left NA and default
#'     percentage is used. This will overwrite default percentage (percentage argument))}
#' }
#' @param cached boolean whether the cached <%= toupper(data) %> data \code{c<%=data%>} should be
#' returned or new data
#'
#' @return a dataframe with SDTM questionnaire data
#'
#' @import dplyr
#'
#' @export
#'
#' @examples
#' \dontrun{
#' QS <- get_qs_data(ADSL, n_assessments = 5L, seed = 1, na_percentage = 0.1)
#' }
get_qs_data <- function(ADSL, # nolint
                        visit_format = "CYCLE",
                        n_assessments = 5L,
                        n_days = 1L,
                        lookup = NULL,
                        seed = NULL,
                        na_percentage = 0,
                        na_vars = list(
                          QSORRES = c(1234, 0.2),
                          QSSTRESC = c(1234, 0.2)
                        ),
                        cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(random.cdisc.data:::get_cached_data("cqs"))
  }

  checkmate::assert_string(visit_format)
  checkmate::assert_integer(n_assessments, len = 1, any.missing = FALSE)
  checkmate::assert_integer(n_days, len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1, na.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  # get subjects for QS data from ADSL
  # get studyid, subject for QS generation
  QS <- select( # nolint
    ADSL,
    .data$STUDYID,
    .data$USUBJID
  ) %>%
    mutate(
      DOMAIN = "QS"
    )

  # QS prep -----------------------------------------------------------------
  # get questionnaire function for QS
  # QSTESTCD: EOR0101 to EOR0130
  eortc_qlq_c30_sub <- filter(
    eortc_qlq_c30,
    as.numeric(str_extract(.data$QSTESTCD, "\\d+$")) >= 101 &
      as.numeric(str_extract(.data$QSTESTCD, "\\d+$")) <= 130
  ) %>%
    select(-.data$publication_name)

  # validate and initialize QSTEST vectors
  qstest_init_list <- random.cdisc.data:::relvar_init(
    unique(eortc_qlq_c30_sub$QSTEST),
    unique(eortc_qlq_c30_sub$QSTESTCD)
  )


  if (!is.null(seed)) {
    set.seed(seed)
  }

  checkmate::assert_data_frame(lookup, null.ok = TRUE)


  lookup_QS <- if (!is.null(lookup)) { # nolint
    lookup
  } else {
    expand.grid( # nolint
      STUDYID = unique(QS$STUDYID),
      USUBJID = QS$USUBJID,
      QSTEST = qstest_init_list$relvar1,
      VISIT = random.cdisc.data:::visit_schedule(
        visit_format = visit_format,
        n_assessments = n_assessments,
        n_days = n_days
      ),
      stringsAsFactors = FALSE
    )
  }

  # assign related variable values: QSTESTxQSTESTCD are related
  lookup_QS$QSTESTCD <- random.cdisc.data:::rel_var( # nolint
    df = lookup_QS,
    var_name = "QSTESTCD",
    var_values = qstest_init_list$relvar2,
    related_var = "QSTEST"
  ) # nolint

  lookup_QS <- left_join( # nolint
    lookup_QS,
    eortc_qlq_c30_sub,
    by = c(
      "QSTEST",
      "QSTESTCD"
    )
  )

  lookup_QS <- dplyr::mutate( # nolint
    lookup_QS,
    VISITNUM = dplyr::case_when(
      VISIT == "SCREENING" ~ -1,
      VISIT == "BASELINE" ~ 0,
      (grepl("^WEEK", .data$VISIT) | grepl("^CYCLE", .data$VISIT)) ~ as.numeric(.data$VISIT) - 2,
      TRUE ~ NA_real_
    )
  ) %>% arrange(.data$USUBJID)


  # # prep QSALL --------------------------------------------------------------
  # get last subject and visit for QSALL
  last_subj_vis <- select(lookup_QS, .data$USUBJID, .data$VISIT) %>%
    distinct() %>%
    slice(n())
  last_subj_vis_full <- filter(
    lookup_QS,
    .data$USUBJID == last_subj_vis$USUBJID,
    .data$VISIT == last_subj_vis$VISIT
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
  lookup_QS_sub <- anti_join( # nolint
    lookup_QS,
    last_subj_vis_full,
    by = c("USUBJID", "VISIT")
  )


  set.seed(seed)
  lookup_QS_sub_x <- lookup_QS_sub %>% # nolint
    group_by(
      .data$USUBJID,
      .data$QSTESTCD,
      .data$VISIT
    ) %>%
    slice_sample(n = 1) %>%
    ungroup() %>%
    as.data.frame()

  lookup_QS_sub_x <- arrange( # nolint
    lookup_QS_sub_x,
    .data$USUBJID,
    .data$VISITNUM
  )

  # add date: QSDTC ---------------------------------------------------------
  # get treatment dates from ADSL
  ADSL_trt <- select( # nolint
    ADSL,
    .data$USUBJID,
    .data$TRTSDTM,
    .data$TRTEDTM
  )
  # use to derive QSDTC
  # if no treatment end date, create an arbituary one
  trt_end_date <- max(ADSL_trt$TRTEDTM, na.rm = TRUE)

  lookup_QS_sub_x <- left_join( # nolint
    lookup_QS_sub_x,
    ADSL_trt
  ) %>%
    group_by(
      .data$USUBJID
    ) %>%
    mutate(QSDTC = get_random_dates_between(
      from = .data$TRTSDTM,
      to = ifelse(
        is.na(.data$TRTEDTM),
        trt_end_date,
        .data$TRTEDTM
      ),
      visit_id = .data$VISITNUM
    )) %>%
    select(-c("TRTSDTM", "TRTEDTM"))

  # filter out subjects with missing dates
  lookup_QS_sub_x1 <- filter( # nolint
    lookup_QS_sub_x,
    !is.na(.data$QSDTC)
  )

  # subjects with missing dates
  lookup_QS_sub_x2 <- filter( # nolint
    lookup_QS_sub_x,
    is.na(.data$QSDTC)
  ) %>%
    select(
      .data$STUDYID,
      .data$USUBJID,
      .data$VISIT,
      .data$VISITNUM
    ) %>%
    distinct()

  # generate QSALL for subjects with missing dates
  qsall_data2 <- mutate(
    lookup_QS_sub_x2,
    QSTESTCD = "QSALL",
    QSTEST = "Questionnaires",
    QSSTAT = "NOT DONE",
    QSREASND = "SUBJECT REFUSED"
  )


  # add qsall data to original item data
  lookup_QS_sub_all <- bind_rows( # nolint
    lookup_QS_sub_x1,
    qsall_data1,
    qsall_data2
  )

  QS_all <- lookup_QS_sub_all %>% # nolint
    arrange(
      .data$STUDYID,
      .data$USUBJID,
      .data$VISITNUM
    ) %>%
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::ungroup()

  # get first and second subject ids
  first_second_subj <- select(QS_all, .data$USUBJID) %>%
    distinct() %>%
    slice(1:2)

  QS1 <- filter( # nolint
    QS_all,
    .data$USUBJID %in% first_second_subj$USUBJID
  )

  if (length(na_vars) > 0 && na_percentage > 0) {
    QS1 <- random.cdisc.data:::mutate_na(ds = QS1, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  # QSSTAT = NOT DONE
  QS1 <- mutate( # nolint
    QS1,
    QSSTAT = case_when(
      is.na(.data$QSORRES) & is.na(.data$QSSTRESC) ~ "NOT DONE"
    )
  )

  # remove first and second subjects from main data
  QS2 <- anti_join( # nolint
    QS_all,
    QS1,
    by = c("USUBJID")
  )

  final_QS <- rbind( # nolint
    QS1,
    QS2
  ) %>%
    group_by(.data$USUBJID) %>%
    dplyr::mutate(QSSEQ = row_number()) %>%
    arrange(
      .data$STUDYID,
      .data$USUBJID,
      .data$VISITNUM
    ) %>%
    ungroup()

  # ordered variables as per gdsr
  final_QS <- select( # nolint
    final_QS,
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
  return(final_QS)
}

#' Function for generating random dates between 2 dates
#'
#' @param from start date/time variable
#' @param to end date/time variable
#' @param visit_id visit number variable
#'
#' @return data frame with new variable with random generated dates
#'
#' @importFrom lubridate as_datetime days
#'
#' @examples
#' \dontrun{
#' df <- group_by(df, USUBJID) %>%
#'   mutate(ADTM = get_random_dates_between(TRTSDTM, TRTEDTM, AVISITN))
#' }
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


#' Prepare ADaM ADQLQC data, adding PARAMCD to SDTM QS data
#'
#' @param df SDTM QS
#'
#' @return data frame
#'
#' @importFrom stringr str_extract
#' @importFrom dplyr select mutate left_join case_when
#'
#' @examples
#' \dontrun{
#' adqlqc1 <- prep_adqlqc(df = QS)
#' }
prep_adqlqc <- function(df) {
  # create PARAMCD from QSTESTCD
  adqlqc <- mutate(
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
  adqlqc1 <- left_join(
    adqlqc,
    gdsr_param_adqlqc
  )
  return(adqlqc1)
}

#' Scale calculation for ADQLQC data
#'
#' @param adqlqc1 prepared data generated from the prep_adqlqc function
#'
#' @return dataframe
#'
#' @import dplyr
#' @importFrom stringr str_extract str_detect
#'
#'
#'
#' @examples
#' \dontrun{
#' df <- calc_scales(adqlqc1)
#' }
calc_scales <- function(adqlqc1) {
  # Prep scale data ---------------------------------------------------------
  # parcat2 = scales or global health status
  # global health status/scales data
  # QSTESTCD: EOR0131 to EOR0145 (global health status and scales)
  eortc_qlq_c30_sub <- filter(
    eortc_qlq_c30,
    !(as.numeric(str_extract(.data$QSTESTCD, "\\d+$")) >= 101 &
      as.numeric(str_extract(.data$QSTESTCD, "\\d+$")) <= 130)
  ) %>%
    mutate(
      PARAMCD = case_when(
        .data$QSTESTCD == "EOR0131" ~ "QS028QL2",
        .data$QSTESTCD == "EOR0132" ~ "QS028PF2",
        .data$QSTESTCD == "EOR0133" ~ "QS028RF2",
        .data$QSTESTCD == "EOR0134" ~ "QS028EF",
        .data$QSTESTCD == "EOR0135" ~ "QS028CF",
        .data$QSTESTCD == "EOR0136" ~ "QS028SF",
        .data$QSTESTCD == "EOR0137" ~ "QS028FA",
        .data$QSTESTCD == "EOR0138" ~ "QS028NV",
        .data$QSTESTCD == "EOR0139" ~ "QS028PA",
        .data$QSTESTCD == "EOR0140" ~ "QS028DY",
        .data$QSTESTCD == "EOR0141" ~ "QS028SL",
        .data$QSTESTCD == "EOR0142" ~ "QS028AP",
        .data$QSTESTCD == "EOR0143" ~ "QS028CO",
        .data$QSTESTCD == "EOR0144" ~ "QS028DI",
        .data$QSTESTCD == "EOR0145" ~ "QS028FI",
        TRUE ~ .data$QSTESTCD
      )
    ) %>%
    select(-.data$publication_name)

  # ADaM global health status and scales from gdsr
  gdsr_param_adqlqc <- gdsr_param_adqlqc %>%
    filter(
      !str_detect(.data$PARCAT2, "Original Items|Completion")
    )

  ghs_scales <- left_join(
    eortc_qlq_c30_sub,
    gdsr_param_adqlqc
  )
  # scale data
  df <- data.frame(index = 1:nrow(ghs_scales)) # nolint
  df$previous <- list( # nolint
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
    "newValue = (1 - ((tempVal/varLength)-1)/3)*100.0",
    "newValue = ((tempVal/varLength-1)/3)*100.0",
    "newValue = ((tempVal/varLength-1)/3)*100.0",
    "newValue = (1 - ((tempVal/varLength)-1)/3)*100.0",
    "newValue = ((tempVal/varLength-1)/3)*100.0",
    "newValue = ((tempVal/varLength-1)/3)*100.0",
    "newValue = ((tempVal/varLength-1)/3)*100.0",
    "newValue = ((tempVal/varLength-1)/3)*100.0",
    "newValue = (1 - ((tempVal/varLength)-1)/3)*100.0",
    "newValue = ((tempVal/varLength-1)/6)*100.0",
    "newValue = ((tempVal/varLength-1)/3)*100.0",
    "newValue = (1 - ((tempVal/varLength)-1)/3)*100.0",
    "newValue = ((tempVal/varLength-1)/3)*100.0",
    "newValue = (1 - ((tempVal/varLength)-1)/3)*100.0",
    "newValue = ((tempVal/varLength-1)/3)*100.0"
  )

  expectData <- data.frame( # nolint
    PARAM = expect$PARAM,
    PARAMCD = expect$PARAMCD,
    PARCAT2 = expect$PARCAT2,
    PARCAT1N = expect$PARCAT1N,
    AVAL = c(0, 1),
    AVALC = c(
      "Not expected to complete questionnaire",
      "Expected to complete questionnaire"
    )
  )

  df_saved <- data.frame() # nolint

  uniqueID <- unique(adqlqc1$USUBJID) # nolint

  for (id in uniqueID) {
    idData <- adqlqc1[adqlqc1$USUBJID == id, ] # nolint
    uniqueAvisit <- unique(idData$AVISIT) # nolint
    for (visit in uniqueAvisit) {
      if (is.na(visit)) {
        next
      }
      idData_at_visit <- idData[idData$AVISIT == visit, ] # nolint

      if (any(idData_at_visit$PARAMCD != "QSALL")) {
        for (idx in seq_along(df$index)) {
          previousNames <- df$previous[idx] # nolint
          currentName <- df$newName[idx] # nolint
          currentNamelabel <- df$newNamelabel[idx] # nolint
          currentNameCategory <- df$newNameCategory[idx] # nolint
          eqn <- df$equation[idx] # nolint
          tempVal <- 0 # nolint
          varLength <- 0 # nolint
          for (paramName in previousNames[[1]]) {
            if (paramName %in% idData_at_visit$PARAMCD) { ####
              currentVal <- as.numeric(as.character(idData_at_visit$AVAL[idData_at_visit$PARAMCD == paramName])) # nolint
              if (!is.na(currentVal)) {
                tempVal <- tempVal + currentVal ###    # nolint
                varLength <- varLength + 1 # nolint
              }
            } # if
          } # paramName
          # eval
          if (varLength >= as.numeric(df$num_param[idx])) {
            eval(parse(text = eqn)) #####
          } else {
            newValue <- NA # nolint
          }

          new_data_row <- data.frame(
            study = str_extract(id, "[A-Z]+[0-9]+"),
            id,
            visit,
            idData_at_visit$AVISITN[1],
            idData_at_visit$QSDTC[1],
            currentNameCategory,
            currentNamelabel,
            currentName,
            newValue,
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
      # add expect data
      expectValue <- sample(expectData$AVAL, 1, prob = c(0.10, 0.90)) # nolint
      expectValueC <- expectData$AVALC[expectData$AVAL == expectValue] # nolint

      new_data_row <- data.frame(
        study = str_extract(id, "[A-Z]+[0-9]+"),
        id,
        visit,
        idData_at_visit$AVISITN[1],
        datetime = NA,
        expectData$PARCAT2[1],
        expectData$PARAM[1],
        expectData$PARAMCD[1],
        expectValue,
        expectValueC,
        stringsAsFactors = FALSE
      )
      colnames(new_data_row) <- c(
        "STUDYID", "USUBJID", "AVISIT", "AVISITN",
        "ADTM", "PARCAT2", "PARAM", "PARAMCD", "AVAL",
        "AVALC"
      ) ###
      df_saved <- rbind(df_saved, new_data_row)
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
  ) %>%
    mutate(
      AVALC = ifelse(is.na(.data$AVALC), as.character(.data$AVAL), .data$AVALC),
      PARCAT1 = ifelse(.data$PARAMCD == "EX028", expect$PARCAT1, .data$PARCAT1),
      PARCAT1N = ifelse(.data$PARAMCD == "EX028", expect$PARCAT1N, .data$PARCAT1N)
    )

  ADQLQCtmp <- bind_rows(adqlqc1, df_saved1) %>% # nolint
    arrange(
      .data$USUBJID,
      .data$AVISITN,
      .data$QSTESTCD
    )
  return(ADQLQCtmp)
}

#' Calculate Change from Baseline Category 1
#'
#' @param dataset adam dataset
#'
#'
#' @return dataframe
#'
#'
#' @examples
#' \dontrun{
#' ADQLQC <- derv_chgcat1(dataset = ADQLQC)
#' }
derv_chgcat1 <- function(dataset) {
  # derivation of CHGCAT1
  check_vars <- c("PARCAT2", "CHG")

  if (all(check_vars %in% names(dataset))) {
    dataset$CHGCAT1 <- ifelse(dataset$PARCAT2 == "Symptom Scales" & !is.na(dataset$CHG) & dataset$CHG <= -10,
      "Improved", ""
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARCAT2 == "Symptom Scales" & !is.na(dataset$CHG) & dataset$CHG >= 10,
      "Worsened", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARCAT2 == "Symptom Scales" &
      !is.na(dataset$CHG) & dataset$CHG > -10 &
      dataset$CHG < 10,
    "No change", dataset$CHGCAT1
    )

    dataset$CHGCAT1 <- ifelse(dataset$PARCAT2 %in% c("Functional Scales", "Global Health Status") &
      !is.na(dataset$CHG) & dataset$CHG >= 10,
    "Improved", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARCAT2 %in% c("Functional Scales", "Global Health Status") &
      !is.na(dataset$CHG) & dataset$CHG <= -10,
    "Worsened", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARCAT2 %in% c("Functional Scales", "Global Health Status") &
      !is.na(dataset$CHG) &
      dataset$CHG > -10 & dataset$CHG < 10,
    "No change", dataset$CHGCAT1
    )

    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 6,
      "Improved by six levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 5,
      "Improved by five levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 4,
      "Improved by four levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 3,
      "Improved by three levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 2,
      "Improved by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 1,
      "Improved by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == 0,
      "No change", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == -1,
      "Worsened by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == -2,
      "Worsened by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == -3,
      "Worsened by three levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == -4,
      "Worsened by four levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == -5,
      "Worsened by five levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02829", "QS02830") & dataset$CHG == -6,
      "Worsened by six levels", dataset$CHGCAT1
    )

    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == -3,
      "Improved by three levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == -2,
      "Improved by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == -1,
      "Improved by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == 0,
      "No change", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == 1,
      "Worsened by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == 2,
      "Worsened by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% c("QS02802", "QS02806") & dataset$CHG == 3,
      "Worsened by three levels", dataset$CHGCAT1
    )

    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD == "QS02801" & dataset$CHG == -3,
      "Improved by three levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD == "QS02801" & dataset$CHG == -2,
      "Improved by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD == "QS02801" & dataset$CHG == -1,
      "Improved by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD == "QS02801" & dataset$CHG == 0,
      "No changed", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD == "QS02801" & dataset$CHG == 1,
      "Worsened by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD == "QS02801" & dataset$CHG == 2,
      "Worsened by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD == "QS02801" & dataset$CHG == 3,
      "Worsened by three levels", dataset$CHGCAT1
    )

    paramcd_vec <- c(
      "QS02803", "QS02804", "QS02805", "QS02807", "QS02808", "QS02809", "QS02810",
      "QS02811", "QS02812", "QS02813", "QS02814", "QS02815", "QS02816", "QS02817",
      "QS02818", "QS02819", "QS02820", "QS02821", "QS02822", "QS02823", "QS02824",
      "QS02825", "QS02826", "QS02827", "QS02828"
    )

    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% paramcd_vec & dataset$CHG == -3,
      "Improved by three levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% paramcd_vec & dataset$CHG == -2,
      "Improved by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% paramcd_vec & dataset$CHG == -1,
      "Improved by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% paramcd_vec & dataset$CHG == 0,
      "No change", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% paramcd_vec & dataset$CHG == 1,
      "Worsened by one level", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% paramcd_vec & dataset$CHG == 2,
      "Worsened by two levels", dataset$CHGCAT1
    )
    dataset$CHGCAT1 <- ifelse(dataset$PARAMCD %in% paramcd_vec & dataset$CHG == 3,
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

#' Completion/Compliance data calculation
#' @param dataset adam dataset
#' @param percent Completion - Completed at least y percent of questions, 1 record per visit
#' @param number Completion - Completed at least x question(s), 1 record per visit
#' @return data frame
#'
#' @import dplyr
#' @examples
#' \dontrun{
#' compliance_data <- comp_derv(ADQLQC, 80, 2)
#' }
comp_derv <- function(dataset, percent, number) {
  # original items data
  orig_data <- filter(
    dataset,
    .data$PARCAT2 == "Original Items"
  )
  # total number of questionnaires
  comp_count_all <- select(
    orig_data,
    .data$PARAMCD
  ) %>%
    distinct() %>%
    count()
  comp_count_all <- comp_count_all$n
  # original items data count of questions answered
  orig_data_summ <- group_by(
    orig_data,
    .data$STUDYID,
    .data$USUBJID,
    .data$PARCAT1,
    .data$AVISIT,
    .data$AVISITN,
    .data$ADTM,
    .data$ADY
  ) %>%
    summarise(
      comp_count = sum(!is.na(.data$AVAL)),
      comp_count_all = comp_count_all,
      .groups = "drop"
    ) %>%
    mutate(
      per_comp = trunc((.data$comp_count / .data$comp_count_all) * 100)
    )
  # expected data
  ex028_data <- filter(
    dataset,
    .data$PARAMCD == "EX028",
    .data$AVAL == 1
  ) %>%
    select(
      .data$STUDYID,
      .data$USUBJID,
      .data$PARCAT1,
      .data$AVISIT,
      .data$AVISITN,
      .data$ADTM,
      .data$ADY,
      AVAL_ex028 = .data$AVAL
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

  joined <- mutate(
    joined,
    ADTM = ADTM.y,
    ADY = ADY.y
  ) %>%
    select(-c("ADTM.y", "ADY.y"))
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
      .data$AVAL == 1 ~ "Completed all questions",
      .data$AVAL == 0 ~ "Did not complete all questions"
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