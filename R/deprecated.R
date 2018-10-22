ct <- list(
  "SEX" = structure(
    setNames(c("F", "M", "U", "UNDIFFERENTIATED"), c("Female", "Male", "Unknown", "UNDIFFERENTIATED")),
    code = "C66731"
  ),
  "RACE" = structure(
    c(
      "BLACK OR AFRICAN AMERICAN",
      "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER",
      "AMERICAN INDIAN OR ALASKA NATIVE",
      "ASIAN",
      "WHITE"
    ),
    code = "C74457"
  )
)

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
    stringsAsFactors = TRUE
  ) %>% add_replace_variables(start_with)

  dm %>%
    mutate(ARMCD = ARM) %>%
    arrange(USUBJID, STUDYID)

}

#' Generate Dataset
#'
#' @param domain dataset domain
#' @param N number of pts
#' @param start_with named list with variable
#' @param ... arguments forwarded to data generation function
#' @param ADLS data set (to take USUBJID from)
#'
#' @export
#'
#' @examples
#'
#' DM <- rsdtm("DM")
#' ASL <- radam("ASL")
#' radam("ATE")
#' radam("ARS")
#'
radam <- function(domain, N = 100, ..., ADSL = NULL, start_with = list()) {

  cl <- match.call()

  data <- if (domain %in% c("ASL", "ADSL")) {

    if (is.null(ADSL)) adsl(N, ..., start_with = start_with) else ADLS

  } else {

    ADSL <- if (is.null(ADSL)) adsl(N) else ADSL

    switch(
      domain,
      ATE = ate(ADSL, ..., start_with = start_with),
      ARS = ars(ADSL, ..., start_with = start_with),
      AQS = aqs(ADSL, ..., start_with = start_with),
      ATR = atr(ADSL, ..., start_with = start_with),
      AAE = aae(ADSL, ..., start_with = start_with),
      stop("random dataset generator for ", domain, "has currently not been implemented")
    )

  }

  rownames(data) <- NULL
  attr(data, 'source') <- paste0(deparse(cl), collapse = "\n  ")
  data

}



#' Create a Random SDTM Dataset
#'
#' @export
#'
#' @examples
#' DM <- rsdtm("DM")
rsdtm <- function(domain, N = 100, ..., DM = NULL, start_with = list()) {

  cl <- match.call()

  data <- if (domain == "DM") {
    if (is.null(DM)) dm(N, start_with = start_with) else DM
  } else {
    switch(
      domain,
      stop("domain", domain, "is currently not implemented")
    )
  }

  attr(data, 'source') <- paste0(deparse(cl), collapse = "\n  ")
  data

}

as_length_N <- function(N, var_list) {

  lapply(var_list, function(var) {
    if (length(var) != N) sample(var, size = N, replace = TRUE) else var
  })

}


add_replace_variables <- function(df, var_list) {

  if (!is.list(var_list)) stop("var_list is not a list")

  var_listN <- as_length_N(nrow(df), var_list)


  for (i in seq_along(var_listN)) {
    df[[names(var_listN)[i]]] <- var_listN[[i]]
  }

  df

}


#' Generate ADSL dataset
#'
#'
#' @inheritParams radam
#' @param ... specific ADSL variables
#'
#'
#' @import dplyr
#'
#' @examples
#'
#' ASL <- radam("ASL")
#' head(ASL)
#'
#' ASL <- radam("ASL",
#'    start_with = list(
#'       BECOG = LETTERS[1:5],
#'       BAGED = sample(size = nrow(ASL), letters[1:5], replace = TRUE)
#'    )
#' )
#' head(ASL)
#'
adsl <- function(N, ..., DM = NULL, start_with = list()) {

  dm <- if(is.null(DM)) dm(N, ...) else DM

  ## add derived variables with mutate
  dm %>%
    add_replace_variables(start_with)

}


#' Time To Event Dataset
#'
#'
#' @examples
#'
#' radam("AQS")
aqs <- function(ADSL,
                FUN = function(p) {


                  PARAMCD <- c("BFIALL", "FATIGI", "FKSI-FWB", "FKSI-TSE", "FKSIALL")
                  PARAM <- c("BFI All Questions", "Fatigue Interference", "Function/Well-Being (GF1,GF3,GF7)",
                             "Treatment Side Effects (GP2,C5,GP5)", "FKSI-19 All Questions")

                  nvisits <- ceiling(runif(1) * 10 + 1 )

                  data.frame(
                    USUBJID = p$USUBJID,
                    STUDYID = p$STUDYID,
                    PARAMCD = rep(PARAMCD, each = nvisits),
                    PARAM = rep(PARAM, each = nvisits),
                    AVAL = rnorm(length(PARAM) * nvisits),
                    AVISIT = paste("WEEK", 1:nvisits),
                    AVISITN = rep(1:nvisits, length(PARAM)),
                    ABLFL =  rep(rep(c("Y", ""), c(1, nvisits - 1)), length(PARAM)),
                    APBFL = rep(rep(c("", "Y"), c(1, nvisits - 1)), length(PARAM)),
                    stringsAsFactors = FALSE
                  ) %>%
                    mutate(CHG = AVAL - AVAL[1], PCHG = CHG/AVAL[1])

                }, ..., start_with) {

  patient_info <- split(ADSL, ADSL$USUBJID)

  Reduce(rbind, lapply(patient_info, FUN)) %>%
    add_replace_variables(start_with) %>%
    arrange(USUBJID, STUDYID, PARAMCD, AVISITN)


}


#' Time To Event Dataset
#'
#'
#' @examples
#'
#' radam("AQS")
aqs <- function(ADSL,
                FUN = function(p) {


                  PARAMCD <- c("BFIALL", "FATIGI", "FKSI-FWB", "FKSI-TSE", "FKSIALL")
                  PARAM <- c("BFI All Questions", "Fatigue Interference", "Function/Well-Being (GF1,GF3,GF7)",
                             "Treatment Side Effects (GP2,C5,GP5)", "FKSI-19 All Questions")

                  nvisits <- ceiling(runif(1) * 10 + 1 )

                  data.frame(
                    USUBJID = p$USUBJID,
                    STUDYID = p$STUDYID,
                    PARAMCD = rep(PARAMCD, each = nvisits),
                    PARAM = rep(PARAM, each = nvisits),
                    AVAL = rnorm(length(PARAM) * nvisits),
                    AVISIT = paste("WEEK", 1:nvisits),
                    AVISITN = rep(1:nvisits, length(PARAM)),
                    ABLFL =  rep(rep(c("Y", ""), c(1, nvisits - 1)), length(PARAM)),
                    APBFL = rep(rep(c("", "Y"), c(1, nvisits - 1)), length(PARAM)),
                    stringsAsFactors = FALSE
                  ) %>%
                    mutate(CHG = AVAL - AVAL[1], PCHG = CHG/AVAL[1])

                }, ..., start_with) {

  patient_info <- split(ADSL, ADSL$USUBJID)

  Reduce(rbind, lapply(patient_info, FUN)) %>%
    add_replace_variables(start_with) %>%
    arrange(USUBJID, STUDYID, PARAMCD, AVISITN)


}


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
                    STUDYID = p$STUDYID,
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
                    stringsAsFactors = FALSE
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
    )) %>%
    arrange(USUBJID, STUDYID, PARAMCD)

}
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




#' Adverse Events Dataset
#'
#'
#' @examples
#'
#' radam("AAE")
aae <- function(ADSL, ..., start_with) {

  Reduce(
    rbind,
    lapply(split(ADSL[, c("STUDYID", "USUBJID")], ADSL$USUBJID), function(chunk) {

      sizen <- sample(1:10, 1)

      cbind(
        chunk,
        meddra[sample(1:nrow(meddra), sizen), c("AEBODSYS", "AEDECOD")],
        AETOXGR = sample(rep(1:5, sizen), sizen),
        row.names = NULL
      )
    })
  ) %>%
    add_replace_variables(start_with) %>%
    arrange(USUBJID, STUDYID)

}
