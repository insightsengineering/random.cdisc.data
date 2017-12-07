#' Generate DM dataset
#'
#'
dm <- function(N, arm_choices = c("ARM A", "ARM B"), start_with = list()) {

  # standard dm
  dm <- data.frame(
    USUBJID = paste0("id-", 1:N),
    STUDYID = "STUDY A",
    BAGE = 10 + ceiling(abs(rnorm(N, mean = 30, sd = 15))),
    SEX = sample(ct[["SEX"]], N, TRUE, prob = c(.499, .499, .001, .001)), # C66731
    ARM = sample(arm_choices, N, replace = TRUE),
    RACE = sample(ct[["RACE"]], N, TRUE),
    stringsAsFactors = FALSE
  ) %>% add_replace_variables(start_with)

  dm %>%
    mutate(ARMCD = ARM) %>%
    arrange(USUBJID, STUDYID)

}
