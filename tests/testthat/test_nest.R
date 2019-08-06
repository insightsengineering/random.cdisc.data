library(test.nest)

if (!grepl("Rcheck", getwd()) && !grepl("\\-test", getwd())) {
  test_spell()
}

test_lintr()
test_regexp()
test_strict()
