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
#' \dontrun{
#' sample_fct(letters[1:3], 10)
#' sample_fct(iris$Species, 10)
#'}
sample_fct <- function(x, N, ...) {
  factor(sample(x, N, replace = TRUE, ...), levels = if (is.factor(x)) levels(x) else x)
}

#' Verify and initialize parameter (PARAM) values
#'
#' @param param as character string. list of PARAM values.
#' @param paramcd as character string. list of PARAMCD values.
#'
#' @return a vector of n parameters
#'
#' @examples
#' \dontrun{
#'param_init(c("Alanine Aminotransferase Measurement", "ALT")
#'}
param_init <- function(param, paramcd){

  if(length(param) != length (paramcd)){
    message(simpleError("The argument value length of parameters (PARAM) and parameter codes (PARAMCD) differ. They must contain the same number of elements."))
    return(NA)
  } else {
    param <- param
    paramcd <- paramcd
  }
  return(param_init_list <- list("param" = param, "paramcd" = paramcd))
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
#' @param n_timepoints number of timepoints: Valid values: integer. To Be Implemented.
#' @param times nominal time point description as character vector. To Be Implemented.
#' @param n_timepoints_prior_trt number of timepoints prior to treatment at visit. Valid values: integer. To Be Implemented.
#'
#' @return a factor of length n_assessments
#'
#' @examples
#' \dontrun{
#'AVISIT <- visit_schedule(visit_format = "WEeK", n_assessments = 10)
#'AVISIT <- visit_schedule(visit_format = "CyCLE", n_assessments = 5, n_days = 2)
#'}
visit_schedule <- function(visit_format = "WEEK", n_assessments = 10, n_days = 5, n_timepoints = NULL, times = NULL, n_timepoints_prior_trt = NULL) {
  # trap invalid assessment format
  if (!(toupper(visit_format) %in% c("WEEK", "CYCLE"))) {
    message("Visit format value must either be: WEEK or CYCLE")
    return(NA)
  }

  if (toupper(visit_format) == "WEEK"){
    # numeric vector of n assessments/cycles/days
    assessments <- 1:n_assessments
    # numeric vector for ordering including screening (-1) and baseline (0) place holders
    assessments_ord <- -1:n_assessments
    # character vector of nominal visit values
    visit_values <- c("SCREENING", "BASELINE", paste(toupper(visit_format), assessments, "DAY", (assessments*7) + 1))
  } else if (toupper(visit_format) == "CYCLE"){
    cycles <- sort(rep(1:n_assessments, times=1, each=n_days))
    days <- rep(seq(1:n_days), times=n_assessments, each=1)
    assessments_ord <- 0:(n_assessments*n_days)
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
#' \dontrun{
#' ADLB$BASE2 <- retain(ADLB, ADLB$AVAL, ADLB$ABLFL2 == "Y")
#'}
retain <- function(df, value_var, event, outside=NA)
{
  indices <- c(1, which(event==TRUE), nrow(df)+1)
  values <- c(outside, value_var[event==TRUE])
  retained_val <- rep(values, diff(indices))
}

#' Assign values to a related variable within a domain
#'
#' @param df data frame containing the related variables.
#' @param var_name related to variable name.
#' @param var_values values of related to variable.
#' @param related_var variable name with existing values to which var_name values must relate.
#'
#' @examples
#' \dontrun{
#'rel_var(df = ADLB, var_name = "PARAMCD", var_values = c("ALT", "CRP", "IGA", "IGM"),
#'related_var = "PARAM")
#'}
rel_var <- function(df = NULL, var_name = NULL, var_values = NULL, related_var = NULL){
  if (is.null(df)) {
    message("Missing data frame argument value.")
    return(NA)
  } else{
    n_params <- length(unique(df[,related_var]))
    n_paramcds <- length(var_values)
    if (n_params != n_paramcds){
      message(paste("Unequal vector lengths for", related_var, "and", var_name))
      return(NA)
    } else {
      params <- unique(df[,related_var])
      paramcd_values = rep(NULL,nrow(df))
      for (p in 1:length(params)) {
        matched = which(df[,related_var] == params[p])
        paramcd_values[matched] = var_values[p]
      }
      return(paramcd_values)
    }
  }
}

#' Apply labels to ADSL primary key variables
#'
#' @param x data frame containing variables to which labels are applied.
#' @param ... ellipsis.
#'
#' @examples
#' \dontrun{
#'  var_relabel(STUDYID = "Study Identifier", USUBJID = "Unique Subject Identifier")
#'}
var_relabel <- function(x, ...) {
  dots <- list(...)
  varnames <- names(dots)
  if (is.null(varnames)) stop("missing variable declarations")
  map_varnames <- match(varnames, names(x))
  for (i in seq_along(map_varnames)) {
    attr(x[[map_varnames[[i]]]], "label") <-  dots[[i]]
  }
  x
}

#' Apply label and variable ordering attributes to domains
#'
#' @param df data frame to which metadata are applied.
#' @param filename yaml file containing domain metadata.
#' @param ... ellipsis.
#' @param ADSL logical to control merging of ADSL data to domain.
#'
#' @examples
#' \dontrun{
#'  ADSL <- apply_metadata(ADSL, "ADSL.yml", seed = seed, ADSL = ADSL)
#'  ADLB <- apply_metadata(ADLB, "ADLB.yml", seed = seed, ADSL = ADSL)
#'}
apply_metadata <- function(df, filename, ..., ADSL = NULL) {


  # get metadata
  metadata <- yaml.load_file(system.file(filename, package = "random.cdisc.data"))

  # assign label to data frame
  attr(df, "label") <- metadata$domain$label

  ## assign labels to variables
  for(var in intersect(names(df), names(metadata$variables))) {
    attr(df[[var]], "label") <- metadata$variables[[var]]$label
  }

  ## reorder data frame columns to expected BDS order
  df <- df[, unique(c("STUDYID", "USUBJID",
                      intersect(names(metadata$variables), names(df))))]
  if (!is.null(ADSL)) {
    ## add all ADSL variables to domain, BDS is one proc away
    df <- inner_join(ADSL, df, by=c("STUDYID", "USUBJID"))
  } else {

    df

  }

}
