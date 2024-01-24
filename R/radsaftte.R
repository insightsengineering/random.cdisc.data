#' Time to Safety Event Analysis Dataset (ADSAFTTE)
#'
#' Function to generate random Time-to-Safety Event Dataset for a
#' given Subject-Level Analysis Dataset.
#'
#' @details
#'
#' Keys: `STUDYID`, `USUBJID`, `PARAMCD`
#'
#' @inheritParams radaette
#' @param ... Additional arguments to be passed to `radaette`
#'
#' @return `data.frame`
#' @export
#'
#' @examples
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' adsaftte <- radsaftte(adsl, seed = 2)
#' adsaftte
radsaftte <- function(adsl,
                      ...) {
  radaette(adsl = adsl, ...)
}
