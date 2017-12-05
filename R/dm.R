#' Generate DM dataset
#'
#'
dm <- function(N, ..., start_with = list()) {

  # standard dm
  dm <- data.frame(
    USUBJID = paste0("id-", 1:N),
    STUDYID = "STUDY A",
    BAGE = 10 + ceiling(abs(rnorm(N, mean = 30, sd = 15))),
    SEX = sample(ct[["SEX"]], N, TRUE, prob = c(.499, .499, .001, .001)), # C66731
    ARM = sample(c("ARM A", "ARM B"), N, replace = TRUE),
    stringsAsFactors = FALSE
  ) %>% add_replace_variables(start_with)

  dm %>%
    mutate(ARMCD = ARM)


}
