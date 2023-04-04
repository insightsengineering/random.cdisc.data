#' Load Cached Data
#'
#' Return data attached to package.
#'
#' @keywords internal
#' @noRd
get_cached_data <- function(dataname) {
  checkmate::assert_string(dataname)
  if (!("package:random.cdisc.data" %in% search())) {
    stop("cached data can only be loaded if the random.cdisc.data package is attached.",
      "Please run library(random.cdisc.data) before loading cached data.",
      call. = FALSE
    )
  } else {
    get(dataname, envir = asNamespace("random.cdisc.data"))
  }
}

#' Create a Factor with Random Elements of x
#'
#' Sample elements from `x` with replacement to build a factor.
#'
#' @param x (`character vector` or `factor`)\cr If character vector then it is also used
#'   as levels of the returned factor. If factor then the levels are used as the new levels.
#' @param N (`numeric`)\cr Number of items to choose.
#' @param ... Additional arguments to be passed to `sample`.
#'
#' @return A factor of length `N`.
#' @keywords internal
#'
#' @examples
#' random.cdisc.data:::sample_fct(letters[1:3], 10)
#' random.cdisc.data:::sample_fct(iris$Species, 10)
sample_fct <- function(x, N, ...) { # nolint
  checkmate::assert_number(N)

  factor(sample(x, N, replace = TRUE, ...), levels = if (is.factor(x)) levels(x) else x)
}

#' Related Variables: Initialize
#'
#' Verify and initialize related variable values.
#'
#' @param relvar1 (`list` of `character`)\cr List of n elements.
#' @param relvar2 (`list` of `character`)\cr List of n elements.
#'
#' @return A vector of n elements.
#'
#' @keywords internal
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

#' Related Variables: Assign
#'
#' Assign values to a related variable within a domain.
#'
#' @param df (`data.frame`)\cr Data frame containing the related variables.
#' @param var_name (`character`)\cr Name of variable related to `rel_var` to add to `df`.
#' @param var_values (`any`)\cr Vector of values related to values of `related_var`.
#' @param related_var (`character`)\cr Name of variable within `df` with values to which values
#' of `var_name` must relate.
#'
#' @return `df` with added factor variable `var_name` containing `var_values` corresponding to `related_var`.
#' @keywords internal
#'
#' @examples
#' # Example with data.frame.
#' params <- c("Level A", "Level B", "Level C")
#' adlb_df <- data.frame(
#'   ID = 1:9,
#'   PARAM = factor(
#'     rep(c("Level A", "Level B", "Level C"), 3),
#'     levels = params
#'   )
#' )
#' random.cdisc.data:::rel_var(
#'   df = adlb_df,
#'   var_name = "PARAMCD",
#'   var_values = c("A", "B", "C"),
#'   related_var = "PARAM"
#' )
#'
#' # Example with tibble.
#' adlb_tbl <- tibble::tibble(
#'   ID = 1:9,
#'   PARAM = factor(
#'     rep(c("Level A", "Level B", "Level C"), 3),
#'     levels = params
#'   )
#' )
#' random.cdisc.data:::rel_var(
#'   df = adlb_tbl,
#'   var_name = "PARAMCD",
#'   var_values = c("A", "B", "C"),
#'   related_var = "PARAM"
#' )
rel_var <- function(df, var_name, related_var, var_values = NULL) {
  checkmate::assert_data_frame(df)
  checkmate::assert_string(var_name)
  checkmate::assert_string(related_var)
  n_relvar1 <- length(unique(df[, related_var, drop = TRUE]))
  checkmate::assert_vector(var_values, null.ok = TRUE, len = n_relvar1, any.missing = FALSE)
  if (is.null(var_values)) var_values <- rep(NA, n_relvar1)

  relvar1 <- unique(df[, related_var, drop = TRUE])
  relvar2_values <- rep(NA, nrow(df))
  for (r in seq_len(n_relvar1)) {
    matched <- which(df[, related_var, drop = TRUE] == relvar1[r])
    relvar2_values[matched] <- var_values[r]
  }
  df[[var_name]] <- factor(relvar2_values)
  return(df)
}

#' Create Visit Schedule
#'
#' Create a visit schedule as a factor.
#'
#' X number of visits, or X number of cycles and Y number of days.
#'
#' @inheritParams argument_convention
#'
#' @return A factor of length `n_assessments`.
#' @keywords internal
#'
#' @examples
#' random.cdisc.data:::visit_schedule(visit_format = "WEeK", n_assessments = 10L)
#' random.cdisc.data:::visit_schedule(visit_format = "CyCLE", n_assessments = 5L, n_days = 2L)
visit_schedule <- function(visit_format = "WEEK",
                           n_assessments = 10L,
                           n_days = 5L) {
  checkmate::assert_string(visit_format, pattern = "^WEEK$|^CYCLE$", ignore.case = TRUE)
  checkmate::assert_integer(n_assessments, len = 1, any.missing = FALSE)
  checkmate::assert_integer(n_days, len = 1, any.missing = FALSE)

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

#' Primary Keys: Retain Values
#'
#' Retain values within primary keys.
#'
#' @param df (`data.frame`)\cr Data frame in which to apply the retain.
#' @param value_var (`any`)\cr Variable in `df` containing the value to be retained.
#' @param event (`expression`)\cr Expression returning a logical value to trigger the retain.
#' @param outside (`any`)\cr Additional value to retain. Defaults to `NA`.
#'
#' @keywords internal
#'
#' @examples
#' adlb <- radlb(radsl(N = 10, na_percentage = 0), na_vars = list())
#' adlb$BASE2 <- random.cdisc.data:::retain(
#'   df = adlb, value_var = adlb$AVAL,
#'   event = adlb$ABLFL2 == "Y"
#' )
retain <- function(df, value_var, event, outside = NA) {
  indices <- c(1, which(event == TRUE), nrow(df) + 1)
  values <- c(outside, value_var[event == TRUE])
  rep(values, diff(indices))
}

#' Primary Keys: Labels
#'
#' Relabel a subset of variables in a data set.
#'
#' @param x (`data.frame`)\cr Data frame containing variables to which labels are applied.
#' @param ... (`named character`)\cr Name-Value pairs, where name corresponds to a variable
#' name in `x` and the value to the new variable label.
#'
#' @keywords internal
#'
#' @examples
#' adsl <- radsl()
#' random.cdisc.data:::var_relabel(adsl,
#'   STUDYID = "Study Identifier",
#'   USUBJID = "Unique Subject Identifier"
#' )
var_relabel <- function(x, ...) {
  dots <- list(...)
  varnames <- names(dots)
  if (is.null(varnames)) {
    stop("missing variable declarations")
  }
  map_varnames <- match(varnames, names(x))
  for (i in seq_along(map_varnames)) {
    attr(x[[map_varnames[[i]]]], "label") <- dots[[i]]
  }
  x
}

#' Apply Metadata
#'
#' Apply label and variable ordering attributes to domains.
#'
#' @param df (`data.frame`)\cr Data frame to which metadata is applied.
#' @param filename (`yaml`)\cr File containing domain metadata.
#' @param add_adsl (`logical`)\cr Should ADSL data be merged to domain.
#' @param adsl_filename (`yaml`)\cr File containing ADSL metadata.
#'
#' @keywords internal
#'
#' @examples
#' seed <- 1
#' adsl <- radsl(seed = seed)
#' adlb <- radlb(adsl, seed = seed)
#' \dontrun{
#' yaml_path <- file.path(path.package("random.cdisc.data"), "inst", "metadata")
#' adsl <- random.cdisc.data:::apply_metadata(adsl, file.path(yaml_path, "ADSL.yml"), FALSE)
#' adlb <- random.cdisc.data:::apply_metadata(
#'   adlb, file.path(yaml_path, "ADLB.yml"), TRUE,
#'   file.path(yaml_path, "ADSL.yml")
#' )
#' }
apply_metadata <- function(df, filename, add_adsl = TRUE, adsl_filename = "metadata/ADSL.yml") {
  checkmate::assert_data_frame(df)
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
    } else if (type == "integer" && !is.integer(df[[var]])) {
      df[[var]] <<- as.integer(df[[var]])
    } else if (type == "numeric" && !is.numeric(df[[var]])) {
      df[[var]] <<- as.numeric(df[[var]])
    } else if (type == "logical" && !is.logical(df[[var]])) {
      df[[var]] <<- as.logical(df[[var]])
    } else if (type == "datetime" && !lubridate::is.POSIXct(df[[var]])) {
      df[[var]] <<- as.POSIXct(df[[var]])
    } else if (type == "date" && !lubridate::is.Date(df[[var]])) {
      df[[var]] <<- as.Date(df[[var]])
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
    function(x) {
      !(x %in% c("STUDYID", "USUBJID", metadata_varnames)) && is.null(attr(df[[x]], "label"))
    },
    logical(1)
  )
  missing_vars <- names(df)[missing_vars_map]
  if (length(missing_vars) > 0) {
    msg <- paste0(
      "Following variables does not have label or are not found in ",
      filename,
      ": ",
      paste0(missing_vars, collapse = ", ")
    )
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

#' Replace Values in a Vector by NA
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Randomized replacement of values by `NA`.
#'
#' @inheritParams argument_convention
#' @param v (`any`)\cr Vector of any type.
#' @param percentage (`proportion`)\cr Value between 0 and 1 defining
#'   how much of the vector shall be replaced by `NA`. This number
#'   is randomized by +/- 5% to have full randomization.
#'
#' @return The input vector `v` where a certain number of values are replaced by `NA`.
#'
#' @export
replace_na <- function(v, percentage = 0.05, seed = NULL) {
  checkmate::assert_number(percentage, lower = 0, upper = 1)

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

#' Replace Values with NA
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Replace column values with `NA`s.
#'
#' @inheritParams argument_convention
#' @param ds (`data.frame`)\cr Any data set.
#'
#' @export
mutate_na <- function(ds, na_vars = NULL, na_percentage = 0.05) {
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
          ungroup_rowwise_df() %>%
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

#' Zero-Truncated Poisson Distribution
#'
#' @description `r lifecycle::badge("stable")`
#'
#' This generates random numbers from a zero-truncated Poisson distribution,
#' i.e. from `X | X > 0` when `X ~ Poisson(lambda)`. The advantage here is that
#' we guarantee to return exactly `n` numbers and without using a loop internally.
#' This solution was provided in a post by
#' [Peter Dalgaard](https://stat.ethz.ch/pipermail/r-help/2005-May/070680.html).
#'
#' @param n (`numeric`)\cr Number of random numbers.
#' @param lambda (`numeric`)\cr Non-negative mean(s).
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
rtpois <- function(n, lambda) {
  stats::qpois(stats::runif(n, stats::dpois(0, lambda), 1), lambda)
}

#' Truncated Exponential Distribution
#'
#' @description `r lifecycle::badge("stable")`
#'
#' This generates random numbers from a truncated Exponential distribution,
#' i.e. from `X | X > l` or `X | X < r` when `X ~ Exp(rate)`. The advantage here is that
#' we guarantee to return exactly `n` numbers and without using a loop internally.
#' This can be derived from the quantile functions of the left- and right-truncated
#' Exponential distributions.
#'
#' @param n (`numeric`)\cr Number of random numbers.
#' @param rate (`numeric`)\cr Non-negative rate.
#' @param l (`numeric`)\cr Positive left-hand truncation parameter.
#' @param r (`numeric`)\cr Positive right-hand truncation parameter.
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
rtexp <- function(n, rate, l = NULL, r = NULL) {
  if (!is.null(l)) {
    l - log(1 - stats::runif(n)) / rate
  } else if (!is.null(r)) {
    -log(1 - stats::runif(n) * (1 - exp(-r * rate))) / rate
  } else {
    stats::rexp(n, rate)
  }
}
