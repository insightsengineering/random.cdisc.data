test_that("RACE parameters work as expected", {
  # generate adsl with default RACE values - default function behavior
  adsl_default_race <- radsl()
  # expect unique RACE to be default values
  expect_true(
    all(as.vector(unique(adsl_default_race$RACE)) %in% c("ASIAN", "BLACK OR AFRICAN AMERICAN", "WHITE", "AMERICAN INDIAN OR ALASKA NATIVE",
                                                        "MULTIPLE", "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER", "OTHER", "UNKNOWN"))
  )

  # generate adsl with user-defined RACE values and probabilities
  adsl_user_race <- radsl(race_list = c("ASIAN", "BLACK OR AFRICAN AMERICAN", "WHITE"),
                             race_prob = c(0.4, 0.3, 0.3))
      # expect unique RACE to be user-defined values
      expect_true(
        all(as.vector(unique(adsl_user_race$RACE)) %in% c("ASIAN", "BLACK OR AFRICAN AMERICAN", "WHITE"))
      )

})

test_that("radsl stops if race_prob is not numeric or sum of race_prob is different from 1", {

  # expect an error if sum of race_prob is different from 1
  expect_error(radsl(race_list = c("ASIAN", "BLACK OR AFRICAN AMERICAN", "WHITE"),
                     race_prob = c(0.4, 0.3, 0.6)))

  # expect an error if race_prob is not numeric
  expect_error(radsl(race_list = c("ASIAN", "BLACK OR AFRICAN AMERICAN", "WHITE"),
                     race_prob = c("0.4", "0.3", "0.3")))
})

test_that("radsl stops if race_list and race_prob do not have the same length", {

  # expect an error if race_list and race_prob do not have the same length
  expect_error(radsl(race_list = c("ASIAN", "BLACK OR AFRICAN AMERICAN"),
                     race_prob = c(0.4, 0.3, 0.6)))

})
