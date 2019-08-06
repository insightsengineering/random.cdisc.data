library(test.nest)

if("inst/WORDLIST" %in% list.files(".", recursive = "TRUE")) {
  test_spell()
}

test_lintr()
test_regexp()
test_strict()
