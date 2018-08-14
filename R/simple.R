#' @export
sample_fct <- function(x, N, ...) {
  factor(sample(x, N, replace = TRUE, ...), levels = x)
}

var_relabel <- function(x, ...) {
  dots <- list(...)
  varnames <- names(dots)
  if (is.null(varnames)) stop("missing variable declarations")
  map_varnames <- match(varnames, names(x))
  for (i in seq_along(map_varnames)) {
    attr(x[[map_varnames[[i]]]], "label") <-  dots[[i]]
  }
  x
}

#' Generate ASL
#'
#' @param N number of patients
#' @param seed seed for random number generation
#'
#' @export
#'
#' @examples
#'
#' ASL <- rasl()
#'
rasl <- function(N = 400, seed = NULL) {

  if (!is.null(seed)) set.seed(seed)

  tibble(
    SUBJID = paste("id", seq_len(N), sep = "-"),
    STUDYID = rep("AB12345", N),
    SITEID = paste0("XYZ", 1:2) %>% sample_fct(N),
    USUBJID = paste(STUDYID, SITEID, SUBJID, sep = "-"),
    AGE = sapply(floor(rnorm(N, mean = 20, sd = 20)), max, 0) + 20,
    SEX = c("F", "M", "U", "UNDIFFERENTIATED") %>% sample_fct(N, prob = c(.5, .48, .015, .005)),
    ARMCD = c("ARM A", "ARM B", "ARM C") %>%sample_fct(N),
    COUNTRY = c("BES", "CUW", "SXM", "AFG") %>% sample_fct(N),
    RACE = c("BLACK OR AFRICAN AMERICAN", "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER",
             "AMERICAN INDIAN OR ALASKA NATIVE", "ASIAN", "WHITE", "UNKNOWN",
             "OTHER", "MULTIPLE") %>%
      sample_fct(N),
    STRATA1 = c("A", "B", "C") %>% sample_fct(N),
    STRATA2 = c("S1", "S2") %>% sample_fct(N),
    BMRKR1 = rchisq(N, 6),
    BMRKR2 = c("low", "medium", "high") %>% sample_fct(N)
  ) %>% mutate(
    ARM = recode(ARMCD, "ARM A" = "A: Drug X", "ARM B" = "B: Placebo", "ARM C" = "C: Combination"),
    ACTARM = ARMCD
  ) %>% var_relabel(
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier",
    SUBJID = "Subject Identifier for the Study",
    SITEID = "Study Site Identifier",
    AGE = "Age",
    SEX = "Sex",
    RACE = "Race",
    ARMCD = "Planned Arm Code",
    ARM = "Description of Planned Arm",
    ACTARM = "Description of Actual Arm",
    COUNTRY = "Country",
    BMRKR1 = "Cont. Biomarker 1",
    BMRKR2 = "Cat. Biomarker 2",
    STRATA1 = "Stratification Factor 1",
    STRATA2 = "Stratification Factor 2"
  )
}

lookup_ATE <- tribble(
  ~ARM,  ~PARAMCD, ~PARAM, ~ LAMBDA, ~CNSR_P,
  "ARM A", "OS",   "Overall Survival",  1/80,     0.4,
  "ARM B", "OS",   "Overall Survival", 1/100,     0.2,
  "ARM C", "OS",   "Overall Survival",  1/60,     0.42,
  "ARM A", "PFS",   "Progression Free Survival",  1/100,     0.3,
  "ARM B", "PFS",   "Progression Free Survival", 1/150,     0.1,
  "ARM C", "PFS",   "Progression Free Survival",  1/80,     0.32,
  "ARM A", "EFS",   "Event Free Survival",  1/80,     0.2,
  "ARM B", "EFS",   "Event Free Survival", 1/100,     0.08,
  "ARM C", "EFS",   "Event Free Survival",  1/60,     0.23
)

evntdescr_sel <- c(
  'Death',
  'Disease Progression',
  'Last Tumor Assessment',
  'Adverse Event',
  'Last Date Known To Be Alive'
)


#' random ATE
#'
#' @export
rate <- function(ASL, seed = NULL) {

  # pinfo <- split(ASL, ASL$USUBJID)[[1]]
  split(ASL, ASL$USUBJID) %>% lapply(FUN = function(pinfo) {

    lookup_ATE %>% filter(ARM == as.character(pinfo$ACTARM)) %>%
      rowwise() %>%
      mutate(
        STUDYID = pinfo$STUDYID,
        SITEID = pinfo$SITEID,
        USUBJID = pinfo$USUBJID,
        CNSR = sample(c(0, 1), 1, prob = c(1-CNSR_P, CNSR_P)),
        AVAL = rexp(1, LAMBDA),
        AVALU = "DAYS",
        EVNTDESC = if (CNSR == 1) sample(evntdescr_sel[-c(1:2)], 1) else sample(evntdescr_sel, 1)
      ) %>% select(-LAMBDA, -CNSR_P)

  })  %>% Reduce(rbind, .) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier",
      SITEID = "Study Site Identifier",
      PARAM = "Parameter Description",
      PARAMCD = "Parameter Code",
      AVAL = "Analysis Value",
      AVALU = "Analysis Value Unit",
      EVNTDESC = "Event Description",
      CNSR = "Censoring Status Value(1=cens, 0=evt)"
    )

}


param_codes <- setNames(1:5, c("CR", "PR", "SD", "PD", "NE"))

lookup_ARS <- expand.grid(
  ARM = c("ARM A", "ARM B", "ARM C"),
  AVALC = names(param_codes)
) %>% mutate(
  AVAL = param_codes[AVALC],
  p_scr = c(rep(0, 3), rep(0, 3), c(1, 1, 1), c(0, 0, 0), c(0, 0, 0)),
  p_eoi = c(c(.6, .4, .7), c(.3, .2, .2), c(.05, .2, .03), c(.04, 0.1, 0.05), c(.01, 0.1, 0.02)),
  p_fu = c(c(.3, .2, .4), c(.2, .1, .3), c(.2, .2, .2), c(.3, .5, 0.1), rep(0, 3))
)

#' Random ARS
#'
#' @export
rars <- function(ASL, seed = NULL) {

  if (!is.null(seed)) set.seed(seed)


  split(ASL, ASL$USUBJID) %>% lapply(FUN = function(pinfo) {

    probs <- lookup_ARS %>%
      filter(ARM == as.character(pinfo$ACTARM))

    # screening
    rsp_screen <- sample(probs$AVALC, 1, prob = probs$p_scr) %>% as.character()

    # end of induction
    rsp_eoi <- sample(probs$AVALC, 1, prob = probs$p_eoi) %>% as.character()

    # follow up
    rsp_fu <- sample(probs$AVALC, 1, prob = probs$p_fu) %>% as.character()

    best_rsp <- min(param_codes[c(rsp_screen, rsp_eoi, rsp_fu)])
    best_rsp_i <- which.min(param_codes[c(rsp_screen, rsp_eoi, rsp_fu)])

    avisit = c("screening", "end of induction", "follow up")

    tibble(
      STUDYID = pinfo$STUDYID,
      SITEID = pinfo$SITEID,
      USUBJID = pinfo$USUBJID,
      PARAMCD = c(rep("OVRINV", 3), "BESRSPI", "INVET"),
      PARAM = recode(PARAMCD, OVRINV = "Overall Response",
                     BESRSPI = "Best Overall Response",
                     INVET = "Investigator End Of Induction Response"),
      AVALC = c(rsp_screen, rsp_eoi, rsp_fu,
                names(param_codes)[best_rsp],
                rsp_eoi
      ),
      AVAL = param_codes[AVALC],
      AVISIT = factor(c(avisit, avisit[best_rsp_i], avisit[2]), levels = avisit)
    )
  }) %>% Reduce(rbind, .) %>%
    mutate(AVALC = factor(AVALC, levels = names(param_codes))) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier",
      SITEID = "Study Site Identifier",
      PARAM = "Parameter Description",
      PARAMCD = "Parameter Code",
      AVAL = "Analysis Value",
      AVALC = "Analysis Value Category",
      AVISIT = "Analysis Visit Window"
    )

}

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
raae <- function(ASL, max_n_aes = 10, seed = NULL) {

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

