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
