test_that("Checking that levels are reduced correctly for multiple variables with defaults", {
  expect_message(
    out <- reduce_num_levels_in_df(random.cdisc.data::cadae, "AEDECOD"),
    paste0(
      "Reducing levels of random.cdisc.data::cadae for variable AEDECOD: ",
      "keeping 6 levels out of 10 levels. Total rows kept \\(\\%\\): 63.3"
    )
  )
  expect_equal(length(levels(out$AEDECOD)), 6L)
})

test_that("reduce_num_levels_in_df(explorative = TRUE) Plots are returned", {
  skip_if_not_installed("ggplot2")
  suppressMessages(a_plot <- reduce_num_levels_in_df(random.cdisc.data::cadae, "AEDECOD", explorative = TRUE))
  expect_true(ggplot2::is.ggplot(a_plot))
  suppressMessages(a_plot <- reduce_num_levels_in_df(random.cdisc.data::cadae, "AEDECOD",
    explorative = TRUE,
    num_max_values = 5
  ))
  expect_true(ggplot2::is.ggplot(a_plot))
  cadae_tmp <- random.cdisc.data::cadae %>% mutate(AEDECOD = as.character(AEDECOD))
  cadae_tmp$AEDECOD[1] <- "an_outlier"
  cadae_tmp$AEDECOD[2] <- "another_outlier"
  suppressMessages(a_plot <- reduce_num_levels_in_df(random.cdisc.data::cadae, "AEDECOD",
    explorative = TRUE,
    num_max_values = 5, add_specific_value = "an_outlier"
  ))
  expect_true(ggplot2::is.ggplot(a_plot))
  suppressMessages(suppressWarnings(a_plot <- reduce_num_levels_in_df(random.cdisc.data::cadae, "AEDECOD",
    explorative = TRUE,
    num_max_values = 5, add_specific_value = c("an_outlier", "another_outlier")
  )))
  expect_true(ggplot2::is.ggplot(a_plot))
})

test_that("reduce_num_levels_in_df(num_max_values) works", {
  expect_message(
    out <- reduce_num_levels_in_df(random.cdisc.data::cadae, "AEDECOD", num_max_values = 5),
    "keeping 5 levels out of 10 levels"
  )
  expect_equal(length(levels(out$AEDECOD)), 5L)
})

test_that("reduce_num_levels_in_df(num_max_values, num_of_rare_values) works", {
  cadae_tmp <- random.cdisc.data::cadae %>% mutate(AEDECOD = as.character(AEDECOD))
  cadae_tmp$AEDECOD[1] <- "an_outlier"
  expect_message(
    out <- reduce_num_levels_in_df(cadae_tmp, "AEDECOD", num_max_values = 5, num_of_rare_values = 2),
    "keeping 5 levels out of 11 levels"
  )

  expect_equal(length(levels(out$AEDECOD)), 5L)
  expect_true(cadae_tmp$AEDECOD[1] %in% names(table(out$AEDECOD)))

  expect_error(reduce_num_levels_in_df(cadae_tmp, "AEDECOD", num_max_values = 5, num_of_rare_values = 6))
})

test_that("reduce_num_levels_in_df(add_specific_value) works", {
  cadae_tmp <- random.cdisc.data::cadae %>% mutate(AEDECOD = as.character(AEDECOD))
  cadae_tmp$AEDECOD[1] <- "an_outlier"
  expect_message(
    out <- reduce_num_levels_in_df(cadae_tmp, "AEDECOD", num_max_values = 5, add_specific_value = "an_outlier"),
    "keeping 6 levels out of 11 levels"
  )

  expect_equal(length(levels(out$AEDECOD)), 6L)
  expect_true(cadae_tmp$AEDECOD[1] %in% names(table(out$AEDECOD)))

  expect_error(reduce_num_levels_in_df(cadae_tmp, "AEDECOD", num_max_values = 5, add_specific_value = 6))
})

test_that("reduce_num_levels_in_df(add_specific_value) works", {
  cadae_tmp <- random.cdisc.data::cadae %>% mutate(AEDECOD = as.character(AEDECOD))
  cadae_tmp$AEDECOD[1] <- "an_outlier"
  expect_message(
    out <- reduce_num_levels_in_df(cadae_tmp, "AEDECOD", num_max_values = 5, keep_spec_rows = c(1, 4)),
    "keeping 5 \\+ 1 \\(from keep_spec_rows\\)"
  )

  expect_equal(length(levels(out$AEDECOD)), 6L)
  expect_true(cadae_tmp$AEDECOD[1] %in% names(table(out$AEDECOD)))

  expect_error(reduce_num_levels_in_df(cadae_tmp, "AEDECOD", num_max_values = 5, keep_spec_rows = "asdsa"))
})

# describe_cols ----------------------------------------------------------------
test_that("describe_cols(df) works", {
  adae <- random.cdisc.data::cadae
  expect_equal(
    describe_cols(adae)$col.name,
    colnames(adae)
  )
})
