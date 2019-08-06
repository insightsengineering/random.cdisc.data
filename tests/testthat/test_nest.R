library(test.nest)

if (!grepl("Rcheck", getwd())) {
  test_spell()
}

test_lintr()
test_regexp()
test_strict()
