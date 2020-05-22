# script to create and save cached data to data/ directory
# starting in R 3.6.0 the default kind of under-the-hood random-number generator was changed.
# Now, in order to get the results from set.seed() to match, you have to first call the
# function RNGkind(sample.kind = "Rounding").
# It does throw an expected warning
# Warning message:
# In RNGkind(sample.kind = "Rounding") : non-uniform 'Rounding' sampler used
#' @examples
#' must call the RNGkind function first to maintain state when rebuilding the cache
#' library(dplyr)
#' library(random.cdisc.data)
#' RNGkind(sample.kind = "Rounding")
#' cadsl_new <- radsl(seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#' cadae_new <- radae(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#' cadaette_new <- radaette(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#' cadcm_new <- radcm(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#' cadex_new <- radex(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#' cadlb_new <- radlb(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#' cadmh_new <- radmh(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#' cadqs_new <- radqs(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#' cadrs_new <- radrs(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#' cadtte_new <- radtte(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#' cadvs_new <- radvs(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#'
#' # use diffdf package: diffdf() to compare cached vs new and review/verify differences
#' \dontrun{
#' diffdf(cadsl, cadsl_new)
#'}
#' # create environment objects to save out to cache
#' cadsl <- cadsl_new
#' cadae <- cadae_new
#' cadaette <- cadaette_new
#' cadcm <- cadcm_new
#' cadex <- cadex_new
#' cadlb <- cadlb_new
#' cadmh <- cadmh_new
#' cadqs <- cadqs_new
#' cadrs <- cadrs_new
#' cadtte <- cadtte_new
#' cadvs <- cadvs_new
#'
#' # once diff review is completed then update cache
#' save(cadsl, file = "data/cadsl.RData", compress = "xz")
#' save(cadae, file = "data/cadae.RData", compress = "xz")
#' save(cadaette, file = "data/cadaette.RData", compress = "xz")
#' save(cadcm, file = "data/cadcm.RData", compress = "xz")
#' save(cadex, file = "data/cadex.RData", compress = "xz")
#' save(cadlb, file = "data/cadlb.RData", compress = "xz")
#' save(cadmh, file = "data/cadmh.RData", compress = "xz")
#' save(cadqs, file = "data/cadqs.RData", compress = "xz")
#' save(cadrs, file = "data/cadrs.RData", compress = "xz")
#' save(cadtte, file = "data/cadtte.RData", compress = "xz")
#' save(cadvs, file = "data/cadvs.RData", compress = "xz")
