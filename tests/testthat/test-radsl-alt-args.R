options(pillar.print_max = Inf, pillar.width = Inf)

set.seed(1)

test_that("radsl produces expected values with change of sex percentage", {

  adsl <- radsl(100000, seed = 1, female_prob = 0.8)

  first_pt_rows <- adsl[adsl$USUBJID == adsl$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adsl[sample(seq_len(nrow(adsl)), 5), ]
  expect_snapshot(rand_rows)

  expect_equal(round(sum(adsl$SEX == "F") / nrow(adsl), digits = 1), 0.8)
})

test_that("radsl errors with bad input for sex percentage", {

  expect_error(radsl(100000, seed = 1, female_prob = "0.8"), "Must be of type 'number', not 'character'")
  expect_error(radsl(100000, seed = 1, female_prob = -0.2), "Element 1 is not >= 0")
  expect_error(radsl(100000, seed = 1, female_prob = 1.2), "Element 1 is not <= 1")

})
