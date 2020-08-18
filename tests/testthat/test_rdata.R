context("random data generators")

test_that("r<data> functions work", {
  n <- 10

  expect_silent(
    adsl <- radsl(n)
  )

  expect_silent(radae(adsl))
  expect_silent(radaette(adsl))
  expect_silent(radcm(adsl))
  expect_silent(radeg(adsl))
  expect_silent(radex(adsl))
  expect_silent(radlb(adsl))
  expect_silent(radmh(adsl))
  expect_silent(radqs(adsl))
  expect_silent(radrs(adsl))
  expect_silent(radtr(adsl))
  expect_silent(radtte(adsl))
  expect_silent(radvs(adsl))
})

test_that("r<data> with cached = TRUE", {
  expect_silent(radae(cached = TRUE))
  expect_silent(radaette(cached = TRUE))
  expect_silent(radcm(cached = TRUE))
  expect_silent(radeg(cached = TRUE))
  expect_silent(radex(cached = TRUE))
  expect_silent(radlb(cached = TRUE))
  expect_silent(radmh(cached = TRUE))
  expect_silent(radqs(cached = TRUE))
  expect_silent(radrs(cached = TRUE))
  expect_silent(radtr(cached = TRUE))
  expect_silent(radtte(cached = TRUE))
  expect_silent(radvs(cached = TRUE))
})

test_that("seed works", {
  expect_true(identical(radsl(seed = 1), radsl(seed = 1)))
})
