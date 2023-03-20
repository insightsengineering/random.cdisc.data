#' random.cdisc.data Package
#'
#' Package to create random SDTM and ADAM datasets.
#'
#' @name package
#' @import magrittr
#' @import dplyr
#' @importFrom rlang .data := !!
#'
"_PACKAGE"

# to avoid NOTEs from R CMD CHECK
utils::globalVariables(c(
  "USUBJID",
  "AVISITN",
  "AVISIT",
  "AVAL",
  "LBSTRESC",
  "VSSTRESC",
  "ADY_der",
  "publication_name",
  "first_date"
))
