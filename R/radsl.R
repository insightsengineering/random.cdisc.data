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
#' @param cashed Whether to use cashed data
#'
#' @template return_data.frame
#'
#' @import dplyr
#' @importFrom stats rchisq reorder rexp rnorm runif setNames
#' @importFrom tibble tibble
#'
#' @export
#'
#' @examples
#' ADSL <- radsl(N = 10, seed = 1)
#' head(ADSL)
#'
#' attr(ADSL, "label") # or also tern::label(ADSL)
#'
radsl <- function(N = 400, seed = NULL, cached = isTRUE(getOption("random.cdisc.data.cached"))) {

  if (cached) {
    data(adsl, envir = environment())
    return(adsl)
  }

  if (!is.null(seed)) set.seed(seed)

  country_site_prob <- c(.5, .121, .077, .077, .075, .052, .046, .025, .014, .003)

  ADSL <- tibble(
    STUDYID = rep("AB12345", N),
    COUNTRY = c("CHN", "USA", "BRA", "PAK", "NGA", "RUS", "JPN", "GBR", "CAN", "CHE") %>%
      sample_fct(N, prob = country_site_prob),
    SITEID = 1:20 %>%
      sample_fct(N,  prob = rep(country_site_prob, times = 2)),
    SUBJID = paste("id", seq_len(N), sep = "-"),
    AGE = sapply(floor(rnorm(N, mean = 20, sd = 20)), max, 0) + 20,
    SEX = c("F", "M", "U", "UNDIFFERENTIATED") %>% sample_fct(N, prob = c(.5, .48, .015, .005)),
    ARMCD = c("ARM A", "ARM B", "ARM C") %>%sample_fct(N),
    RACE = c("ASIAN", "BLACK OR AFRICAN AMERICAN", "WHITE", "AMERICAN INDIAN OR ALASKA NATIVE",
             "MULTIPLE", "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER", "OTHER", "UNKNOWN") %>%
      sample_fct(N, prob = c(.55, .23, .16, .05, .004, .003, .002, .002)),
    STRATA1 = c("A", "B", "C") %>% sample_fct(N),
    STRATA2 = c("S1", "S2") %>% sample_fct(N),
    BMRKR1 = rchisq(N, 6),
    BMRKR2 = c("LOW", "MEDIUM", "HIGH") %>% sample_fct(N),
    BEP01FL = c("Y", "N") %>% sample_fct(N)
  ) %>%
    mutate(ARM = recode(ARMCD, "ARM A" = "A: Drug X", "ARM B" = "B: Placebo", "ARM C" = "C: Combination")) %>%
    mutate(ACTARM = ARM) %>%
    mutate(ACTARMCD = ARMCD) %>%
    mutate(ITTFL = "Y")

  # associate sites with countries
  ADSL <- ADSL %>%
    mutate(SITEID = paste0(COUNTRY, "-", SITEID)) %>%
    mutate(USUBJID = paste(STUDYID, SITEID, SUBJID, sep = "-"))

  # apply metadata
  ADSL <- apply_metadata(ADSL, "metadata/ADSL.yml", seed = seed)

  ADSL

}
