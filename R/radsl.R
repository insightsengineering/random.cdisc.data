#' Subject-Level Analysis Dataset (ADSL)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' The Subject-Level Analysis Dataset (ADSL) is used to provide the variables
#' that describe attributes of a subject. ADSL is a source for subject-level
#' variables used in other analysis data sets, such as population flags and
#' treatment variables. There is only one ADSL per study. ADSL and its related
#' metadata are required in a CDISC-based submission of data from a clinical
#' trial even if no other analysis data sets are submitted.
#'
#' @details One record per subject.
#'
#' Keys: `STUDYID`, `USUBJID`
#'
#' @inheritParams argument_convention
#' @param N (`numeric`)\cr Number of patients.
#' @param study_duration (`numeric`)\cr Duration of study in years.
#' @param with_trt02 (`logical`)\cr Should period 2 be added.
#' @param ae_withdrawal_prob (`proportion`)\cr Probability that there is at least one
#' Adverse Event leading to the withdrawal of a study drug.
#' @template param_cached
#' @templateVar data adsl
#'
#' @return `data.frame`
#' @export
#
#' @examples
#' library(random.cdisc.data)
#'
#' adsl <- radsl(N = 10, study_duration = 2, seed = 1)
#' adsl
#'
#' adsl <- radsl(
#'   N = 10, seed = 1,
#'   na_percentage = 0.1,
#'   na_vars = list(
#'     DTHDT = c(seed = 1234, percentage = 0.1),
#'     LSTALVDT = c(seed = 1234, percentage = 0.1)
#'   )
#' )
#' adsl
#'
#' adsl <- radsl(N = 10, seed = 1, na_percentage = .1)
#' adsl
radsl <- function(N = 400, # nolint
                  study_duration = 2,
                  seed = NULL,
                  with_trt02 = TRUE,
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
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1, na.ok = TRUE)
  checkmate::assert_number(study_duration, lower = 1)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  if (!is.null(seed)) {
    set.seed(seed)
  }

  study_duration_secs <- lubridate::seconds(lubridate::years(study_duration))
  sys_dtm <- lubridate::fast_strptime("20/2/2019 11:16:16.683", "%d/%m/%Y %H:%M:%OS")
  discons <- max(1, floor((N * .3)))
  country_site_prob <- c(.5, .121, .077, .077, .075, .052, .046, .025, .014, .003)

  adsl <- tibble::tibble(
    STUDYID = rep("AB1234", N),
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
    TRTSDTM = sys_dtm + sample(seq(0, study_duration_secs), size = N, replace = TRUE),
    RANDDT = lubridate::date(TRTSDTM - lubridate::days(floor(stats::runif(N, min = 0, max = 5)))),
    TRTEDTM = TRTSDTM + study_duration_secs,
    STRATA1 = c("A", "B", "C") %>% sample_fct(N),
    STRATA2 = c("S1", "S2") %>% sample_fct(N),
    BMRKR1 = stats::rchisq(N, 6),
    BMRKR2 = sample_fct(c("LOW", "MEDIUM", "HIGH"), N),
    BMEASIFL = sample_fct(c("Y", "N"), N),
    BEP01FL = sample_fct(c("Y", "N"), N),
    AEWITHFL = sample_fct(c("Y", "N"), N, prob = c(ae_withdrawal_prob, 1 - ae_withdrawal_prob))
  ) %>%
    dplyr::mutate(ARM = dplyr::recode(
      ARMCD,
      "ARM A" = "A: Drug X", "ARM B" = "B: Placebo", "ARM C" = "C: Combination"
    )) %>%
    dplyr::mutate(ACTARM = ARM) %>%
    dplyr::mutate(ACTARMCD = ARMCD) %>%
    dplyr::mutate(TRT01P = ARM) %>%
    dplyr::mutate(TRT01A = ACTARM) %>%
    dplyr::mutate(ITTFL = factor("Y")) %>%
    dplyr::mutate(SAFFL = factor("Y")) %>%
    dplyr::arrange(TRTSDTM)

  adds <- adsl[sample(nrow(adsl), discons), ] %>%
    dplyr::mutate(TRTEDTM_discon = sample(
      seq(from = max(TRTSDTM), to = sys_dtm + study_duration_secs, by = 1),
      size = discons,
      replace = TRUE
    )) %>%
    dplyr::select(SUBJID, TRTSDTM, TRTEDTM_discon) %>%
    dplyr::arrange(TRTSDTM)

  adsl <- dplyr::left_join(adsl, adds, by = c("SUBJID", "TRTSDTM")) %>%
    dplyr::mutate(TRTEDTM = dplyr::case_when(
      !is.na(TRTEDTM_discon) ~ TRTEDTM_discon,
      TRTSDTM >= quantile(TRTSDTM)[2] & TRTSDTM <= quantile(TRTSDTM)[3] ~ lubridate::as_datetime(NA),
      TRUE ~ TRTEDTM
    )) %>%
    dplyr::select(-"TRTEDTM_discon")

  # add period 2 if needed
  if (with_trt02) {
    with_trt02 <- lubridate::seconds(lubridate::years(1))
    adsl <- adsl %>%
      dplyr::mutate(TRT02P = sample(ARM)) %>%
      dplyr::mutate(TRT02A = sample(ACTARM)) %>%
      dplyr::mutate(
        TRT01SDTM = TRTSDTM,
        AP01SDTM = TRT01SDTM,
        TRT01EDTM = TRTEDTM,
        AP01EDTM = TRT01EDTM,
        TRT02SDTM = TRTEDTM,
        AP02SDTM = TRT02SDTM,
        TRT02EDTM = TRT01EDTM + with_trt02,
        AP02EDTM = TRT02EDTM,
        TRTEDTM = TRT02EDTM
      )
  }

  adsl <- adsl %>%
    dplyr::mutate(EOSDT = lubridate::date(TRTEDTM)) %>%
    dplyr::mutate(EOSDY = ceiling(difftime(TRTEDTM, TRTSDTM))) %>%
    dplyr::mutate(EOSSTT = dplyr::case_when(
      EOSDY == max(EOSDY, na.rm = TRUE) ~ "COMPLETED",
      EOSDY < max(EOSDY, na.rm = TRUE) ~ "DISCONTINUED",
      is.na(TRTEDTM) ~ "ONGOING"
    )) %>%
    dplyr::mutate(EOTSTT = EOSSTT)

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

  adsl <- adsl %>%
    dplyr::mutate(
      DCSREAS = ifelse(
        EOSSTT == "DISCONTINUED",
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
        DCSREAS == "DEATH",
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
        x = c("Yes", "No"), size = N, replace = TRUE, prob = c(0.25, 0.75)
      ),
      TRUE ~ as.character(NA)
    )) %>%
    # adding some random number of days post last treatment date so that death days from last trt admin
    # supports the LDDTHGR1 derivation below
    dplyr::mutate(DTHDT = dplyr::case_when(
      DCSREAS == "DEATH" ~ lubridate::date(TRTEDTM + lubridate::days(sample(0:50, size = N, replace = TRUE))),
      TRUE ~ NA
    )) %>%
    dplyr::mutate(LDDTHELD = difftime(DTHDT, lubridate::date(TRTEDTM), units = "days")) %>%
    dplyr::mutate(LDDTHGR1 = dplyr::case_when(
      LDDTHELD <= 30 ~ "<=30",
      LDDTHELD > 30 ~ ">30",
      TRUE ~ as.character(NA)
    )) %>%
    dplyr::mutate(LSTALVDT = dplyr::case_when(
      DCSREAS == "DEATH" ~ DTHDT,
      TRUE ~ lubridate::date(TRTEDTM) + lubridate::days(floor(stats::runif(N, min = 10, max = 30)))
    ))

  # add random ETHNIC (Ethnicity)
  adsl <- adsl %>%
    dplyr::mutate(ETHNIC = sample(
      x = c("HISPANIC OR LATINO", "NOT HISPANIC OR LATINO", " NOT REPORTED", "UNKNOWN"),
      size = N, replace = TRUE, prob = c(.1, .8, .06, .04)
    ))

  # associate DTHADY (Relative Day of Death) with Death date
  # Date of Death [adsl.DTHDT] - date part of Date of First Exposure to Treatment [adsl.TRTSDTM]

  adsl <- adsl %>%
    dplyr::mutate(DTHADY = difftime(DTHDT, TRTSDTM, units = "days"))


  # associate sites with countries and regions
  adsl <- adsl %>%
    dplyr::mutate(SITEID = paste0(COUNTRY, "-", SITEID)) %>%
    dplyr::mutate(REGION1 = dplyr::case_when(
      COUNTRY %in% c("NGA") ~ "Africa",
      COUNTRY %in% c("CHN", "JPN", "PAK") ~ "Asia",
      COUNTRY %in% c("RUS") ~ "Eurasia",
      COUNTRY %in% c("GBR") ~ "Europe",
      COUNTRY %in% c("CAN", "USA") ~ "North America",
      COUNTRY %in% c("BRA") ~ "South America",
      TRUE ~ as.character(NA)
    )) %>%
    dplyr::mutate(INVID = paste("INV ID", SITEID)) %>%
    dplyr::mutate(INVNAM = paste("Dr.", SITEID, "Doe")) %>%
    dplyr::mutate(USUBJID = paste(STUDYID, SITEID, SUBJID, sep = "-"))


  if (length(na_vars) > 0 && na_percentage > 0) {
    adsl <- mutate_na(ds = adsl, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  adsl <- apply_metadata(adsl, "metadata/ADSL.yml", FALSE)

  attr(adsl, "study_duration_secs") <- as.numeric(study_duration_secs)
  return(adsl)
}
