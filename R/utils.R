

# available in tern
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

## read domain metadata file to apply labels and ordering
apply_metadata <- function(dsn, filename, ..., join_adsl = TRUE) {

  # get metadata
  metadata <- yaml.load_file(file.path(
    path.package(package = "random.cdisc.data", quiet = FALSE),
    filename
  ))

  # assign label to data frame
  attr(dsn, "label") <- metadata$domain$label

  ## assign labels to variables
  for(var in intersect(names(dsn), names(metadata$variables))) {
    attr(dsn[[var]], "label") <- metadata$variables[[var]]$label
  }

  ## reorder data frame columns to expected BDS order
  dsn <- dsn[, unique(c("STUDYID", "USUBJID",
                           intersect(names(metadata$variables), names(dsn))))]
  if (join_adsl == TRUE) {
    #print(list(...))
    ADSL <- radsl(...)
    ## add all ADSL variables to domain - BDS is one proc away
    dsn <- inner_join(ADSL, dsn, by=c("STUDYID", "USUBJID"))
  } else {

    dsn

  }

}
