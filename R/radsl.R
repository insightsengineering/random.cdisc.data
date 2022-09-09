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
#' @param ae_withdrawal_prob Probability that there is at least one Adverse Event
#' leading to the withdrawal of a study drug.
#' @inheritParams mutate_na
#' @templateVar data adsl
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @export
#
#' @examples
#' library(random.cdisc.data)
#' radsl(N = 10, study_duration = 2, seed = 1)
#' radsl(
#'   N = 10, seed = 1,
#'   na_percentage = 0.1,
#'   na_vars = list(
#'     DTHDT = c(seed = 1234, percentage = 0.1),
#'     LSTALVDT = c(seed = 1234, percentage = 0.1)
#'   )
#' )
#' radsl(N = 10, seed = 1, na_percentage = .1)
radsl <- function(N = 400, # nolint
                  study_duration = 2,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(
                    "AGE" = NA, "SEX" = NA, "RACE" = NA, "STRATA1" = NA, "STRATA2" = NA,
                    "BMRKR1" = c(seed = 1234, percentage = 0.1), "BMRKR2" = c(1234, 0.1), "BEP01FL" = NA
                  ),
                  ae_withdrawal_prob = 0.05,
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadsl"))
  }

  checkmate::assert_number(N)
  checkmate::assert_number(study_duration)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1, na.ok = TRUE)
  checkmate::assert_number(study_duration, lower = 1)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  study_duration_secs <- (31556952 * study_duration)
  sys_dtm <- as.numeric(strptime("20/2/2019 11:16:16.683", "%d/%m/%Y %H:%M:%OS"))
  discons <- max(1, floor((N * .3)))
  country_site_prob <- c(.5, .121, .077, .077, .075, .052, .046, .025, .014, .003)

  ADSL <- tibble::tibble( # nolint
    STUDYID = rep("AB12345", N),
    COUNTRY = sample_fct(
      c("CHN", "USA", "BRA", "PAK", "NGA", "RUS", "JPN", "GBR", "CAN", "CHE"),
      N,
      prob = country_site_prob
    ),
    SITEID = sample_fct(1:20, N, prob = rep(country_site_prob, times = 2)),
    SUBJID = paste("id", seq_len(N), sep = "-"),
    AGE = sapply(stats::rchisq(N, df = 5, ncp = 10), max, 0) + 20,
    AGEU = "YEARS",
    SEX = c("F", "M") %>% sample_fct(N, prob = c(.52, .48)),
    ARMCD = c("ARM A", "ARM B", "ARM C") %>% sample_fct(N),
    RACE = c(
      "ASIAN", "BLACK OR AFRICAN AMERICAN", "WHITE", "AMERICAN INDIAN OR ALASKA NATIVE",
      "MULTIPLE", "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER", "OTHER", "UNKNOWN"
    ) %>%
      sample_fct(N, prob = c(.55, .23, .16, .05, .004, .003, .002, .002)),
    TRTSDTM = as.POSIXct(
      sys_dtm + sample(seq(0, study_duration_secs), size = N, replace = TRUE),
      origin = "1970-01-01"
    ),
    RANDDT = as.Date(.data$TRTSDTM) - floor(stats::runif(N, min = 0, max = 5)),
    st_posixn = as.numeric(.data$TRTSDTM),
    TRTEDTM = as.POSIXct(.data$st_posixn + study_duration_secs, origin = "1970-01-01"),
    STRATA1 = c("A", "B", "C") %>% sample_fct(N),
    STRATA2 = c("S1", "S2") %>% sample_fct(N),
    BMRKR1 = stats::rchisq(N, 6),
    BMRKR2 = sample_fct(c("LOW", "MEDIUM", "HIGH"), N),
    BMEASIFL = sample_fct(c("Y", "N"), N),
    BEP01FL = sample_fct(c("Y", "N"), N),
    AEWITHFL = sample_fct(c("Y", "N"), N, prob = c(ae_withdrawal_prob, 1 - ae_withdrawal_prob))
  ) %>%
    dplyr::mutate(ARM = dplyr::recode(
      .data$ARMCD,
      "ARM A" = "A: Drug X", "ARM B" = "B: Placebo", "ARM C" = "C: Combination"
    )) %>%
    dplyr::mutate(ACTARM = .data$ARM) %>%
    dplyr::mutate(ACTARMCD = .data$ARMCD) %>%
    dplyr::mutate(TRT01P = .data$ARM) %>%
    dplyr::mutate(TRT01A = .data$ACTARM) %>%
    dplyr::mutate(ITTFL = factor("Y")) %>%
    dplyr::mutate(SAFFL = factor("Y")) %>%
    dplyr::arrange(.data$st_posixn)

  ADDS <- ADSL[sample(nrow(ADSL), discons), ] %>% # nolint
    dplyr::mutate(TRTEDTM_discon = as.POSIXct(
      sample(
        seq(from = max(.data$st_posixn), to = sys_dtm + study_duration_secs, by = 1),
        size = discons,
        replace = TRUE
      ),
      origin = "1970-01-01"
    )) %>%
    dplyr::select(.data$SUBJID, .data$st_posixn, .data$TRTEDTM_discon) %>%
    dplyr::arrange(.data$st_posixn)

  ADSL <- dplyr::left_join(ADSL, ADDS, by = c("SUBJID", "st_posixn")) %>% # nolint
    dplyr::mutate(TRTEDTM = dplyr::case_when(
      !is.na(TRTEDTM_discon) ~ as.POSIXct(TRTEDTM_discon, origin = "1970-01-01"),
      st_posixn >= quantile(st_posixn)[2] & st_posixn <= quantile(st_posixn)[3] ~ as.POSIXct(NA, origin = "1970-01-01"),
      TRUE ~ TRTEDTM
    )) %>%
    dplyr::mutate(TRTEDTM = as.POSIXct(.data$TRTEDTM, origin = "1970-01-01")) %>%
    dplyr::select(-.data$TRTEDTM_discon)

  ADSL <- ADSL %>% # nolint
    dplyr::mutate(EOSDT = as.Date(.data$TRTEDTM)) %>%
    dplyr::mutate(EOSDY = as.numeric(ceiling(difftime(.data$TRTEDTM, .data$TRTSDTM, units = "days")))) %>%
    dplyr::mutate(EOSSTT = dplyr::case_when(
      EOSDY == max(EOSDY, na.rm = TRUE) ~ "COMPLETED",
      EOSDY < max(EOSDY, na.rm = TRUE) ~ "DISCONTINUED",
      is.na(TRTEDTM) ~ "ONGOING"
    )) %>%
    dplyr::mutate(EOTSTT = .data$EOSSTT)

  # disposition related variables
  # using probability of 1 for the "DEATH" level to ensure at least one death record exists
  l_dcsreas <- list(
    choices = c(
      "ADVERSE EVENT", "DEATH", "LACK OF EFFICACY", "PHYSICIAN DECISION",
      "PROTOCOL VIOLATION", "WITHDRAWAL BY PARENT/GUARDIAN", "WITHDRAWAL BY SUBJECT"
    ),
    prob = c(.2, 1, .1, .1, .2, .1, .1)
  )
  l_dthcat_other <- list(
    choices = c(
      "Post-study reporting of death", "LOST TO FOLLOW UP", "MISSING", "SUICIDE", "UNKNOWN"
    ),
    prob = c(.1, .3, .3, .2, .1)
  )

  ADSL <- ADSL %>% # nolint
    dplyr::mutate(
      DCSREAS = ifelse(
        .data$EOSSTT == "DISCONTINUED",
        sample(x = l_dcsreas$choices, size = N, replace = TRUE, prob = l_dcsreas$prob),
        as.character(NA)
      )
    ) %>%
    dplyr::mutate(DTHFL = dplyr::case_when(
      DCSREAS == "DEATH" ~ "Y",
      TRUE ~ "N"
    )) %>%
    dplyr::mutate(
      DTHCAT = ifelse(
        .data$DCSREAS == "DEATH",
        sample(x = c("ADVERSE EVENT", "PROGRESSIVE DISEASE", "OTHER"), size = N, replace = TRUE),
        as.character(NA)
      )
    ) %>%
    dplyr::mutate(DTHCAUS = dplyr::case_when(
      DTHCAT == "ADVERSE EVENT" ~ "ADVERSE EVENT",
      DTHCAT == "PROGRESSIVE DISEASE" ~ "DISEASE PROGRESSION",
      DTHCAT == "OTHER" ~ sample(x = l_dthcat_other$choices, size = N, replace = TRUE, prob = l_dthcat_other$prob),
      TRUE ~ as.character(NA)
    )) %>%
    dplyr::mutate(ADTHAUT = dplyr::case_when(
      DTHCAUS %in% c("ADVERSE EVENT", "DISEASE PROGRESSION") ~ "Yes",
      DTHCAUS %in% c("UNKNOWN", "SUICIDE", "Post-study reporting of death") ~ sample(
        x = c("Yes", "No"), size = N, replace = TRUE, prob = c(0.25, 0.75)),
      TRUE ~ as.character(NA)
    )) %>%
    # adding some random number of days post last treatment date so that death days from last trt admin
    # supports the LDDTHGR1 derivation below
    dplyr::mutate(DTHDT = dplyr::case_when(
      DCSREAS == "DEATH" ~ as.Date(.data$TRTEDTM) + sample(0:50, size = N, replace = TRUE)
    )) %>%
    dplyr::mutate(LDDTHELD = as.numeric(.data$DTHDT - as.Date(.data$TRTEDTM))) %>%
    dplyr::mutate(LDDTHGR1 = dplyr::case_when(
      LDDTHELD <= 30 ~ "<=30",
      LDDTHELD > 30 ~ ">30",
      TRUE ~ as.character(NA)
    )) %>%
    dplyr::mutate(LSTALVDT = dplyr::case_when(
      DCSREAS == "DEATH" ~ DTHDT,
      TRUE ~ as.Date(.data$TRTEDTM) + floor(stats::runif(N, min = 10, max = 30))
    )) %>%
    dplyr::select(-.data$st_posixn)

  # add random ETHNIC (Ethnicity)
  ADSL <- ADSL %>% # nolint
    dplyr::mutate(ETHNIC = sample(
      x = c("HISPANIC OR LATINO", "NOT HISPANIC OR LATINO", " NOT REPORTED", "UNKNOWN"),
      size = N, replace = TRUE, prob = c(.1, .8, .06, .04)
    ))

  # associate DTHADY (Relative Day of Death) with Death date
  # Date of Death [ADSL.DTHDT] - date part of Date of First Exposure to Treatment [ADSL.TRTSDTM]

  ADSL <- ADSL %>% # nolint
    dplyr::mutate(DTHADY = as.numeric(.data$DTHDT - as.Date(.data$TRTSDTM)))


  # associate sites with countries and regions
  ADSL <- ADSL %>% # nolint
    dplyr::mutate(SITEID = paste0(.data$COUNTRY, "-", .data$SITEID)) %>%
    dplyr::mutate(REGION1 = dplyr::case_when(
      COUNTRY %in% c("NGA") ~ "Africa",
      COUNTRY %in% c("CHN", "JPN", "PAK") ~ "Asia",
      COUNTRY %in% c("RUS") ~ "Eurasia",
      COUNTRY %in% c("GBR") ~ "Europe",
      COUNTRY %in% c("CAN", "USA") ~ "North America",
      COUNTRY %in% c("BRA") ~ "South America",
      TRUE ~ as.character(NA)
    )) %>%
    dplyr::mutate(INVID = paste("INV ID", .data$SITEID)) %>%
    dplyr::mutate(INVNAM = paste("Dr.", .data$SITEID, "Doe")) %>%
    dplyr::mutate(USUBJID = paste(.data$STUDYID, .data$SITEID, .data$SUBJID, sep = "-")) %>%
    dplyr::mutate(study_duration_secs = study_duration_secs)

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADSL <- mutate_na(ds = ADSL, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  # apply metadata
  ADSL <- apply_metadata(ADSL, "metadata/ADSL.yml", FALSE) # nolint

  return(ADSL)
}
