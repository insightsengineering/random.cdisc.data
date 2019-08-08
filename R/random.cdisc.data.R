#' Create Random SDTM and ADAM Datasets
#'
# @import dplyr
#' @import utils.nest
#' @docType package
#' @name random.cdisc.data
NULL

# to avoid NOTEs from R CMD CHECK
vars <- c(
  ".",
  "ARM",
  "ARMCD",
  "AVAL",
  "AVALC",
  "BASE",
  "BASE2",
  "CHG",
  "CHG2",
  "CNSR",
  "CNSR_P",
  "COUNTRY",
  "LAMBDA",
  "PARAMCD",
  "SITEID",
  "STUDYID",
  "SUBJID"
)
for (i in vars) {
  assign(i, NULL)
}

for (i in vars) {
  rm(i)
}
rm(vars)
