#' return data attached to package
#' @importFrom utils data
#' @noRd
get_cached_data <- function(dataname) {
  stopifnot(is.character.single(dataname))
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
  stopifnot(is.numeric.single(N))

  factor(sample(x, N, replace = TRUE, ...), levels = if (is.factor(x)) levels(x) else x)
}

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
  stopifnot(is.character.vector(relvar1))
  stopifnot(is.character.vector(relvar2))

  if (length(relvar1) != length(relvar2)) {
    message(simpleError(
      "The argument value length of relvar1 and relvar2 differ. They must contain the same number of elements."
    ))
    return(NA)
  }
  return(list("relvar1" = relvar1, "relvar2" = relvar2))
}

#' Assign values to a related variable within a domain
#'
#' @param df data frame containing the related variables.
#' @param var_name related to variable name.
#' @param var_values values of related to variable.
#' @param related_var variable name with existing values to which var_name values must relate.
#'
#' @examples
#' ADLB <- radlb(radsl())
#' random.cdisc.data:::rel_var(
#'   df = ADLB,
#'   var_name = "PARAMCD",
#'   var_values = c("ALT", "CRP", "IGA", "IGM"),
#'   related_var = "PARAM"
#' )
rel_var <- function(df = NULL, var_name = NULL, var_values = NULL, related_var = NULL) {
  stopifnot(is.null(df) || is.data.frame(df))
  stopifnot(is.null(var_name) || is.character.single(var_name))
  stopifnot(is.null(var_values) || is.character.vector(var_values))
  stopifnot(is.null(related_var) || is.character.single(related_var))

  if (is.null(df)) {
    message("Missing data frame argument value.")
    return(NA)
  } else{
    n_relvar1 <- length(unique(df[, related_var]))
    n_relvar2 <- length(var_values)
    if (n_relvar1 != n_relvar2) {
      message(paste("Unequal vector lengths for", related_var, "and", var_name))
      return(NA)
    } else {
      relvar1 <- unique(df[, related_var])
      relvar2_values <- rep(NULL, nrow(df))
      for (r in 1:length(relvar1)) {
        matched <- which(df[, related_var] == relvar1[r])
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
  stopifnot(is.character.single(visit_format))
  stopifnot(is.integer.single(n_assessments))
  stopifnot(is.integer.single(n_days))

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
  visit_values <- reorder(factor(visit_values), assessments_ord)
}

#' Retain values within primary keys
#'
#' @param df data frame in which to apply the retain.
#' @param value_var variable containing the value to be retained.
#' @param event flag to trigger the retain.
#' @param outside value to.
#'
#' @examples
#' ADLB <- radlb(radsl())
#' ADLB$BASE2 <- random.cdisc.data:::retain(ADLB, ADLB$AVAL, ADLB$ABLFL2 == "Y")
retain <- function(df, value_var, event, outside = NA) {
  indices <- c(1, which(event == TRUE), nrow(df) + 1)
  values <- c(outside, value_var[event == TRUE])
  rep(values, diff(indices))
}

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

#' Apply label and variable ordering attributes to domains
#'
#' @param df data frame to which metadata are applied.
#' @param filename \code{yaml} file containing domain metadata.
#' @param ... ellipsis.
#' @param ADSL logical to control merging of ADSL data to domain.
#'
#' @importFrom dplyr inner_join
#' @importFrom yaml yaml.load_file
#'
#' @examples
#' seed <- 1
#' ADSL <- suppressWarnings(radsl(seed = seed))
#' ADLB <- radlb(ADSL, seed = seed)
#' ADSL <- random.cdisc.data:::apply_metadata(ADSL, "ADSL.yml", seed = seed, ADSL = ADSL)
#' ADLB <- random.cdisc.data:::apply_metadata(ADLB, "ADLB.yml", seed = seed, ADSL = ADSL)
apply_metadata <- function(df, filename, ..., ADSL = NULL) { # nolint
  stopifnot(is.data.frame(df))
  stopifnot(is.character.single(filename))
  stopifnot(is.null(ADSL) || is.data.frame(ADSL))

  # get metadata
  metadata <- yaml.load_file(system.file(filename, package = "random.cdisc.data"))

  ## assign labels to variables
  for (var in intersect(names(df), names(metadata$variables))) {
    attr(df[[var]], "label") <- metadata$variables[[var]]$label
  }

  ## reorder data frame columns to expected BDS order
  df <- df[, unique(c("STUDYID", "USUBJID",
                      intersect(names(metadata$variables), names(df))))]
  if (!is.null(ADSL)) {
    ## add all ADSL variables to domain, BDS is one proc away
    df <- inner_join(ADSL, df, by = c("STUDYID", "USUBJID"))
  }

  # assign label to data frame
  attr(df, "label") <- metadata$domain$label

  df
}

#' Replace values in a vector by NA
#'
#' @description Randomized replacement of values by NA
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

  stopifnot(is.numeric.single(percentage))
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

#' Replace column values by NAs
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
#' @importFrom dplyr mutate is.tbl
#' @importFrom rlang := !!
#' @import utils.nest
mutate_na <- function(ds, na_vars = NULL, na_percentage = 0.05) {

  if (!is.tbl(ds)) {
    tbl_df(ds)
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
        message(na_var)

        ds <- ds %>%
            ungroup_rowwise_df %>%
            dplyr::mutate(!!na_var := ds[[na_var]] %>%
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
  x
}
