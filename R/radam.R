
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
