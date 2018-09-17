#' Create a factor with random elements of x
#'
#' Sample elements from x with replacing and build a factor
#'
#'
#' @param x character vector or factor, if character vector then it is also used
#'   as levels of the returned factor, otherwise if it is a factor then the
#'   levels get used as the new levels
#' @param N number of
#' @param ... arguments passed on to \code{\link{sample}}
#'
#'
#' @return a factor of length N
#'
#' @export
#'
#' @examples
#'
#' sample_fct(letters[1:3], 10)
#'
#' sample_fct(iris$Species, 10)
#'
sample_fct <- function(x, N, ...) {
  factor(sample(x, N, replace = TRUE, ...), levels = if (is.factor(x)) levels(x) else x)
}
