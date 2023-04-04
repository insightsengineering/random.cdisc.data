#' Standard Arguments
#'
#' The documentation to this function lists all the arguments in `random.cdisc.data`
#' that are used repeatedly in dataset creation.
#'
#' @param seed (`numeric`)\cr Seed to use for reproducible random number generation.
#' @param na_percentage (`proportion`)\cr Default percentage of values to be replaced by `NA`.
#' @param na_vars (`list`)\cr A named list where the name of each element is a column name of `ds`. Each
#' element of this list should be a numeric vector with two elements:
#' \itemize{
#'   \item{`seed` (`numeric`)\cr The seed to be used for this element - can be `NA`.}
#'   \item{`percentage` (`proportion`)\cr Percentage of elements to be replaced with `NA`.
#'   If `NA`, `na_percentage` is used as a default.}
#' }
#' @param adsl (`data.frame`)\cr Subject-Level Analysis Dataset (ADSL).
#' @param lookup (`data.frame`)\cr Additional parameters.
#' @param lookup_aag (`data.frame`)\cr Additional metadata parameters.
#' @param param (`character vector`)\cr Parameter values.
#' @param paramcd (`character vector`)\cr Parameter code values.
#' @param paramu (`character vector`)\cr Parameter unit values.
#' @param visit_format (`character`)\cr Type of visit. Options are "WEEK" and "CYCLE".
#' @param n_assessments (`integer`)\cr Number of weeks or cycles.
#' @param n_days (`integer`)\cr Number of days in each cycle (only used if `visit_format` is "CYCLE").
#' @param aval_mean (`numeric vector`)\cr Mean values corresponding to each parameter.
#'
#' @keywords internal
#' @name argument_convention
NULL
