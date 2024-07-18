test_that("Checking that levels are reduced correctly for multiple variables", {
  expect_message(
    reduce_num_levels_in_df(cadae, "AEDECOD"),
    "Reducing levels of cadae for variable AEDECOD: keeping 6 levels out of 10 levels. Total kept \\(%\\): 63.3"
  )
  out <- suppressMessages(reduce_num_levels_in_df(cadae, "AEDECOD"))
  expect_equal(length(levels(out$AEDECOD)), 6L)

  skip_if_not_installed(ggplot2)
  suppressMessages(a_plot <- reduce_num_levels_in_df(cadae, "AEDECOD", explorative = TRUE))
  expect_true(ggplot2::is.ggplot(a_plot))
})
