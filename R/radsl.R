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
#' @param study_duration Duration of study in years.
#' @param seed Seed for random number generation.
#' @inheritParams mutate_na
#' @templateVar data adsl
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @importFrom dplyr arrange case_when left_join mutate select recode
#' @importFrom magrittr %>%
#' @importFrom stats rchisq reorder rexp rnorm runif setNames
#' @importFrom tibble tibble
#'
#' @export
#
#' @examples
#' library(random.cdisc.data)
#' radsl(N = 10, study_duration = 2, seed = 1)
#' radsl(N = 10, seed = 1,
#'       na_percentage = 0.1,
#'       na_vars = list(DTHDT = c(seed = 1234, percentage = 0.1),
#'                      LSTALVDT = c(seed = 1234, percentage = 0.1)))
#' radsl(N = 10, seed = 1, na_percentage = .1)
radsl <- function(N = 400, # nolint
                  study_duration = 2,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(
                    "AGE" = NA, "SEX" = NA, "RACE" = NA, "STRATA1" = NA, "STRATA2" = NA,
                    "BMRKR1" = c(seed = 1234, percentage = 0.1), "BMRKR2" = c(1234, 0.1), "BEP01FL" = NA
                  ),
                  cached = FALSE) {
  stopifnot(is_logical_single(cached))
  if (cached) {
    return(get_cached_data("cadsl"))
  }

  stopifnot(is_numeric_single(N))
  stopifnot(is_numeric_single(study_duration))
  stopifnot(is.null(seed) || is_numeric_single(seed))
  stopifnot((is_numeric_single(na_percentage) && na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage))

  if (!is.null(seed)) {
    set.seed(seed)
  }

  study_duration_secs <- (31556952 * study_duration)
  sys_dtm <- as.numeric(strptime("20/2/2019 11:16:16.683", "%d/%m/%Y %H:%M:%OS"))
  discons <- max(1, floor((N * .3)))
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
    AGE = sapply(rchisq(N, df = 5, ncp = 10), max, 0) + 20,
    SEX = c("F", "M") %>% sample_fct(N, prob = c(.52, .48)),
    ARMCD = c("ARM A", "ARM B", "ARM C") %>% sample_fct(N),
    RACE = c(
      "ASIAN", "BLACK OR AFRICAN AMERICAN", "WHITE", "AMERICAN INDIAN OR ALASKA NATIVE",
      "MULTIPLE", "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER", "OTHER", "UNKNOWN"
    ) %>%
      sample_fct(N, prob = c(.55, .23, .16, .05, .004, .003, .002, .002)),
    TRTSDTM = as.POSIXct(sample(seq(
      from = sys_dtm,
      to = sys_dtm + study_duration_secs, by = 1), size = N), origin = "1970-01-01"),
    RANDDT = as.Date(.data$TRTSDTM) - floor(runif(N, min = 0, max = 5)),
    st_posixn = as.numeric(.data$TRTSDTM),
    TRTEDTM = as.POSIXct(.data$st_posixn + study_duration_secs, origin = "1970-01-01"),
    STRATA1 = c("A", "B", "C") %>% sample_fct(N),
    STRATA2 = c("S1", "S2") %>% sample_fct(N),
    BMRKR1 = rchisq(N, 6),
    BMRKR2 = sample_fct(c("LOW", "MEDIUM", "HIGH"), N),
    BMEASIFL = sample_fct(c("Y", "N"), N),
    BEP01FL = sample_fct(c("Y", "N"), N)
  ) %>%
    mutate(ARM = recode(.data$ARMCD, "ARM A" = "A: Drug X", "ARM B" = "B: Placebo", "ARM C" = "C: Combination")) %>%
    mutate(ACTARM = .data$ARM) %>%
    mutate(ACTARMCD = .data$ARMCD) %>%
    mutate(ITTFL = factor("Y")) %>%
    mutate(SAFFL = factor("Y")) %>%
    arrange(.data$st_posixn)

  ADDS <- ADSL[sample(nrow(ADSL), discons), ] %>% # nolint
    mutate(TRTEDTM_discon = as.POSIXct(
      sample(seq(from = max(.data$st_posixn), to = sys_dtm + study_duration_secs, by = 1), size = discons),
      origin = "1970-01-01")) %>%
    select(.data$st_posixn, .data$TRTEDTM_discon) %>%
    arrange(.data$st_posixn)

  ADSL <- left_join(ADSL, ADDS, by = "st_posixn") %>% # nolint
    mutate(TRTEDTM = case_when(
      !is.na(TRTEDTM_discon) ~ as.POSIXct(TRTEDTM_discon, origin = "1970-01-01"),
      st_posixn >= quantile(st_posixn)[2] & st_posixn <= quantile(st_posixn)[3] ~ as.POSIXct(NA, origin = "1970-01-01"),
      TRUE ~ TRTEDTM
    )) %>%
    mutate(TRTEDTM = as.POSIXct(.data$TRTEDTM, origin = "1970-01-01"))  %>%
    select(-.data$TRTEDTM_discon)

  ADSL <- ADSL %>% # nolint
    mutate(EOSDT = as.Date(.data$TRTEDTM)) %>%
    mutate(EOSDY = as.numeric(ceiling(difftime(.data$TRTEDTM, .data$TRTSDTM, units = "days")))) %>%
    mutate(EOSSTT = case_when(
      EOSDY == max(EOSDY, na.rm = TRUE) ~ "COMPLETED",
      EOSDY < max(EOSDY, na.rm = TRUE) ~ "DISCONTINUED",
    is.na(TRTEDTM) ~ "ONGOING"
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
    select(-.data$st_posixn)

  # associate sites with countries and regions
  ADSL <- ADSL %>% # nolint
    mutate(SITEID = paste0(.data$COUNTRY, "-", .data$SITEID)) %>%
    mutate(REGION1 = case_when(
      COUNTRY %in% c("NGA") ~ "Africa",
      COUNTRY %in% c("CHN", "JPN", "PAK") ~ "Asia",
      COUNTRY %in% c("RUS") ~ "Eurasia",
      COUNTRY %in% c("GBR") ~ "Europe",
      COUNTRY %in% c("CAN", "USA") ~ "North America",
      COUNTRY %in% c("BRA") ~ "South America",
      TRUE ~ as.character(NA)
    )) %>%
    mutate(INVID = paste("INV ID", .data$SITEID)) %>%
    mutate(INVNAM = paste("Dr.", .data$SITEID, "Doe")) %>%
    mutate(USUBJID = paste(.data$STUDYID, .data$SITEID, .data$SUBJID, sep = "-")) %>%
    mutate(study_duration_secs = study_duration_secs)

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADSL <- mutate_na(ds = ADSL, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  # apply metadata
  ADSL <- apply_metadata(ADSL, "metadata/ADSL.yml", FALSE) # nolint

  return(ADSL)
}
