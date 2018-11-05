#' Trial Elements domain dataset (ATE)
#'
#' Function for generating random Dataset from Trial Elements domain for a given
#' Subject-Level Analysis Dataset
#'
#' @inheritParams radsl
#' @template param_ADSL
#' @template param_lookup
#' @param event.descr Character vector with description of events.
#'
#' @export
#' @template return_data.frame
#'
#' @examples
#' ADSL <- radsl()
#' ADTE <- radte(ADSL)
#' head(ADTE)
#'
radte <- function(ADSL, seed = NULL, lookup = NULL, event.descr = NULL) {

  if (is.null(lookup)){
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
      "ARM C", "EFS",   "Event Free Survival",  1/60,     0.23)
    } else {
      lookup_ATE <- lookup
    }


  if (is.null(event.descr)){
    evntdescr_sel <- c(
      'Death',
      'Disease Progression',
      'Last Tumor Assessment',
      'Adverse Event',
      'Last Date Known To Be Alive'
    )
  } else {
    evntdescr_sel <-event.descr
  }


  if (!is.null(seed)) set.seed(seed)

  # pinfo <- split(ADSL, ADSL$USUBJID)[[1]]
  split(ADSL, ADSL$USUBJID) %>% lapply(FUN = function(pinfo) {

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
