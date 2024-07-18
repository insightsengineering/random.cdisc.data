test_that("Checking that levels are reduced correctly for multiple variables with defaults", {
  rlang::with_interactive(
    expect_message(
      out <- reduce_num_levels_in_df(random.cdisc.data::cadae, "AEDECOD"),
      paste0(
        "Reducing levels of random.cdisc.data::cadae for variable AEDECOD: ",
        "keeping 6 levels out of 10 levels. Total rows kept \\(\\%\\): 63.3"
      )
    )
  )
  expect_equal(length(levels(out$AEDECOD)), 6L)

  skip_if_not_installed("ggplot2")
  suppressMessages(a_plot <- reduce_num_levels_in_df(random.cdisc.data::cadae, "AEDECOD", explorative = TRUE))
  expect_true(ggplot2::is.ggplot(a_plot))
})

test_that("reduce_num_levels_in_df(num_max_values) works", {
  rlang::with_interactive(
    expect_message(
      out <- reduce_num_levels_in_df(random.cdisc.data::cadae, "AEDECOD", num_max_values = 5),
      "keeping 5 levels out of 10 levels"
    )
  )
  expect_equal(length(levels(out$AEDECOD)), 5L)
})

test_that("reduce_num_levels_in_df(num_max_values, num_of_rare_values) works", {
  cadae_tmp <- random.cdisc.data::cadae %>% mutate(AEDECOD = as.character(AEDECOD))
  cadae_tmp$AEDECOD[1] <- "an_outlier"
  rlang::with_interactive(
    expect_message(
      out <- reduce_num_levels_in_df(cadae_tmp, "AEDECOD", num_max_values = 5, num_of_rare_values = 2),
      "keeping 5 levels out of 11 levels"
    )
  )

  expect_equal(length(levels(out$AEDECOD)), 5L)
  expect_true(cadae_tmp$AEDECOD[1] %in% names(table(out$AEDECOD)))

  expect_error(reduce_num_levels_in_df(cadae_tmp, "AEDECOD", num_max_values = 5, num_of_rare_values = 6))
})

test_that("reduce_num_levels_in_df(add_specific_value) works", {
  cadae_tmp <- cadae %>% mutate(AEDECOD = as.character(AEDECOD))
  cadae_tmp$AEDECOD[1] <- "an_outlier"
  rlang::with_interactive(
    expect_message(
      out <- reduce_num_levels_in_df(cadae_tmp, "AEDECOD", num_max_values = 5, add_specific_value = "an_outlier"),
      "keeping 6 levels out of 11 levels"
    )
  )

  expect_equal(length(levels(out$AEDECOD)), 6L)
  expect_true(cadae_tmp$AEDECOD[1] %in% names(table(out$AEDECOD)))

  expect_error(reduce_num_levels_in_df(cadae_tmp, "AEDECOD", num_max_values = 5, add_specific_value = 6))
})

test_that("reduce_num_levels_in_df(add_specific_value) works", {
  cadae_tmp <- cadae %>% mutate(AEDECOD = as.character(AEDECOD))
  cadae_tmp$AEDECOD[1] <- "an_outlier"
  rlang::with_interactive(
    expect_message(
      out <- reduce_num_levels_in_df(cadae_tmp, "AEDECOD", num_max_values = 5, keep_spec_rows = c(1, 4)),
      "keeping 5 \\+ 1 \\(from keep_spec_rows\\)"
    )
  )

  expect_equal(length(levels(out$AEDECOD)), 6L)
  expect_true(cadae_tmp$AEDECOD[1] %in% names(table(out$AEDECOD)))

  expect_error(reduce_num_levels_in_df(cadae_tmp, "AEDECOD", num_max_values = 5, keep_spec_rows = "asdsa"))
})
