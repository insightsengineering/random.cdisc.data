#' Time To Adverse Event Dataset (ADAETTE)
#'
#' Function to generate random time to AE dataset for a
#' given subject-level analysis dataset (ADSL)
#'
#' @details
#' One record per subject per event.
#'
#' @inheritParams radsl
#' @template param_ADSL
#' @template param_lookup
#' @param event.descr Character vector with description of events.
#' @param censor.descr Character vector with description of censors.
#'
#' @export
#'
#' @import tibble
#'
#' @author Xiuting Mi
#'
#' @examples
#' asl <- radsl()
#' adaette <- radaette(ADSL = asl)
#' head(adaette)
#'
radaette <- function(ADSL, seed = NULL, lookup = NULL, event.descr = NULL, censor.descr = NULL) {

  if (is.null(lookup)){
    lookup_ADAETTE <- tribble(
      ~ARM,  ~PARAMCD, ~PARAM, ~LAMBDA, ~CNSR_P,
      "ARM A", "AETTE1",   "Time to first occurrence of any adverse event",  1/80,     0.4,
      "ARM B", "AETTE1",   "Time to first occurrence of any adverse event", 1/100,     0.2,
      "ARM C", "AETTE1",   "Time to first occurrence of any adverse event",  1/60,     0.42,
      "ARM A", "AETTE2",   "Time to first occurrence of any serious adverse event",  1/100,     0.3,
      "ARM B", "AETTE2",   "Time to first occurrence of any serious adverse event", 1/150,     0.1,
      "ARM C", "AETTE2",   "Time to first occurrence of any serious adverse event",  1/80,     0.32,
      "ARM A", "AETTE3",   "Time to first occurrence of a grade 3-5 adverse event",  1/80,     0.2,
      "ARM B", "AETTE3",   "Time to first occurrence of a grade 3-5 adverse event", 1/100,     0.08,
      "ARM C", "AETTE3",   "Time to first occurrence of a grade 3-5 adverse event",  1/60,     0.23
    )
  } else {
    lookup_ADAETTE <- lookup
  }


  if (is.null(event.descr)){
    evntdescr_sel <- c(
      'Preferred Term',
      'Clinical Cut Off',
      'Completion or Discontinuation',
      'End of AE Reporting Period'
    )
  } else {
    evntdescr_sel <- event.descr
  }

  if (is.null(censor.descr)){
    cnsdtdscr_sel <- c(
      'Preferred Term',
      'Clinical Cut Off',
      'Completion or Discontinuation',
      'End of AE Reporting Period'
    )
  } else {
    cnsdtdscr_sel <- censor.descr
  }

  if (!is.null(seed)) set.seed(seed)

  split(ADSL, ADSL$USUBJID) %>% lapply(FUN = function(pinfo) {

    lookup_ADAETTE %>% filter(ARM == as.character(pinfo$ARMCD)) %>%
      rowwise() %>%
      mutate(
        STUDYID = pinfo$STUDYID,
        SITEID = pinfo$SITEID,
        USUBJID = pinfo$USUBJID,
        CNSR = sample(c(0, 1), 1, prob = c(1-CNSR_P, CNSR_P)),
        AVAL = rexp(1, LAMBDA) / 365.25,
        AVALU = "YEARS",
        EVNTDESC = if (CNSR == 0) sample(evntdescr_sel, 1) else "",
        CNSDTDSC = if (CNSR == 1) sample(cnsdtdscr_sel, 1) else ""
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
      CNSDTDSC = "Censor Date Description",
      CNSR = "Censoring Status Value(1=cens, 0=evt)"
    )

}
