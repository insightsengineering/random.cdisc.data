#' Time-to-Event Analysis dataset (ATE)
#'
#' Function for generating random Time-to-Event Analysis Dataset for a given
#' Subject-Level Analysis Dataset
#'
#' @template ADSL_params
#' @template lookup_param
#' @template return_data.frame
#'
#' @param event.descr Character vector with description of events.
#'
#' Keys: STUDYID USUBJID PARAMCD AVISITN ADT TTESEQ
#'
#' @export
#'
#' @examples
#' ADSL <- radsl()
#' ADTTE <- radtte(ADSL)
#' head(ADTTE)
#'
radtte <- function(ADSL, lookup = NULL, event.descr = NULL, seed = NULL) {

  if (!is.null(seed)) set.seed(seed)

  if (is.null(lookup)){
    lookup_TTE <- tribble(
      ~ARM,  ~PARAMCD, ~PARAM, ~LAMBDA, ~CNSR_P,
      "ARM A", "OS",  "Overall Survival",          1/80,  0.4,
      "ARM B", "OS",  "Overall Survival",          1/100, 0.2,
      "ARM C", "OS",  "Overall Survival",          1/60,  0.42,
      "ARM A", "PFS", "Progression Free Survival", 1/100, 0.3,
      "ARM B", "PFS", "Progression Free Survival", 1/150, 0.1,
      "ARM C", "PFS", "Progression Free Survival", 1/80,  0.32,
      "ARM A", "EFS", "Event Free Survival",       1/80,  0.2,
      "ARM B", "EFS", "Event Free Survival",       1/100, 0.08,
      "ARM C", "EFS", "Event Free Survival",       1/60,  0.23)
  } else {
    lookup_TTE <- lookup
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

  # pinfo <- split(ADSL, ADSL$USUBJID)[[1]]
  ADTTE <- split(ADSL, ADSL$USUBJID) %>% lapply(FUN = function(pinfo) {

    lookup_TTE %>% filter(ARM == as.character(pinfo$ACTARMCD)) %>%
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
      USUBJID = "Unique Subject Identifier"
    )

  # apply metadata
  ADTTE <- apply_metadata(ADTTE, "metadata/ADTTE.yml", seed = seed, ADSL = ADSL)

  ADTTE

}
