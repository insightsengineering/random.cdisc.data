get_meta_info <- function(df) {
  adsl_yml <- yaml::yaml.load_file(system.file(paste0("metadata/ADSL.yml"), package = "random.cdisc.data"))
  df_meta <- vapply(adsl_yml$variables, function(x) x[["label"]], character(1))

  if (df != "ADSL") {
    df_yml <- yaml::yaml.load_file(system.file(paste0("metadata/", df, ".yml"), package = "random.cdisc.data"))
    df_meta <- c(df_meta, vapply(df_yml$variables, function(x) x[["label"]], character(1)))
  }

  df_meta
}

test_that("metadata matches radsl", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  rdf_label <- vapply(adsl, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADSL")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radab", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  adpc <- radpc(adsl, seed = 1)
  df <- radab(adsl, adpc, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADAB")

  expect_true(all(rdf_label %in% meta_info))
})

test_that("metadata matches radae", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radae(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADAE")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radaette", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radaette(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADAETTE")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radcm", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radcm(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADCM")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches raddv", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- raddv(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADDV")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radeg", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radeg(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADEG")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radex", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radex(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADEX")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radhy", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radhy(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADHY")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radlb", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radlb(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADLB")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radmh", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radmh(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADMH")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radpc", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radpc(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADPC")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radpp", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radpp(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADPP")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radqlqc", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radqlqc(adsl, percent = 80, number = 2, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADQLQC")

  expect_true(all(rdf_label %in% meta_info))
})

test_that("metadata matches radqs", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radqs(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADQS")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radrs", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radrs(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADRS")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radsub", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radsub(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADSUB")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radtr", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radtr(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADTR")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radtte", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radtte(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADTTE")

  expect_identical(meta_info, rdf_label)
})

test_that("metadata matches radvs", {
  n <- 10
  adsl <- radsl(n, seed = 1)
  df <- radvs(adsl, seed = 1)

  rdf_label <- vapply(df, function(x) attributes(x)[["label"]], character(1))
  meta_info <- get_meta_info("ADVS")

  expect_identical(meta_info, rdf_label)
})
