
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
