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
#' @param seed Seed for random number generation.s
#' @inheritParams mutate_na
#' @templateVar data adsl
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @importFrom dplyr mutate
#' @importFrom magrittr %>%
#' @importFrom stats rchisq reorder rexp rnorm runif setNames
#' @importFrom tibble tibble
#'
#' @export
#'
#' @examples
#' ADSL <- radsl(N = 10, seed = 1)
#' head(ADSL)
radsl <- function(N = 400, # nolint
                  seed = NULL,
                  cached = FALSE,
                  na_percentage = 0,
    na_vars = list("AGE" = NA, "SEX" = NA, "RACE" = NA, "STRATA1" = NA, "STRATA2" = NA,
        "BMRKR1" = c(seed = 1234, percentage = 0.1), "BMRKR2" = c(1234, 0.1), "BEP01FL" = NA)) {

  stopifnot(is.logical.single(cached))
  if (cached) {
    return(get_cached_data("cadsl"))
  }

  stopifnot(is.numeric.single(N))
  stopifnot(is.null(seed) || is.numeric.single(seed))

  if (!is.null(seed)) {
    set.seed(seed)
  }

  country_site_prob <- c(.5, .121, .077, .077, .075, .052, .046, .025, .014, .003)

  ADSL <- tibble( # nolint
    STUDYID = rep("AB12345", N),
    COUNTRY = sample_fct(
      c("CHN", "USA", "BRA", "PAK", "NGA", "RUS", "JPN", "GBR", "CAN", "CHE"),
      N, prob = country_site_prob
    ),
    SITEID = sample_fct(1:20, N,  prob = rep(country_site_prob, times = 2)),
    SUBJID = paste("id", seq_len(N), sep = "-"),
    AGE = pmax(floor(rnorm(N, mean = 20, sd = 20)), 0) + 20,
    SEX = sample_fct(c("F", "M", "U", "UNDIFFERENTIATED"), N, prob = c(.5, .48, .015, .005)),
    ARMCD = sample_fct(c("ARM A", "ARM B", "ARM C"), N),
    RACE = sample_fct(
      c("ASIAN", "BLACK OR AFRICAN AMERICAN", "WHITE", "AMERICAN INDIAN OR ALASKA NATIVE",
        "MULTIPLE", "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER", "OTHER", "UNKNOWN"),
      N,
      prob = c(.55, .23, .16, .05, .004, .003, .002, .002)
    ),
    STRATA1 = sample_fct(c("A", "B", "C"), N),
    STRATA2 = sample_fct(c("S1", "S2"), N),
    BMRKR1 = rchisq(N, 6),
    BMRKR2 = sample_fct(c("LOW", "MEDIUM", "HIGH"), N),
    BEP01FL = sample_fct(c("Y", "N"), N)
  ) %>%
    mutate(ARM = recode(ARMCD, "ARM A" = "A: Drug X", "ARM B" = "B: Placebo", "ARM C" = "C: Combination")) %>%
    mutate(ACTARM = ARM) %>%
    mutate(ACTARMCD = ARMCD) %>%
    mutate(ITTFL = "Y")

  # associate sites with countries
  ADSL <- ADSL %>% # nolint
    mutate(SITEID = paste0(COUNTRY, "-", SITEID)) %>%
    mutate(USUBJID = paste(STUDYID, SITEID, SUBJID, sep = "-"))

  if (na_percentage > 0 && na_percentage <= 1) {
    ADSL <- mutate_na(ds = ADSL, na_vars = na_vars, na_percentage = na_percentage) #nolint
  }
  apply_metadata(ADSL, "metadata/ADSL.yml", seed = seed)
}
