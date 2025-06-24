options(pillar.print_max = Inf, pillar.width = Inf)

set.seed(1)

test_that("radsl produces expected values with change of sex percentage", {

  adsl <- radsl(100000, seed = 1)
  female_prop <- sum(adsl$SEX == "F") / nrow(adsl)
  expect_equal(female_prop, 0.52, tolerance = 1e-03)

  adsl <- radsl(100000, seed = 1, female_prob = 0.8)
  female_prop <- sum(adsl$SEX == "F") / nrow(adsl)
  expect_equal(female_prop, 0.8, tolerance = 1e-03)
})
