options(pillar.print_max = Inf, pillar.width = Inf)

set.seed(1)
adsl <- radsl(10, seed = 1)
adpc <- radpc(adsl, seed = 1)

test_that("radsl produces expected values", {
  first_pt_rows <- adsl[adsl$USUBJID == adsl$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adsl[sample(seq_len(nrow(adsl)), 5), ]
  expect_snapshot(rand_rows)
})

test_that("radae produces expected values", {
  adae <- radae(adsl, seed = 1)

  first_pt_rows <- adae[adae$USUBJID == adae$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adae[sample(seq_len(nrow(adae)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radaette produces expected values", {
  adaette <- radaette(adsl, seed = 1)

  first_pt_rows <- adaette[adaette$USUBJID == adaette$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adaette[sample(seq_len(nrow(adaette)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radcm produces expected values", {
  adcm <- radcm(adsl, seed = 1)

  first_pt_rows <- adcm[adcm$USUBJID == adcm$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adcm[sample(seq_len(nrow(adcm)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("raddv produces expected values", {
  addv <- raddv(adsl, seed = 1)

  first_pt_rows <- addv[addv$USUBJID == addv$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- addv[sample(seq_len(nrow(addv)), 2), ]
  expect_snapshot(rand_rows)
})

test_that("radeg produces expected values", {
  adeg <- radeg(adsl, seed = 1)

  first_pt_rows <- adeg[adeg$USUBJID == adeg$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adeg[sample(seq_len(nrow(adeg)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radex produces expected values", {
  adex <- radex(adsl, seed = 1)

  first_pt_rows <- adex[adex$USUBJID == adex$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adex[sample(seq_len(nrow(adex)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radhy produces expected values", {
  adhy <- radhy(adsl, seed = 1)

  first_pt_rows <- adhy[adhy$USUBJID == adhy$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adhy[sample(seq_len(nrow(adhy)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radlb produces expected values", {
  adlb <- radlb(adsl, seed = 1)

  first_pt_rows <- adlb[adlb$USUBJID == adlb$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adlb[sample(seq_len(nrow(adlb)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radmh produces expected values", {
  admh <- radmh(adsl, seed = 1)

  first_pt_rows <- admh[admh$USUBJID == admh$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- admh[sample(seq_len(nrow(admh)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radpc produces expected values", {
  first_pt_rows <- adpc[adpc$USUBJID == adpc$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adpc[sample(seq_len(nrow(adpc)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radab produces expected values", {
  adab <- radab(adsl, adpc, seed = 1)

  first_pt_rows <- adab[adab$USUBJID == adab$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adab[sample(seq_len(nrow(adab)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radpp produces expected values", {
  adpp <- radpp(adsl, seed = 1)

  first_pt_some_rows <- adpp[sample(which(adpp$USUBJID == adpp$USUBJID[1]), 10), ]
  expect_snapshot(first_pt_some_rows)

  rand_rows <- adpp[sample(seq_len(nrow(adpp)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radqlqc produces expected values", {
  adqlqc <- radqlqc(adsl, percent = 80, number = 2, seed = 1)

  first_pt_rows <- adqlqc[adqlqc$USUBJID == adqlqc$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adqlqc[sample(seq_len(nrow(adqlqc)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radqs produces expected values", {
  adqs <- radqs(adsl, seed = 1)

  first_pt_rows <- adqs[adqs$USUBJID == adqs$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adqs[sample(seq_len(nrow(adqs)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radrs produces expected values", {
  adrs <- radrs(adsl, seed = 1)

  first_pt_rows <- adrs[adrs$USUBJID == adrs$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adrs[sample(seq_len(nrow(adrs)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radsaftte produces expected values", {
  adsaftte <- radsaftte(adsl, seed = 1)

  first_pt_rows <- adsaftte[adsaftte$USUBJID == adsaftte$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adsaftte[sample(seq_len(nrow(adsaftte)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radsub produces expected values", {
  adsub <- radsub(adsl, seed = 1)

  first_pt_rows <- adsub[adsub$USUBJID == adsub$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adsub[sample(seq_len(nrow(adsub)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radtr produces expected values", {
  adtr <- radtr(adsl, seed = 1)

  first_pt_rows <- adtr[adtr$USUBJID == adtr$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adtr[sample(seq_len(nrow(adtr)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radtte produces expected values", {
  adtte <- radtte(adsl, seed = 1)

  first_pt_rows <- adtte[adtte$USUBJID == adtte$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- adtte[sample(seq_len(nrow(adtte)), 10), ]
  expect_snapshot(rand_rows)
})

test_that("radvs produces expected values", {
  advs <- radvs(adsl, seed = 1)

  first_pt_rows <- advs[advs$USUBJID == advs$USUBJID[1], ]
  expect_snapshot(first_pt_rows)

  rand_rows <- advs[sample(seq_len(nrow(advs)), 10), ]
  expect_snapshot(rand_rows)
})
