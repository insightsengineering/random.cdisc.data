#' Measurements Dataset
#'
#' This is reflecting measurement data used in SPA ed(pRed)
#'
#' @examples
#'
#' radam("ATR")
#' min(rlnorm(100, 1.2))
#'
atr <- function(ADSL,
                FUN = function(p) {
                  PARAMCD <- c("LDIAM", "SUMTGLES")
                  PARAM <- c("Longest Diameter", "Sum of Target Lesions")

                  data.frame(
                    USUBJID = p$USUBJID,
                    STUDYID = p$STUDYID,
                    PARAMCD = PARAMCD,
                    PARAM = PARAM,
                    AVAL = vapply(PARAMCD, function(paramcd) {
                      switch(
                        paramcd,
                        "LDIAM" = ifelse(p$ARM == "ARM A", rlnorm(1, 1), rlnorm(1, 1.2)),
                        "SUMTGLES" = ifelse(p$ARM == "ARM A", rlnorm(1, 2), rlnorm(1, 2.2))
                      )
                    }, numeric(1)),
                    AVALU = "mm",
                    stringsAsFactors = FALSE
                  )
                }, ..., start_with) {

  patient_info <- rep(split(ADSL, ADSL$USUBJID),4)

  Reduce(rbind, lapply(patient_info, FUN)) %>%
    add_replace_variables(start_with) %>%
    arrange(USUBJID, STUDYID, PARAMCD) %>% group_by(USUBJID,PARAMCD) %>% mutate(BASE = first(AVAL)) %>%
    mutate(PCHG = (AVAL-BASE)/BASE) %>% mutate(TUDY = c(0,10,19,37))  %>% ungroup() %>% arrange(USUBJID, STUDYID, PARAMCD)
}

