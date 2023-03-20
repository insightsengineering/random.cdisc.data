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
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' ADSAFTTE <- radsaftte(ADSL, seed = 2)
#' ADSAFTTE
radsaftte <- function(ADSL, # nolint
                      ...) {
  radaette(ADSL = ADSL, ...)
}
