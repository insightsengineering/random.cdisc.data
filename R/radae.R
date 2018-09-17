## use the medra data in sysdat


lookup_ae = tribble(
  ~AEBODSYS,   ~AEDECOD, ~AETOXGR,
  "cl A",   "trm A_1/2",        1,
  "cl A",   "trm A_2/2",        2,
  "cl B",   "trm B_1/3",        5,
  "cl B",   "trm B_2/3",        3,
  "cl B",   "trm B_3/3",        1,
  "cl C",   "trm C_1/1",        4
)


#' @export
radae <- function(ASL, max_n_aes = 10, seed = NULL) {

  if (!is.null(seed)) set.seed(seed)

  Map(function(id, sid) {
    n_aes <- sample(0:max_n_aes, 1)
    i <- sample(1:nrow(lookup_ae), n_aes, TRUE)
    lookup_ae[i, ] %>% mutate(
      USUBJID = id,
      STUDYID = sid
    )
  }, ASL$USUBJID, ASL$STUDYID) %>%
    Reduce(rbind, .) %>%
    `[`(c(4,5,1,2,3)) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier",
      AEBODSYS = "Body System or Organ Class",
      AEDECOD = "Dictionary-Derived Term",
      AETOXGR = "Standard Toxicity Grade"
    )
}

