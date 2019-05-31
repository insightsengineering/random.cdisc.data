context("Check cached data")

# On error please recreate data using inst/script.R file

r_adsl <- radsl(seed = 1)

test_that("ADSL cached data", {
  c_adsl <- cadsl
  expect_identical(r_adsl, c_adsl)
})

test_that("ADAE cached data", {
  r_adae <- radae(r_adsl, seed = 1)
  c_adae <- cadae
  expect_identical(r_adae, c_adae)
})

test_that("ADAETTE cached data", {
  r_adaette <- radaette(r_adsl, seed = 1)
  c_adaette <- cadaette
  expect_identical(r_adaette, c_adaette)
})

test_that("ADCM cached data", {
  r_adcm <- radcm(r_adsl, seed = 1)
  c_adcm <- cadcm
  expect_identical(r_adcm, c_adcm)
})

test_that("ADLB cached data", {
  r_adlb <- radlb(r_adsl, seed = 1)
  c_adlb <- cadlb

  # get rid of factor level issue
  r_adlb$AVALU <- c_adlb$AVALU

  expect_identical(r_adlb, c_adlb)
})

test_that("ADRS cached data", {
  r_adrs <- radrs(r_adsl, seed = 1)
  c_adrs <- cadrs
  expect_identical(r_adrs, c_adrs)
})

test_that("ADTTE cached data", {
  r_adtte <- radtte(r_adsl, seed = 1)
  c_adtte <- cadtte
  expect_identical(r_adtte, c_adtte)
})

test_that("ADVS cached data", {
  r_advs <- radvs(r_adsl, seed = 1)
  c_advs <- cadvs

  # get rid of factor level issue
  r_advs$AVALU <- c_advs$AVALU

  expect_identical(r_advs, c_advs)
})

