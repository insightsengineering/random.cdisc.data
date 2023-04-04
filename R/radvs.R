#' Vital Signs Analysis Dataset (ADVS)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating a random Vital Signs Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: `STUDYID`, `USUBJID`, `PARAMCD`, `BASETYPE`, `AVISITN`, `ATPTN`, `DTYPE`, `ADTM`, `VSSEQ`, `ASPID`
#'
#' @inheritParams argument_convention
#' @template param_cached
#' @templateVar data advs
#'
#' @return `data.frame`
#' @export
#'
#' @author npaszty
#'
#' @examples
#' library(random.cdisc.data)
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' advs <- radvs(adsl, visit_format = "WEEK", n_assessments = 7L, seed = 2)
#' advs
#'
#' advs <- radvs(adsl, visit_format = "CYCLE", n_assessments = 3L, seed = 2)
#' advs
radvs <- function(adsl,
                  param = c(
                    "Diastolic Blood Pressure",
                    "Pulse Rate",
                    "Respiratory Rate",
                    "Systolic Blood Pressure",
                    "Temperature", "Weight"
                  ),
                  paramcd = c("DIABP", "PULSE", "RESP", "SYSBP", "TEMP", "WEIGHT"),
                  paramu = c("Pa", "beats/min", "breaths/min", "Pa", "C", "Kg"),
                  visit_format = "WEEK",
                  n_assessments = 5L,
                  n_days = 5L,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(
                    CHG2 = c(1235, 0.1), PCHG2 = c(1235, 0.1), CHG = c(1234, 0.1), PCHG = c(1234, 0.1),
                    AVAL = c(123, 0.1), AVALU = c(123, 0.1)
                  ),
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadvs"))
  }

  checkmate::assert_data_frame(adsl)
  checkmate::assert_character(param, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramcd, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramu, min.len = 1, any.missing = FALSE)
  checkmate::assert_string(visit_format)
  checkmate::assert_integer(n_assessments, len = 1, any.missing = FALSE)
  checkmate::assert_integer(n_days, len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  # validate and initialize param vectors
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  if (!is.null(seed)) {
    set.seed(seed)
  }
  study_duration_secs <- lubridate::seconds(attr(adsl, "study_duration_secs"))

  advs <- expand.grid(
    STUDYID = unique(adsl$STUDYID),
    USUBJID = adsl$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments),
    stringsAsFactors = FALSE
  )

  advs <- dplyr::mutate(
    advs,
    AVISITN = dplyr::case_when(
      AVISIT == "SCREENING" ~ -1,
      AVISIT == "BASELINE" ~ 0,
      (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
      TRUE ~ NA_real_
    )
  )

  advs$VSCAT <- "VITAL SIGNS"

  # assign related variable values: PARAMxPARAMCD are related
  advs <- advs %>% rel_var(
    var_name = "PARAMCD",
    related_var = "PARAM",
    var_values = param_init_list$relvar2
  )

  # assign related variable values: PARAMxAVALU are related
  advs <- advs %>% rel_var(
    var_name = "AVALU",
    related_var = "PARAM",
    var_values = unit_init_list$relvar2
  )

  advs <- advs %>%
    dplyr::mutate(VSTESTCD = PARAMCD) %>%
    dplyr::mutate(VSTEST = PARAM)

  advs <- advs %>% dplyr::mutate(AVAL = dplyr::case_when(
    PARAMCD == paramcd[1] ~ stats::rnorm(nrow(advs), mean = 100, sd = 20),
    PARAMCD == paramcd[2] ~ stats::rnorm(nrow(advs), mean = 80, sd = 15),
    PARAMCD == paramcd[3] ~ stats::rnorm(nrow(advs), mean = 16, sd = 5),
    PARAMCD == paramcd[4] ~ stats::rnorm(nrow(advs), mean = 150, sd = 30),
    PARAMCD == paramcd[5] ~ stats::rnorm(nrow(advs), mean = 36.65, sd = 1),
    PARAMCD == paramcd[6] ~ stats::rnorm(nrow(advs), mean = 70, sd = 20)
  ))

  # order to prepare for change from screening and baseline values
  advs <- advs[order(advs$STUDYID, advs$USUBJID, advs$PARAMCD, advs$AVISITN), ]

  advs <- Reduce(rbind, lapply(split(advs, advs$USUBJID), function(x) {
    x$STUDYID <- adsl$STUDYID[which(adsl$USUBJID == x$USUBJID[1])]
    x$ABLFL2 <- ifelse(x$AVISIT == "SCREENING", "Y", "")
    x$ABLFL <- ifelse(
      toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE",
      "Y",
      ifelse(
        toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1",
        "Y",
        ""
      )
    )
    x
  }))

  advs$BASE2 <- retain(advs, advs$AVAL, advs$ABLFL2 == "Y")
  advs$BASE <- ifelse(advs$ABLFL2 != "Y", retain(advs, advs$AVAL, advs$ABLFL == "Y"), NA)

  advs <- advs %>%
    dplyr::mutate(CHG2 = AVAL - BASE2) %>%
    dplyr::mutate(PCHG2 = 100 * (CHG2 / BASE2)) %>%
    dplyr::mutate(CHG = AVAL - BASE) %>%
    dplyr::mutate(PCHG = 100 * (CHG / BASE)) %>%
    dplyr::mutate(ANRLO = dplyr::case_when(
      PARAMCD == "DIABP" ~ 80,
      PARAMCD == "PULSE" ~ 60,
      PARAMCD == "RESP" ~ 12,
      PARAMCD == "SYSBP" ~ 120,
      PARAMCD == "TEMP" ~ 36.1,
      PARAMCD == "WEIGHT" ~ 40
    )) %>%
    dplyr::mutate(ANRHI = dplyr::case_when(
      PARAMCD == "DIABP" ~ 120,
      PARAMCD == "PULSE" ~ 100,
      PARAMCD == "RESP" ~ 20,
      PARAMCD == "SYSBP" ~ 180,
      PARAMCD == "TEMP" ~ 37.2,
      PARAMCD == "WEIGHT" ~ 100
    )) %>%
    dplyr::mutate(ANRIND = factor(dplyr::case_when(
      AVAL < ANRLO ~ "LOW",
      AVAL > ANRHI ~ "HIGH",
      TRUE ~ "NORMAL"
    ))) %>%
    dplyr::mutate(VSSTRESC = dplyr::case_when(
      PARAMCD == "DIABP" ~ "<80",
      PARAMCD == "PULSE" ~ "<60",
      PARAMCD == "RESP" ~ ">20",
      PARAMCD == "SYSBP" ~ ">180",
      PARAMCD == "TEMP" ~ "<36.1",
      PARAMCD == "WEIGHT" ~ "<40"
    )) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(LOQFL = factor(
      ifelse(eval(parse(text = paste(AVAL, VSSTRESC))), "Y", "N")
    )) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(BASETYPE = "LAST") %>%
    dplyr::group_by(USUBJID, PARAMCD, BASETYPE) %>%
    dplyr::mutate(BNRIND = ANRIND[ABLFL == "Y"]) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(ATPTN = 1) %>%
    dplyr::mutate(DTYPE = NA) %>%
    var_relabel(
      USUBJID = attr(adsl$USUBJID, "label"),
      STUDYID = attr(adsl$STUDYID, "label")
    )

  advs <- var_relabel(
    advs,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add LB date and study day variables
  advs <- dplyr::inner_join(
    advs,
    adsl,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(TRTENDT = lubridate::date(dplyr::case_when(
      is.na(TRTEDTM) ~ lubridate::floor_date(lubridate::date(TRTSDTM) + study_duration_secs, unit = "day"),
      TRUE ~ TRTEDTM
    ))) %>%
    dplyr::ungroup()

  advs <- advs %>%
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

  advs <- advs %>% dplyr::mutate(ONTRTFL = factor(dplyr::case_when(
    !AVISIT %in% c("SCREENING", "BASELINE") ~ "Y",
    TRUE ~ ""
  )))

  advs <- advs %>%
    dplyr::mutate(ASPID = sample(seq_len(dplyr::n()))) %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(VSSEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = VSSEQ) %>%
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
      VSSEQ,
      ASPID
    )

  if (length(na_vars) > 0 && na_percentage > 0) {
    advs <- mutate_na(ds = advs, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  advs <- apply_metadata(advs, "metadata/ADVS.yml")

  return(advs)
}
