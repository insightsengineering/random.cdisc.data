test_that("r<data> functions work", {
  expect_silent(adsl <- radsl(10, seed = 1))
  expect_silent(radae(adsl, seed = 1))
  expect_silent(radaette(adsl, seed = 1))
  expect_silent(radcm(adsl, seed = 1))
  expect_silent(raddv(adsl, seed = 1))
  expect_silent(radeg(adsl, seed = 1))
  expect_silent(radex(adsl, seed = 1))
  expect_silent(radhy(adsl, seed = 1))
  expect_silent(radlb(adsl, seed = 1))
  expect_silent(radmh(adsl, seed = 1))
  expect_silent(adpc <- radpc(adsl, seed = 1))
  expect_silent(radab(adsl, adpc, seed = 1))
  radpp(adsl, seed = 1)
  radqlqc(adsl, percent = 80, number = 2, seed = 1)
  expect_silent(radqs(adsl, seed = 1))
  expect_silent(radrs(adsl, seed = 1))
  expect_silent(radsaftte(adsl, seed = 1))
  expect_silent(radsub(adsl, seed = 1))
  expect_silent(radtr(adsl, seed = 1))
  expect_silent(radtte(adsl, seed = 1))
  expect_silent(radvs(adsl, seed = 1))
})

test_that("r<data> with cached = TRUE", {
  expect_silent(radab(cached = TRUE))
  expect_silent(radae(cached = TRUE))
  expect_silent(radaette(cached = TRUE))
  expect_silent(radcm(cached = TRUE))
  expect_silent(raddv(cached = TRUE))
  expect_silent(radeg(cached = TRUE))
  expect_silent(radex(cached = TRUE))
  expect_silent(radhy(cached = TRUE))
  expect_silent(radlb(cached = TRUE))
  expect_silent(radmh(cached = TRUE))
  expect_silent(radpc(cached = TRUE))
  expect_silent(radpp(cached = TRUE))
  expect_silent(radqlqc(cached = TRUE))
  expect_silent(radqs(cached = TRUE))
  expect_silent(radrs(cached = TRUE))
  expect_silent(radsub(cached = TRUE))
  expect_silent(radtr(cached = TRUE))
  expect_silent(radtte(cached = TRUE))
  expect_silent(radvs(cached = TRUE))
})

test_that("seed works", {
  expect_true(identical(radsl(seed = 1), radsl(seed = 1)))
})

test_that("radsl works with large N", {
  n <- 120000
  adsl <- radsl(n, seed = 123)

  adsl_n <- nrow(adsl)

  expect_equal(adsl_n, n)
})

test_that("radsl has no LSTALVDT greater than DTHDT", {
  adsl <- radsl(cached = TRUE)
  adsl_no_na <- adsl[!is.na(adsl$DTHDT) & !is.na(adsl$LSTALVDT), ]
  expect_true(all(adsl_no_na$DTHDT >= adsl_no_na$LSTALVDT))
})

test_that("radcm works with who_coding = TRUE", {
  adsl <- radsl(cached = TRUE)
  expect_silent(radcm(adsl, who_coding = TRUE))
})
