#' Load cached data
#'
#' Return data attached to package
#'
#' @noRd
get_cached_data <- function(dataname) {
  checkmate::assert_string(dataname)
  if (!("package:random.cdisc.data" %in% search())) {
    stop("cached data can only be loaded if the random.cdisc.data package is attached.",
         "Please run library(random.cdisc.data) before loading cached data.", call. = FALSE)
  } else {
    get(dataname, envir = asNamespace("random.cdisc.data"))
  }
}

#' Create a factor with random elements of x
#'
#' Sample elements from x with replacing and build a factor
#'
#' @param x character vector or factor, if character vector then it is also used
#'   as levels of the returned factor, otherwise if it is a factor then the
#'   levels get used as the new levels
#' @param N number of
#' @param ... arguments passed on to \code{\link{sample}}
#'
#' @return a factor of length N
#'
#' @examples
#' random.cdisc.data:::sample_fct(letters[1:3], 10)
#' random.cdisc.data:::sample_fct(iris$Species, 10)
sample_fct <- function(x, N, ...) { # nolint
  checkmate::assert_numeric(N, len = 1, any.missing = FALSE)

  factor(sample(x, N, replace = TRUE, ...), levels = if (is.factor(x)) levels(x) else x)
}

#' Related variables: initialize
#'
#' Verify and initialize related variable values
#'
#' @param relvar1 as character string. list of n elements.
#' @param relvar2 as character string. list of n elements.
#'
#' @return a vector of n elements
#'
#' @examples
#' random.cdisc.data:::relvar_init("Alanine Aminotransferase Measurement", "ALT")
#' random.cdisc.data:::relvar_init("Alanine Aminotransferase Measurement", "U/L")
relvar_init <- function(relvar1, relvar2) {
  checkmate::assert_character(relvar1, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(relvar2, min.len = 1, any.missing = FALSE)

  if (length(relvar1) != length(relvar2)) {
    message(simpleError(
      "The argument value length of relvar1 and relvar2 differ. They must contain the same number of elements."
    ))
    return(NA)
  }
  return(list("relvar1" = relvar1, "relvar2" = relvar2))
}

#' Related variables: assign
#'
#' Assign values to a related variable within a domain
#'
#' @param df data frame containing the related variables.
#' @param var_name related to variable name.
#' @param var_values values of related to variable.
#' @param related_var variable name with existing values to which var_name values must relate.
#'
#' @examples
#' # Example with data.frame.
#' params <- c("Level A", "Level B", "Level C")
#' ADLB_df <- data.frame(
#'   ID = 1:9,
#'   PARAM = factor(
#'     rep(c("Level A", "Level B", "Level C"), 3),
#'     levels = params
#'    )
#' )
#' random.cdisc.data:::rel_var(
#'   df = ADLB_df,
#'   var_name = "PARAMCD",
#'   var_values = c("A", "B", "C"),
#'   related_var = "PARAM"
#' )
#'
#' # Example with tibble.
#' ADLB_tbl <- tibble::tibble(
#'   ID = 1:9,
#'   PARAM = factor(
#'     rep(c("Level A", "Level B", "Level C"), 3),
#'     levels = params
#'    )
#' )
#' random.cdisc.data:::rel_var(
#'   df = ADLB_tbl,
#'   var_name = "PARAMCD",
#'   var_values = c("A", "B", "C"),
#'   related_var = "PARAM"
#' )
#'
rel_var <- function(df = NULL, var_name = NULL, var_values = NULL, related_var = NULL) {
  stopifnot(is.null(df) || is.data.frame(df))
  checkmate::assert_string(var_name, null.ok = TRUE)
  checkmate::assert_character(var_values, null.ok = TRUE, min.len = 1, any.missing = FALSE)
  checkmate::assert_string(related_var, null.ok = TRUE)

  if (is.null(df)) {
    message("Missing data frame argument value.")
    return(NA)
  } else{
    n_relvar1 <- length(unique(df[, related_var, drop = TRUE]))
    n_relvar2 <- length(var_values)
    if (n_relvar1 != n_relvar2) {
      message(paste("Unequal vector lengths for", related_var, "and", var_name))
      return(NA)
    } else {
      relvar1 <- unique(df[, related_var, drop = TRUE])
      relvar2_values <- rep(NA, nrow(df))
      for (r in seq_len(length(relvar1))) {
        matched <- which(df[, related_var, drop = TRUE] == relvar1[r])
        relvar2_values[matched] <- var_values[r]
      }
      return(relvar2_values)
    }
  }
}

#' Create visit schedule
#'
#' Create a visit schedule as factor.
#'
#' X number of visits or X number of cycles and Y number of days.
#'
#' @param visit_format as character string. Valid values: WEEK, CYCLE.
#' @param n_assessments number of assessments. Valid values: integer.
#' @param n_days number of days for each cycle: Valid values: integer.
#'
#' @return a factor of length n_assessments
#'
#' @examples
#' random.cdisc.data:::visit_schedule(visit_format = "WEeK", n_assessments = 10L)
#' random.cdisc.data:::visit_schedule(visit_format = "CyCLE", n_assessments = 5L, n_days = 2L)
visit_schedule <- function(visit_format = "WEEK",
                           n_assessments = 10L,
                           n_days = 5L) {

  checkmate::assert_string(visit_format)
  checkmate::assert_integer(n_assessments, len = 1, any.missing = FALSE)
  checkmate::assert_integer(n_days, len = 1, any.missing = FALSE)

  # trap invalid assessment format
  if (!(toupper(visit_format) %in% c("WEEK", "CYCLE"))) {
    message("Visit format value must either be: WEEK or CYCLE")
    return(NA)
  }

  if (toupper(visit_format) == "WEEK") {
    # numeric vector of n assessments/cycles/days
    assessments <- 1:n_assessments
    # numeric vector for ordering including screening (-1) and baseline (0) place holders
    assessments_ord <- -1:n_assessments
    # character vector of nominal visit values
    visit_values <- c("SCREENING", "BASELINE", paste(toupper(visit_format), assessments, "DAY", (assessments * 7) + 1))
  } else if (toupper(visit_format) == "CYCLE") {
    cycles <- sort(rep(1:n_assessments, times = 1, each = n_days))
    days <- rep(seq(1:n_days), times = n_assessments, each = 1)
    assessments_ord <- 0:(n_assessments * n_days)
    visit_values <- c("SCREENING", paste(toupper(visit_format), cycles, "DAY", days))
  }

  # create and order factor variable to return from function
  visit_values <- stats::reorder(factor(visit_values), assessments_ord)
}

#' Primary keys: retain values
#'
#' Retain values within primary keys
#'
#' @param df data frame in which to apply the retain.
#' @param value_var variable containing the value to be retained.
#' @param event flag to trigger the retain.
#' @param outside value to.
#'
#' @examples
#' ADLB <- radlb(radsl(N = 10, na_percentage = 0), na_vars = list())
#' ADLB$BASE2 <- random.cdisc.data:::retain(df = ADLB, value_var = ADLB$AVAL,
#'   event = ADLB$ABLFL2 == "Y")
retain <- function(df, value_var, event, outside = NA) {
  indices <- c(1, which(event == TRUE), nrow(df) + 1)
  values <- c(outside, value_var[event == TRUE])
  rep(values, diff(indices))
}

#' Primary keys: labels
#'
#' Apply labels to ADSL primary key variables
#'
#' @param x data frame containing variables to which labels are applied.
#' @param ... ellipsis.
#' @examples
#' ADSL <- radsl()
#' random.cdisc.data:::var_relabel(ADSL, STUDYID = "Study Identifier",
#' USUBJID = "Unique Subject Identifier")
var_relabel <- function(x, ...) {
  dots <- list(...)
  varnames <- names(dots)
  if (is.null(varnames)) {
    stop("missing variable declarations")
  }
  map_varnames <- match(varnames, names(x))
  for (i in seq_along(map_varnames)) {
    attr(x[[map_varnames[[i]]]], "label") <-  dots[[i]]
  }
  x
}

#' Metadata
#'
#' Apply label and variable ordering attributes to domains
#'
#' @param df data frame to which metadata are applied.
#' @param filename \code{yaml} file containing domain metadata.
#' @param add_adsl logical to control merging of ADSL data to domain
#' @param adsl_filename \code{yaml} file containing ADSL metadata.
#'
#'
#' @examples
#' seed <- 1
#' ADSL <- suppressWarnings(radsl(seed = seed))
#' ADLB <- radlb(ADSL, seed = seed)
#'
#' \dontrun{
#' yaml_path <- file.path(path.package("random.cdisc.data"), "inst", "metadata")
#' ADSL <- random.cdisc.data:::apply_metadata(ADSL, file.path(yaml_path, "ADSL.yml"), FALSE)
#' ADLB <- random.cdisc.data:::apply_metadata(ADLB, file.path(yaml_path, "ADLB.yml"), TRUE,
#'   file.path(yaml_path, "ADSL.yml"))
#' }
#'
apply_metadata <- function(df, filename, add_adsl = TRUE, adsl_filename = "metadata/ADSL.yml") { # nolint
  stopifnot(is.data.frame(df))
  checkmate::assert_string(filename)
  checkmate::assert_flag(add_adsl)
  checkmate::assert_string(adsl_filename)

  apply_type <- function(df, var, type) {
    if (is.null(type)) {
      return()
    }

    if (type == "character" && !is.character(df[[var]])) {
      df[[var]] <<- as.character(df[[var]])
    } else if (type == "factor" && !is.factor(df[[var]])) {
      df[[var]] <<- as.factor(df[[var]])
    } else if  (type == "integer" && !is.integer(df[[var]])) {
      df[[var]] <<- as.integer(df[[var]])
    } else if  (type == "numeric" && !is.numeric(df[[var]])) {
      df[[var]] <<- as.numeric(df[[var]])
    } else if  (type == "logical" && !is.logical(df[[var]])) {
      df[[var]] <<- as.logical(df[[var]])
    }
  }

  # remove existing attributes
  for (i in base::setdiff(names(attributes(df)), names(attributes(data.frame())))) {
    attr(df, i) <- NULL
  }

  # get metadata
  metadata <- yaml::yaml.load_file(system.file(filename, package = "random.cdisc.data"))
  adsl_metadata <- if (add_adsl) {
    yaml::yaml.load_file(system.file(adsl_filename, package = "random.cdisc.data"))
  } else {
    NULL
  }
  metadata_variables <- append(adsl_metadata$variables, metadata$variables)
  metadata_varnames <- names(metadata_variables)

  # find variables that does not have labels and are not it metadata
  missing_vars_map <- vapply(
    names(df),
    function(x)
      !(x %in% c("STUDYID", "USUBJID", metadata_varnames)) && is.null(attr(df[[x]], "label")),
    logical(1)
  )
  missing_vars <- names(df)[missing_vars_map]
  if (length(missing_vars) > 0) {
    msg <- paste0(
      "Following variables does not have label or are not found in ",
      filename,
      ": ",
      paste0(missing_vars, collapse = ", "))
    warning(msg)
  }

  if (!all(metadata_varnames %in% names(df))) {
    metadata_varnames <- metadata_varnames[metadata_varnames %in% names(df)]
  }

  # assign labels to variables
  for (var in metadata_varnames) {
    apply_type(df, var, metadata_variables[[var]]$type)
    attr(df[[var]], "label") <- metadata_variables[[var]]$label
  }

  # reorder data frame columns to expected BDS order
  df <- df[, unique(c("STUDYID", "USUBJID", metadata_varnames, names(df)))]

  # assign label to data frame
  attr(df, "label") <- metadata$domain$label

  df
}

#' Replace values in a vector by NA
#'
#' Randomized replacement of values by NA
#'
#' @param v (\code{any}) vector of any type
#' @param percentage (\code{numeric}) Value between 0 and 1 defining
#'   how much of the vector shall be replaced by NA. This number
#'   is randomized by plus minus 5 percent to have full randomization.
#' @param seed (\code{numeric}) seed to set to make randomization reproducible
#'
#' @return The input vector v where a certain number of values
#'   is replaced by NA
#'
#' @export
replace_na <- function(v, percentage = 0.05, seed = NULL) {

  checkmate::assert_numeric(percentage, len = 1, any.missing = FALSE)
  stopifnot(percentage >= 0 && percentage <= 1)

  if (percentage == 0) {
    return(v)
  }

  if (!is.null(seed) && !is.na(seed)) {
    set.seed(seed)
  }

  # randomize the percentage
  ind <- sample(seq_along(v), round(length(v) * percentage))

  v[ind] <- NA

  return(v)
}

#' NA: replace values
#'
#' Replace column values with NAs
#'
#' @param ds (\code{data.frame}) Any data set
#' @param na_vars (\code{list}) A named list where the name of each element is a column name of \code{ds}. Each
#'  element of this list should be a numeric vector with two elements
#'  \itemize{
#'     \item{seed }{The seed to be used for this element - can be left NA}
#'     \item{percentage }{How many element should be replaced. 0 is 0 \% 1 is 100 \%, can be left NA and default
#'     percentage is used. This will overwrite default percentage (percentage argument))}
#' }
#' @param na_percentage (\code{numeric}) Default percentage of values to be replaced by NA
#'
#' @importFrom rlang := !!
mutate_na <- function(ds, na_vars = NULL, na_percentage = 0.05) {

  if (!dplyr::is.tbl(ds)) {
    dplyr::tbl_df(ds)
  }

  if (!is.null(na_vars)) {
    stopifnot(is.list(na_vars)) # any list is OK; as values can be left NA
    stopifnot(length(names(na_vars)) == length(na_vars)) # names for all elements
  } else {
    na_vars <- names(ds)
  }

  stopifnot(is.numeric(na_percentage))
  stopifnot(na_percentage >= 0 && na_percentage < 1)

  for (na_var in names(na_vars)) {
    if (!is.na(na_var)) {
      if (!na_var %in% names(ds)) {
        warning(paste(na_var, "not in column names"))
      } else {
        ds <- ds %>%
          ungroup_rowwise_df %>%
          dplyr::mutate(
            !!na_var := ds[[na_var]] %>%
              replace_na(
                percentage = ifelse(is.na(na_vars[[na_var]][2]), na_percentage, na_vars[[na_var]][2]),
                seed = na_vars[[na_var]][1]
              )
          )
      }
    }
  }
  return(ds)
}

ungroup_rowwise_df <- function(x) {
  class(x) <- c("tbl", "tbl_df", "data.frame")
  return(x)
}


#' Zero-truncated Poisson Distribution
#'
#' This generates random numbers from a zero-truncated Poisson distribution,
#' i.e. from `X | X > 0` when `X ~ Poisson(lambda)`. The advantage here is that
#' we guarantee to return exactly `n` numbers and without using a loop internally.
#' This solution was provided in a post by
#' [Peter Dalgaard](https://stat.ethz.ch/pipermail/r-help/2005-May/070680.html).
#'
#' @param n number of random numbers.
#' @param lambda non-negative mean(s).
#'
#' @return The random numbers.
#' @export
#'
#' @examples
#' x <- rpois(1e6, lambda = 5)
#' x <- x[x > 0]
#' hist(x)
#'
#' y <- rtpois(1e6, lambda = 5)
#' hist(y)
#'
rtpois <- function(n, lambda) {
  stats::qpois(stats::runif(n, stats::dpois(0, lambda), 1), lambda)
}

#' Truncated Exponential Distribution
#'
#' This generates random numbers from a truncated Exponential distribution,
#' i.e. from `X | X > l` or `X | X < r` when `X ~ Exp(rate)`. The advantage here is that
#' we guarantee to return exactly `n` numbers and without using a loop internally.
#' This can be derived from the quantile functions of the left- and right-truncated
#' Exponential distributions.
#'
#' @param n number of random numbers.
#' @param rate non-negative rate.
#' @param l positive left-hand truncation parameter.
#' @param r positive right-hand truncation parameter.
#'
#' @return The random numbers. If neither `l` nor `r` are provided then the usual Exponential
#'  distribution is used.
#' @export
#'
#' @examples
#' x <- stats::rexp(1e6, rate = 5)
#' x <- x[x > 0.5]
#' hist(x)
#'
#' y <- rtexp(1e6, rate = 5, l = 0.5)
#' hist(y)
#'
#' z <- rtexp(1e6, rate = 5, r = 0.5)
#' hist(z)
#'
rtexp <- function(n, rate, l = NULL, r = NULL) {
  if (!is.null(l)) {
    l - log(1 - stats::runif(n)) / rate
  } else if (!is.null(r)) {
    - log(1 - stats::runif(n) * (1 - exp(- r * rate))) / rate
  } else {
    stats::rexp(n, rate)
  }
}
