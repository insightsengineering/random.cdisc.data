#' Generate a random ADSL dataset
#'
#' Function for generating random Subject-Level Analysis Dataset
#'
#' @details The Subject-Level Analysis Data set (ADSL) is used to provide
#'  the variables that describe attributes of a subject. ADSL is a source
#'  for subject-level variables used in other analysis data sets, such as
#'  population flags and treatment variables. There is only one ADSL per
#'  study. ADSL and its related metadata are required in a CDISC-based
#'  submission of data from a clinical trial even if no other analysis data
#'  sets are submitted.
#'
#' @param N number of patients
#' @param seed seed for random number generation
#'
#' @export
#' @return a data frame containing following attributes is returned:
#'  [,1] SUBJID (Subject Identification Number), \cr
#'  [,2] STUDYID (Study Identification Number), \cr
#'  [,3] SITEID (Site Identification Number),\cr
#'  [,4] USUBJID (Unique Subject Identifier),\cr
#'  [,5] AGE,\cr
#'  [,6] SEX, \cr
#'  [,7] ARMCD (Planned Arme Code),\cr
#'  [,8] COUNTRY, \cr
#'  [,9] RACE, \cr
#'  [,10] STRATA1 (Stratification Factor 1), \cr
#'  [,11] STRATA2 (Stratification Factor 2),\cr
#'  [,12] BMRKR1 (Cont. Biomarker 1),\cr
#'  [,13] BMRKR2 (Cat. Biomarker 2), \cr
#'  [,14] ARM (Description of Planned Arm),\cr
#'  [,15] ACTARM (Description of Actual Arm).\cr
#'
#' @examples
#'
#' ADSL <- radsl()
#' head(ADSL)
#'
radsl <- function(N = 400, seed = NULL) {

  if (!is.null(seed)) set.seed(seed)

  tibble(
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
    BMRKR2 = c("low", "medium", "high") %>% sample_fct(N)
  ) %>% mutate(
    ARM = recode(ARMCD, "ARM A" = "A: Drug X", "ARM B" = "B: Placebo", "ARM C" = "C: Combination"),
    ACTARM = ARMCD
  ) %>% var_relabel(
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier",
    SUBJID = "Subject Identifier for the Study",
    SITEID = "Study Site Identifier",
    AGE = "Age",
    SEX = "Sex",
    RACE = "Race",
    ARMCD = "Planned Arm Code",
    ARM = "Description of Planned Arm",
    ACTARM = "Description of Actual Arm",
    COUNTRY = "Country",
    BMRKR1 = "Cont. Biomarker 1",
    BMRKR2 = "Cat. Biomarker 2",
    STRATA1 = "Stratification Factor 1",
    STRATA2 = "Stratification Factor 2"
  )
}
