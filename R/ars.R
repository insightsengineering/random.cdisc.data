

ars <- function(ADSL,
                FUN = function(p) {
                  PARAMCD <- c("BESRSPI", "OVRINV", "OVRSPI")
                  PARAM <- c("label BESRSPI", "label OVRINV", "OVRSPI")

                  data.frame(
                    USUBJID = p$USUBJID,
                    STUDYID = p$STUDYID,
                    PARAMCD = PARAMCD,
                    PARAM = PARAM,
                    AVALC = vapply(PARAMCD, function(paramcd) {
                      switch(
                        paramcd,
                        sample(c("CR", "PD", "PR", "SD", "NE"), 1)
                      )
                    }, character(1)),
                    stringsAsFactors = FALSE
                  ) %>% mutate(
                    AVAL = recode(AVALC, "CR" = 1, "PD" = 5, "PR" = 2, "SD" = 3, "NE" = 6)
                  )
                }, ..., start_with) {

  patient_info <- split(ADSL, ADSL$USUBJID)

  Reduce(rbind, lapply(patient_info, FUN)) %>%
    add_replace_variables(start_with) %>%
    arrange(USUBJID, STUDYID, PARAMCD)

}
