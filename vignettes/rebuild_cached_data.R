## ---- eval=FALSE--------------------------------------------------------------
#  library(dplyr)
#  library(random.cdisc.data)
#  
#  # call function to be able to match randome number generation from previous R versions
#  RNGkind(sample.kind = "Rounding")
#  
#  # create the new cached data sets
#  cadsl_new <- radsl(seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  cadae_new <- radae(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  cadaette_new <- radaette(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  cadcm_new <- radcm(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  cadex_new <- radex(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  cadlb_new <- radlb(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  cadmh_new <- radmh(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  cadqs_new <- radqs(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  cadrs_new <- radrs(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  cadtte_new <- radtte(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  cadvs_new <- radvs(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  cadeg_new <- radeg(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  cadtr_new <- radtr(cadsl, seed = 1, na_vars = list()) %>% `attr<-`("creation date", Sys.Date())
#  
#  # use diffdf package: diffdf() to compare cached vs new and review/verify differences
#  diffdf(cadsl, cadsl_new)
#  
#  # when diff reflects changes accurately then create environment objects to save out to cache
#  cadsl <- cadsl_new
#  cadae <- cadae_new
#  cadaette <- cadaette_new
#  cadcm <- cadcm_new
#  cadeg <- cadeg_new
#  cadex <- cadex_new
#  cadlb <- cadlb_new
#  cadmh <- cadmh_new
#  cadqs <- cadqs_new
#  cadrs <- cadrs_new
#  cadtr <- cadtr_new
#  cadtte <- cadtte_new
#  cadvs <- cadvs_new
#  
#  # update cache
#  save(cadsl, file = "data/cadsl.RData", compress = "xz")
#  save(cadae, file = "data/cadae.RData", compress = "xz")
#  save(cadaette, file = "data/cadaette.RData", compress = "xz")
#  save(cadcm, file = "data/cadcm.RData", compress = "xz")
#  save(cadeg, file = "data/cadeg.RData", compress = "xz")
#  save(cadex, file = "data/cadex.RData", compress = "xz")
#  save(cadlb, file = "data/cadlb.RData", compress = "xz")
#  save(cadmh, file = "data/cadmh.RData", compress = "xz")
#  save(cadqs, file = "data/cadqs.RData", compress = "xz")
#  save(cadrs, file = "data/cadrs.RData", compress = "xz")
#  save(cadtr, file = "data/cadtr.RData", compress = "xz")
#  save(cadtte, file = "data/cadtte.RData", compress = "xz")
#  save(cadvs, file = "data/cadvs.RData", compress = "xz")

