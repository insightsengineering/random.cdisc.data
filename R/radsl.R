#' Subject-Level Analysis Dataset (ADSL)
#'
#' The Subject-Level Analysis Data set (ADSL) is used to provide the variables
#' that describe attributes of a subject. ADSL is a source for subject-level
#' variables used in other analysis data sets, such as population flags and
#' treatment variables. There is only one ADSL per study. ADSL and its related
#' metadata are required in a CDISC-based submission of data from a clinical
#' trial even if no other analysis data sets are submitted.
#'
#' @details One record per subject
#'
#' Keys: STUDYID USUBJID
#'
#' @param N Number of patients.
#' @param seed Seed for random number generation.
#'
#' @import dplyr
#' @export
#'
#' @template return_data.frame
#'
#' @examples
#'
#' ADSL <- radsl()
#' head(ADSL)
#'
radsl <- function(N = 400, seed = NULL) {

  if (!is.null(seed)) set.seed(seed)

ADSL <-   tibble(
    SUBJID = paste("id", seq_len(N), sep = "-"),
    STUDYID = rep("AB12345", N),
    SITEID = paste0("XYZ", 1:2) %>% sample_fct(N),
    USUBJID = paste(STUDYID, SITEID, SUBJID, sep = "-"),
    AGE = sapply(floor(rnorm(N, mean = 20, sd = 20)), max, 0) + 20,
    SEX = c("F", "M", "U", "UNDIFFERENTIATED") %>% sample_fct(N, prob = c(.5, .48, .015, .005)),
    ARMCD = c("ARM A", "ARM B", "ARM C") %>%sample_fct(N),
    COUNTRY = c("BES", "CUW", "SXM", "AFG") %>% sample_fct(N),
    RACE = c("BLACK OR AFRICAN AMERICAN", "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER",
             "AMERICAN INDIAN OR ALASKA NATIVE", "ASIAN", "WHITE", "UNKNOWN",
             "OTHER", "MULTIPLE") %>%
      sample_fct(N),
    STRATA1 = c("A", "B", "C") %>% sample_fct(N),
    STRATA2 = c("S1", "S2") %>% sample_fct(N),
    BMRKR1 = rchisq(N, 6),
    BMRKR2 = c("low", "medium", "high") %>% sample_fct(N),
  ) %>%
    mutate(ARM = recode(ARMCD, "ARM A" = "A: Drug X", "ARM B" = "B: Placebo", "ARM C" = "C: Combination")) %>%
    mutate(ACTARM = ARM) %>%
    mutate(ACTARMCD = ARMCD)

    ## apply metadata
  ADSL <- apply_metadata(ADSL, "ADSL.yml", seed = seed, join_adsl = FALSE)

  ADSL

}
