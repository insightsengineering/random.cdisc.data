#' Time To Event Dataset
#'
#'
#' @examples
#'
#' radam("ATE")
ate <- function(ADSL,
                FUN = function(p) {
                  PARAMCD <- c("OS", "PFS")
                  PARAM <- c("Overall Survival", "Progression Free Survival")

                  data.frame(
                    USUBJID = p$USUBJID,
                    PARAMCD = PARAMCD,
                    PARAM = PARAM,
                    AVAL = vapply(PARAMCD, function(paramcd) {
                      switch(
                        paramcd,
                        "OS" = ifelse(p$ARM == "ARM A", rexp(1, 1/100), rexp(1, 1/80)),
                        "PFS" = ifelse(p$ARM == "ARM A", rexp(1, 1/80), rexp(1, 1/65))
                      )
                    }, numeric(1)),
                    AVALU = "MONTH",
                    CNSR = sample(c(T,F), length(PARAMCD), replace = TRUE),
                    stringsAsFactors = TRUE
                  )
                }, ..., start_with) {

  patient_info <- split(ADSL, ADSL$USUBJID)

  Reduce(rbind, lapply(patient_info, FUN)) %>%
   add_replace_variables(start_with) %>%
    mutate(EVNTDESC = ifelse(
      CNSR == 1,
      sample(
        c("Last tumor assessment", "Alive", "Randomization", "Disease Progression or Death Censored for Missing Visits"),
        n(), TRUE
      ),
      sample(
        c("Death", "First Response", "Disease Progression"),
        n(), TRUE
      )
    ))

}
