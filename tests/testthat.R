library(testthat)

test_results <- test_check("random.cdisc.data")
saveRDS(test_results, "unit_testing_results.rds")
