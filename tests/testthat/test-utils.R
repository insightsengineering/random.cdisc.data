test_that("get_cached_data returns correct error message", {
  detach("package:random.cdisc.data")
  expect_error(
    random.cdisc.data:::get_cached_data("fakedata"),
    "cached data can only be loaded if the random.cdisc.data package is attached"
  )
})

test_that("sample_fct works as expected", {
  set.seed(1)
  result <- random.cdisc.data:::sample_fct(letters[1:3], 5)
  expected <- factor(c("a", "c", "a", "b", "a"), levels = letters[1:3])
  expect_identical(result, expected)
})

test_that("relvar_init works as expected", {
  result <- random.cdisc.data:::relvar_init(letters[1:3], LETTERS[1:3])
  expected <- list(relvar1 = letters[1:3], relvar2 = LETTERS[1:3])
  expect_identical(result, expected)
})

test_that("relvar_init returns correct error message", {
  expect_error(
    random.cdisc.data:::relvar_init(letters[1:3], LETTERS[1:2]),
    "The argument value length of relvar1 and relvar2 differ"
  )
})

test_that("rel_var works as expected", {
  params <- c("Level A", "Level B", "Level C")
  adlb_df <- data.frame(
    ID = 1:6,
    PARAM = factor(rep(c("Level A", "Level B", "Level C"), 2), levels = params)
  )

  result <- random.cdisc.data:::rel_var(
    df = adlb_df,
    var_name = "PARAMCD",
    var_values = LETTERS[1:3],
    related_var = "PARAM"
  )
  expected <- data.frame(
    ID = 1:6,
    PARAM = factor(rep(c("Level A", "Level B", "Level C"), 2)),
    PARAMCD = factor(rep(LETTERS[1:3], 2))
  )
  expect_identical(result, expected)

  result2 <- random.cdisc.data:::rel_var(
    df = adlb_df,
    var_name = "PARAMCD",
    related_var = "PARAM"
  )
  expect_identical(result2$PARAMCD, factor(rep(NA, 6)))
})

test_that("visit_schedule works with WEEK visit_format", {
  result <- random.cdisc.data:::visit_schedule(visit_format = "WEEK", n_assessments = 2L)
  expected <- factor(
    c("SCREENING", "BASELINE", "WEEK 1 DAY 8", "WEEK 2 DAY 15"),
    levels = c("SCREENING", "BASELINE", "WEEK 1 DAY 8", "WEEK 2 DAY 15")
  )
  expect_equal(result, expected, ignore_attr = TRUE)
})

test_that("visit_schedule works with CycLe visit_format", {
  result <- random.cdisc.data:::visit_schedule(visit_format = "CycLe", n_assessments = 2L, n_days = 2L)
  expected <- factor(
    c("SCREENING", "CYCLE 1 DAY 1", "CYCLE 1 DAY 2", "CYCLE 2 DAY 1", "CYCLE 2 DAY 2"),
    levels = c("SCREENING", "CYCLE 1 DAY 1", "CYCLE 1 DAY 2", "CYCLE 2 DAY 1", "CYCLE 2 DAY 2")
  )
  expect_equal(result, expected, ignore_attr = TRUE)
})

test_that("retain works as expected", {
  adsl_df <- radsl(N = 10, seed = 1)
  result <- random.cdisc.data:::retain(df = adsl_df, value_var = adsl_df$AGE, event = adsl_df$DTHFL == "Y")
  expected <- c(NA, NA, NA, 31, 31, 35, 35, 35, 35, 35)
  expect_equal(result, expected)
})

test_that("var_relabel works as expected", {
  result <- random.cdisc.data:::var_relabel(
    data.frame(letters = letters[1:5]),
    letters = "Letter Variable"
  )
  expect_identical(attr(result$letters, "label"), "Letter Variable")
})

test_that("var_relabel returns correct error message", {
  expect_error(
    random.cdisc.data:::var_relabel(
      data.frame(letters = letters[1:5]),
      "Letter Variable"
    ), "missing variable declarations"
  )
})

test_that("replace_na works as expected", {
  result <- replace_na(letters[1:10], percentage = 0.5, seed = 1)
  expected <- c(NA, NA, "c", NA, "e", "f", NA, "h", NA, "j")
  expect_identical(result, expected)

  result <- replace_na(letters[1:10], percentage = 0)
  expect_identical(result, letters[1:10])
})

test_that("mutate_na works as expected", {
  df <- data.frame(letters = letters[1:10], numbers = 1:10)

  suppressWarnings(expect_warning(result <- random.cdisc.data:::mutate_na(
    df,
    na_vars = list(
      letters = c(1, 0.5),
      test = c(1, 1)
    )
  ), "test not in column names"))

  expected <- c(NA, NA, "c", NA, "e", "f", NA, "h", NA, "j")
  expect_identical(result$letters, expected)
  expect_identical(result$numbers, 1:10)

  result <- random.cdisc.data:::mutate_na(df)
  expect_identical(result, df)
})

test_that("rtpois works as expected", {
  set.seed(1)
  result <- rtpois(10, 5)
  expected <- c(4, 4, 5, 8, 3, 8, 9, 6, 6, 2)
  expect_identical(result, expected)
})

test_that("rtexp works as expected", {
  set.seed(1)
  result <- rtexp(3, 5)
  expected <- c(0.15103637, 0.23632856, 0.02914135)
  expect_equal(result, expected, tolerance = 1e-7)

  result <- rtexp(3, 5, l = 0.5)
  expected <- c(0.9776456, 0.5450496, 0.9573220)
  expect_equal(result, expected, tolerance = 1e-7)

  result <- rtexp(3, 5, r = 0.5)
  expected <- c(0.4036792, 0.1865634, 0.1723005)
  expect_equal(result, expected, tolerance = 1e-7)
})
