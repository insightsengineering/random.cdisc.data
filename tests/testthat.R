pkg_name <- "random.cdisc.data"
library(pkg_name, character.only = TRUE)
testthat::test_check(pkg_name)
