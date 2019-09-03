#' Subject-Level Analysis Dataset (ADSL)
#'
#' The Subject-Level Analysis Data set (ADSL) is used to provide the variables
#' that describe attributes of a subject. ADSL is a source for subject-level
#' variables used in other analysis data sets, such as population flags and
#' treatment variables. There is only one ADSL per study. ADSL and its related
#' metadata are required in a CDISC-based submission of data from a clinical
#' trial even if no other analysis data sets are submitted.
#'
#' @details One record per subject.
#'
#' Keys: STUDYID USUBJID
#'
#' @param N Number of patients.
#' @param seed Seed for random number generation.
#' @param study_duration Duration of study in years.
#' @inheritParams mutate_na
#' @templateVar data adsl
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @importFrom dplyr mutate arrange left_join
#' @importFrom magrittr %>%
#' @importFrom stats rchisq reorder rexp rnorm runif setNames
#' @importFrom tibble tibble
#'
#' @export
#
#' @examples
#' library(dplyr)
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, study_duration = 2, seed = 1)
#' ADSL <- radsl(N = 10, seed = 1,
#'               na_percentage = 0.1,
#'               na_vars = list(DTHDT = c(seed = 1234, percentage = 0.1),
#'                              LSTALVDT = c(seed = 1234, percentage = 0.1)))
#' ADSL <- radsl(N = 10, seed = 1,
#'               na_percentage = .1)
#' head(ADSL)
radsl <- function(N = 400, # nolint
                  seed = NULL,
                  study_duration = 2,
                  cached = FALSE,
                  na_percentage = 0,
                  na_vars = list(
                    "AGE" = NA, "SEX" = NA, "RACE" = NA, "STRATA1" = NA, "STRATA2" = NA,
                    "BMRKR1" = c(seed = 1234, percentage = 0.1), "BMRKR2" = c(1234, 0.1), "BEP01FL" = NA)) {
  stopifnot(is.logical.single(cached))
  if (cached) {
    return(get_cached_data("cadsl"))
  }

  stopifnot(is.numeric.single(N))
  stopifnot(is.null(seed) || is.numeric.single(seed))
  stopifnot((na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  if (!is.null(seed)) {
    set.seed(seed)
  }

  study_duration_secs <- (31556952 * study_duration)
  sys_dtm <- as.numeric(Sys.time())
  discons <- floor((N * .3))
  country_site_prob <- c(.5, .121, .077, .077, .075, .052, .046, .025, .014, .003)

  ADSL <- tibble( # nolint
    STUDYID = rep("AB12345", N),
    COUNTRY = sample_fct(
      c("CHN", "USA", "BRA", "PAK", "NGA", "RUS", "JPN", "GBR", "CAN", "CHE"),
      N,
      prob = country_site_prob
    ),
    SITEID = sample_fct(1:20, N, prob = rep(country_site_prob, times = 2)),
    SUBJID = paste("id", seq_len(N), sep = "-"),
    AGE = sapply(floor(rnorm(N, mean = 20, sd = 20)), max, 0) + 20,
    SEX = c("F", "M", "U", "UNDIFFERENTIATED") %>% sample_fct(N, prob = c(.5, .48, .015, .005)),
    ARMCD = c("ARM A", "ARM B", "ARM C") %>% sample_fct(N),
    RACE = c(
      "ASIAN", "BLACK OR AFRICAN AMERICAN", "WHITE", "AMERICAN INDIAN OR ALASKA NATIVE",
      "MULTIPLE", "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER", "OTHER", "UNKNOWN"
    ) %>%
      sample_fct(N, prob = c(.55, .23, .16, .05, .004, .003, .002, .002)),
    # TRTSDTM = sample(seq(from = as.POSIXct(strptime(Sys.time(), "%Y-%m-%d %H:%M:%S"), tz = "GMT"),
    #                       to = as.POSIXct(strptime(Sys.time() + study_duration_secs, "%Y-%m-%d %H:%M:%S"),
    #                                       tz = "GMT"), by = 1), size = N),
    TRTSDTM = as.POSIXct(sample(seq(from = sys_dtm,
                                     to = sys_dtm + study_duration_secs, by = 1), size = N), origin = "1970-01-01"),
    RANDDT = as.Date(.data$TRTSDTM) - floor(runif(N, min = 0, max = 5)),
    # TRTEDTM = TRTSDTM + floor(runif(N, min =  as.numeric(TRTSDTM), max = (31556952*study_duration))),
    st_posixn = as.numeric(.data$TRTSDTM),
    TRTEDTM = as.POSIXct(.data$st_posixn + study_duration_secs, origin = "1970-01-01"),
    STRATA1 = c("A", "B", "C") %>% sample_fct(N),
    STRATA2 = c("S1", "S2") %>% sample_fct(N),
    BMRKR1 = rchisq(N, 6),
    BMRKR2 = sample_fct(c("LOW", "MEDIUM", "HIGH"), N),
    BEP01FL = sample_fct(c("Y", "N"), N)
  ) %>%
    mutate(ARM = recode(ARMCD, "ARM A" = "A: Drug X", "ARM B" = "B: Placebo", "ARM C" = "C: Combination")) %>%
    mutate(ACTARM = ARM) %>%
    mutate(ACTARMCD = ARMCD) %>%
    mutate(ITTFL = factor("Y")) %>%
    arrange(.data$st_posixn)

  ADDS <- ADSL[sample(nrow(ADSL), discons), ] %>% # nolint
    mutate(TRTEDTM_discon = as.POSIXct(sample(seq(from = max(.data$st_posixn),
                                            to = sys_dtm + study_duration_secs, by = 1),
                                              size = discons), origin = "1970-01-01")) %>%
    select("st_posixn", "TRTEDTM_discon") %>%
    arrange(.data$st_posixn)


  ADSL <- left_join(ADSL, ADDS, by = "st_posixn") %>% # nolint
    mutate(TRTEDTM = case_when(
      !is.na(.data$TRTEDTM_discon) ~ as.POSIXct(.data$TRTEDTM_discon, origin = "1970-01-01"),
      .data$st_posixn >= quantile(.data$st_posixn)[2] & .data$st_posixn <=
          quantile(.data$st_posixn)[3] ~ as.POSIXct(NA, origin = "1970-01-01"),
      TRUE ~ .data$TRTEDTM
    )) %>%
    mutate(TRTEDTM = as.POSIXct(.data$TRTEDTM, origin = "1970-01-01"))  %>%
    select(- "TRTEDTM_discon")

  ADSL <- ADSL %>% # nolint
    mutate(EOSDT = as.Date(.data$TRTEDTM)) %>%
    mutate(EOSDY = as.numeric(ceiling(difftime(.data$TRTEDTM, .data$TRTSDTM, units = "days")))) %>%
    mutate(EOSSTT = case_when(
      EOSDY == max(.data$EOSDY, na.rm = TRUE) ~ "COMPLETED",
      EOSDY < max(.data$EOSDY, na.rm = TRUE) ~ "DISCONTINUED",
    is.na(.data$TRTEDTM) ~ "ONGOING"
  )) %>%
  mutate(DCSREAS = case_when(
    EOSSTT == "DISCONTINUED" ~
      c("ADVERSE EVENT",
        "LACK OF EFFICACY",
        "PHYSICIAN DECISION",
        "PROTOCOL VIOLATION",
        "WITHDRAWAL BY PARENT/GUARDIAN",
        "WITHDRAWAL BY SUBJECT") %>% sample_fct(N)
  )) %>%
  mutate(DTHDT = as.Date(.data$TRTEDTM)) %>%
  mutate(LSTALVDT = as.Date(.data$TRTEDTM) + floor(runif(N, min = 10, max = 30))) %>%
    select(- "st_posixn")

  # associate sites with countries
  ADSL <- ADSL %>% # nolint
    mutate(SITEID = paste0(.data$COUNTRY, "-", .data$SITEID)) %>%
    mutate(USUBJID = paste(.data$STUDYID, .data$SITEID, .data$SUBJID, sep = "-")) %>%
    mutate(study_duration_secs = study_duration_secs)

  if ((na_percentage > 0 && na_percentage <= 1) || length(na_vars) >= 1) {
    ADSL <- mutate_na(ds = ADSL, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  # apply metadata
  return(apply_metadata(ADSL, "metadata/ADSL.yml", seed = seed))

}
