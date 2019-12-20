#' Vital Signs Analysis Dataset (ADVS)
#'
#' Function for generating random dataset from Vital Signs Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: STUDYID, USUBJID, PARAMCD, BASETYPE, AVISITN, ATPTN, DTYPE, ADTM, VSSEQ, ASPID.
#'
#' @template ADSL_params
#' @template BDS_findings_params
#' @param paramu As character string. list of parameter unit values.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data advs
#' @template param_cached
#' @template return_data.frame
#'
#' @importFrom dplyr arrange case_when group_by mutate n rowwise select ungroup
#' @importFrom magrittr %>%
#' @importFrom stats rnorm
#' @importFrom rlang .data
#'
#' @export
#'
#' @author npaszty
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' radvs(ADSL, visit_format = "WEEK", n_assessments = 7L, seed = 2)
#' radvs(ADSL, visit_format = "CYCLE", n_assessments = 3L, seed = 2)
radvs <- function(ADSL, # nolint
                  param = c("Diastolic Blood Pressure",
                            "Pulse Rate",
                            "Respiratory Rate",
                            "Systolic Blood Pressure",
                            "Temperature", "Weight"),
                  paramcd = c("DIABP", "PULSE", "RESP", "SYSBP", "TEMP", "WEIGHT"),
                  paramu = c("Pa", "beats/min", "breaths/min", "Pa", "C", "Kg"),
                  visit_format = "WEEK",
                  n_assessments = 5L,
                  n_days = 5L,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(CHG2 = c(1235, 0.1), PCHG2 = c(1235, 0.1), CHG = c(1234, 0.1), PCHG = c(1234, 0.1),
                                 AVAL = c(123, 0.1), AVALU = c(123, 0.1)
                  ),
                  cached = FALSE) {

  stopifnot(is_logical_single(cached))
  if (cached) {
    return(get_cached_data("cadvs"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is_character_vector(param))
  stopifnot(is_character_vector(paramcd))
  stopifnot(is_character_vector(paramu))
  stopifnot(is_character_single(visit_format))
  stopifnot(is_integer_single(n_assessments))
  stopifnot(is_integer_single(n_days))
  stopifnot((is_numeric_single(na_percentage) && na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  # validate and initialize param vectors
  param_init_list <- relvar_init(param, paramcd)
  unit_init_list <- relvar_init(param, paramu)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADVS <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = visit_schedule(visit_format = visit_format, n_assessments = n_assessments),
    stringsAsFactors = FALSE
  )

  ADVS <- mutate( # nolint
    ADVS,
    AVISITN = case_when(
      AVISIT == "SCREENING" ~ -1,
      AVISIT == "BASELINE" ~ 0,
      (grepl("^WEEK", AVISIT) | grepl("^CYCLE", AVISIT)) ~ as.numeric(AVISIT) - 2,
      TRUE ~ NA_real_
    )
  )

  ADVS$VSCAT <- "VITAL SIGNS" # nolint

  # assign related variable values: PARAMxPARAMCD are related
  ADVS$PARAMCD <- as.factor(rel_var( # nolint
    df = ADVS,
    var_name = "PARAMCD",
    var_values = param_init_list$relvar2,
    related_var = "PARAM"
  ))
  ADVS <- ADVS %>% # nolint
    mutate(VSTESTCD = .data$PARAMCD) %>%
    mutate(VSTEST = .data$PARAM)
  ADVS$AVALU <- as.factor(rel_var( # nolint
    df = ADVS,
    var_name = "AVALU",
    var_values = unit_init_list$relvar2,
    related_var = "PARAM"
  ))

  ADVS$AVAL <- rnorm(nrow(ADVS), mean = 50, sd = 8) # nolint
  ADVS$VSSTRESC <- ADVS$AVAL # nolint

  # order to prepare for change from screening and baseline values
  ADVS <- ADVS[order(ADVS$STUDYID, ADVS$USUBJID, ADVS$PARAMCD, ADVS$AVISITN), ] # nolint

  ADVS <- Reduce(rbind, lapply(split(ADVS, ADVS$USUBJID), function(x) { # nolint
    x$STUDYID <- ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])] # nolint
    x$ABLFL2 <- ifelse(x$AVISIT == "SCREENING", "Y", "") # nolint
    x$ABLFL <- ifelse( # nolint
      toupper(visit_format) == "WEEK" & x$AVISIT == "BASELINE",
      "Y",
      ifelse(
        toupper(visit_format) == "CYCLE" & x$AVISIT == "CYCLE 1 DAY 1",
        "Y",
        ""
      )
    )
    x$LOQFL <- ifelse(x$AVAL < 32, "Y", "N") # nolint
    x
  }))

  ADVS$BASE2 <- retain(ADVS, ADVS$AVAL, ADVS$ABLFL2 == "Y") # nolint
  ADVS$BASE <- ifelse(ADVS$ABLFL2 != "Y", retain(ADVS, ADVS$AVAL, ADVS$ABLFL == "Y"), NA) # nolint
  ANRIND_choices <- c("HIGH", "LOW", "NORMAL") # nolint

  ADVS <- ADVS %>% # nolint
    mutate(CHG2 = .data$AVAL - .data$BASE2) %>%
    mutate(PCHG2 = 100 * (.data$CHG2 / .data$BASE2)) %>%
    mutate(CHG = .data$AVAL - .data$BASE) %>%
    mutate(PCHG = 100 * (.data$CHG / .data$BASE)) %>%
    mutate(ANRIND = ANRIND_choices %>%
             sample_fct(nrow(ADVS), prob = c(0.1, 0.1, 0.8))) %>%
    mutate(BASETYPE = "LAST") %>%
    mutate(ATPTN = 1) %>%
    mutate(DTYPE = NA) %>%
    var_relabel(
      USUBJID = attr(ADSL$USUBJID, "label"),
      STUDYID = attr(ADSL$STUDYID, "label")
    )

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADVS <- mutate_na(ds = ADVS, na_vars = na_vars, na_percentage = na_percentage) #nolint
  }

  ADVS <- var_relabel( # nolint
    ADVS,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add LB date and study day variables
  ADVS <- inner_join(ADSL, # nolint
                     ADVS,
                     by = c("STUDYID", "USUBJID")) %>%
    rowwise() %>%
    mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    mutate(trtedt_int = case_when(
      !is.na(TRTEDTM) ~ as.numeric(as.Date(TRTEDTM)),
      is.na(TRTEDTM) ~ floor(trtsdt_int + (study_duration_secs) / 86400)
    )) %>%
    mutate(ADTM = as.POSIXct((sample(.data$trtsdt_int:.data$trtedt_int, size = 1) * 86400), origin = "1970-01-01")) %>%
    mutate(ADY = ceiling(as.numeric(difftime(.data$ADTM, .data$TRTSDTM, units = "days")))) %>%
    select(-.data$trtsdt_int, -.data$trtedt_int) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$ADTM)

  ADVS <- ADVS %>% # nolint
    mutate(ASPID = sample(1:n())) %>%
    group_by(.data$USUBJID) %>%
    mutate(VSSEQ = 1:n()) %>%
    mutate(ASEQ = .data$VSSEQ) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$PARAMCD, .data$BASETYPE, .data$AVISITN, .data$ATPTN, .data$DTYPE,
            .data$ADTM, .data$VSSEQ, .data$ASPID)

  # apply metadata
  ADVS <- apply_metadata(ADVS, "metadata/ADVS.yml") # nolint

  return(ADVS)
}
