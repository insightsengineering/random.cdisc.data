#' Create Random SDTM and ADAM Datasets
#'
#' This file facilitates package build
#'
#'
#' @import magrittr
#' @docType package
#' @name random.cdisc.data
NULL

# to avoid NOTEs from R CMD CHECK
vars <- c(
  "."
)
for (i in vars) {
  assign(i, NULL)
}

for (i in vars) {
  rm(i)
}
rm(vars)
