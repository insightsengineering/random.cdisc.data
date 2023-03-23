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
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' ADSAFTTE <- radsaftte(ADSL, seed = 2)
#' ADSAFTTE
radsaftte <- function(ADSL,
                      ...) {
  radaette(ADSL = ADSL, ...)
}
