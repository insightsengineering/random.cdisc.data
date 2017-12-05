
#' Generate Dataset
#'
#' @param domain dataset domain
#' @param N number of rows
#' @param add_replace_vars list of variables that should be added or replaced after
#'   the default creation of the dataset
#' @param ... arguments forwarded to data generation function
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


  data <- if (domain %in% c("ASL", "ADSL")) {

    if (is.null(ADSL)) adsl(N, ..., start_with = start_with) else ADLS

  } else {

    ADSL <-  adsl(N)

    switch(
      domain,
      ATE = ate(ADSL, ..., start_with = start_with),
      ARS = ars(ADSL, ..., start_with = start_with),
      AQS = aqs(ADSL, ..., start_with = start_with),
      stop("random dataset generator for ", domain, "has currently not been implemented")
    )

  }

  rownames(data) <- NULL
  data

}
