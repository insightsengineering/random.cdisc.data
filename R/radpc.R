
library(dplyr)
ADSL <- radsl(N = 10, seed = 1, study_duration = 2)

radpc <- function(
  ADSL,
  avalu = "ug/mL",
  reltmu = "hr",
  timepoints = c(0, 0.5, 1, 1.5 , 2)

){

  ADPC <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PCPTNUM = timepoints,
    PARAM = paste0(c("Plasma Drug X", "Plasma Drug Y"), "(", avalu, ")"),
    stringsAsFactors = FALSE
  )

  ADPC <- ADSL[, c("STUDYID", "USUBJID", "ARMCD", "ARM", "AGE", "SEX")] %>%
    inner_join(ADPC, by = c("STUDYID", "USUBJID"))
  ADPC <- ADPC %>%
    mutate(
      PCPT = factor(case_when(
        PCPTNUM == 0 ~ "Predose",
        TRUE ~ paste0(PCPTNUM, "H")
      )
      ),
      AVAL = ifelse(
        ARMCD == "ARM B",  NA,
        ifelse(PCPTNUM == 0,  0,
               ifelse(grepl("Plasma Drug X", ADPC$PARAM),
                      rnorm(n(), 50, 5) + PCPTNUM * rnorm(n(), 25, 5),
                      ifelse(grepl("Plasma Drug Y", ADPC$PARAM) & ARMCD == "ARM A",
                                    NA,
                                    rnorm(n(), 80, 5) + PCPTNUM * rnorm(n(), 40, 5))
                             )
                      )

      )

    )

}


