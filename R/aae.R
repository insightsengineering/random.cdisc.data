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
