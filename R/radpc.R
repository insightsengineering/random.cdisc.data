
library(dplyr)
library(forcats)
ADSL <- radsl(N = 100, seed = 1, study_duration = 2)

radpc <- function(
  ADSL,
  avalu = "ug/mL",
  timepoints = c(0, 0.5, 1, 1.5 , 2)

){

  ADPC <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = factor(paste0(c("Plasma Drug X", "Plasma Drug Y"), "(", avalu, ")")),
    PCPTNUM = c(0, 0.5, 1, 1.5, 2, 3, 4, 8, 12, 24),
    stringsAsFactors = FALSE
  )

  ADPC <- ADSL[, c("STUDYID", "USUBJID", "ARMCD", "ARM", "AGE", "SEX")] %>%
    inner_join(ADPC, by = c("STUDYID", "USUBJID"))
  ADPC <- ADPC %>%
    mutate(
      VISITDY = case_when(
        PCPTNUM < 24 ~ 1,
        PCPTNUM >=24 & PCPTNUM < 48 ~ 2,
        PCPTNUM == 48 ~ 3,
        PCPTNUM == 72 ~ 4,
        TRUE ~ 8
      ),
      VISIT = paste("Day", VISITDY),
      PCPT = fct_reorder(factor(case_when(
        PCPTNUM == 0 ~ "Predose",
        TRUE ~ paste0(PCPTNUM, "H")
      )
      ), PCPTNUM),
      NRELTM1 = PCPTNUM,
      ARELTM1 = round(rnorm(n(), mean = PCPTNUM, sd = 0.1), 1),
      is_plasmay = case_when(
        grepl("Plasma Drug Y", ADPC$PARAM) ~ TRUE,
        TRUE ~ FALSE,
      ),
      substract = case_when(
        PCPTNUM == 3 ~ 2.5,
        PCPTNUM == 4 ~ 3,
        PCPTNUM == 8 ~ 3.5,
        PCPTNUM == 12 ~ 4,
        TRUE ~ 0
      ),
      AVAL = case_when(
        ARMCD == "ARM B" | (ARMCD == "ARM A" & grepl("Plasma Drug Y", PARAM)) ~ NA_real_,
        PCPT == "Predose" |  PCPTNUM == 24 ~ 0,
        TRUE ~ round(
          rnorm(n(), 50, 5) +  PCPTNUM * rnorm(n(), 25, 1) + is_plasmay * rnorm(n(), 25, 5) - substract * rnorm(n(), 25, 1),
          2
        )
      ),
      AVALC = factor(case_when(
        AVAL == NA_real_ ~ "NA",
        AVAL == 0 ~ "BLQ",
        TRUE ~ as.character(round(AVAL, 0))
      )
      ),
      AVALU = avalu,
      RELTMU = "hr"
    ) %>%
    select(-c(is_plasmay, substract))

}


a <- split(ADPC, ADPC$PARAM)

sum <- lapply(a, summary)


ggplot(data = ADPC, aes(x = PCPT, y = AVAL, fill = PARAM)) + geom_boxplot()
