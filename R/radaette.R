#' Time to Adverse Event Analysis Dataset (ADAETTE)
#'
#' Function to generate random time to AE dataset for a
#' given subject-level analysis dataset.
#'
#' Keys: STUDYID USUBJID PARAMCD AVISITN ADT TTESEQ
#'
#' @template ADSL_params
#' @template lookup_param
#' @param event.descr Character vector with description of events.
#' @param censor.descr Character vector with description of censors.
#' @templateVar data adaette
#' @template param_cached
#'
#' @template return_data.frame
#'
#'
#' @import dplyr
#' @importFrom yaml yaml.load_file
#'
#' @export
#'
#' @author Xiuting Mi
#'
#' @examples
#' ADSL <- radsl(seed = 1)
#' ADAETTE <- radaette(ADSL, seed  = 2)
#' head(ADAETTE)
#'
radaette <- function(ADSL, seed = NULL, lookup = NULL, event.descr = NULL, censor.descr = NULL, cached = FALSE) {

  stopifnot(is.logical(cached))
  if (cached) return(get_cached_data("adaette"))

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

  if (!is.null(seed)) set.seed(seed)

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

  ADAETTE <- split(ADSL, ADSL$USUBJID) %>% lapply(FUN = function(pinfo) {

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
      USUBJID = "Unique Subject Identifier"
    )

  # apply metadata
  ADAETTE <- apply_metadata(ADAETTE, "metadata/ADAETTE.yml", seed = seed, ADSL = ADSL)

  ADAETTE

}

