#' Time to Safety Event Analysis Dataset (ADSAFTTE)
#'
#' Function to generate random time to safety event dataset for a
#' given subject-level analysis dataset.
#'
#' @inheritParams radaette
#' @param ... Additional argument to be passed to \code{radaette}
#'
#' @export
#'
#' @examples
#'
#' ADSL <- suppressWarnings(radsl(N = 10, seed = 1, study_duration = 2))
#' radsaftte(ADSL, seed = 2)
radsaftte <- function(ADSL,
                      ...) {
  radaette(ADSL = ADSL, ...)
}
