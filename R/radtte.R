#' Time-to-Event Analysis Dataset (ATE)
#'
#' Function for generating random Time-to-Event Analysis Dataset for a given
#' Subject-Level Analysis Dataset
#'
#' @details
#' Keys: STUDYID USUBJID PARAMCD AVISITN ADT TTESEQ
#'
#' @template ADSL_params
#' @template lookup_param
#' @param event.descr Character vector with description of events.
#' @inheritParams radsl
#' @inheritParams mutate_NA
#'
#' @templateVar data adtte
#' @template param_cached
#'
#' @template return_data.frame
#'
#'
#' @export
#'
#' @examples
#' ADSL <- radsl(seed = 1)
#' ADTTE <- radtte(ADSL, seed = 2)
#' head(ADTTE)
#'
#' ADTTE <- radtte(ADSL, seed = 2, random_NA = 0.1)
#' print(which(is.na(ADTTE$AVAL)))
#'
radtte <- function(ADSL, lookup = NULL, event.descr = NULL, seed = NULL, cached = FALSE, random_NA = 0,
    NA_vars = list(CNSR = c(NA, 0.1), AVAL = c(1234, 0.1), AVALU = c(1234, 0.1))
    ) {

  stopifnot(is.logical(cached))
  if (cached) return(get_cached_data("cadtte"))

  if (!is.null(seed)) set.seed(seed)

  lookup_TTE <- if (is.null(lookup)){
    tribble(
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
    lookup
  }

  evntdescr_sel <- if (is.null(event.descr)){
    c(
      'Death',
      'Disease Progression',
      'Last Tumor Assessment',
      'Adverse Event',
      'Last Date Known To Be Alive'
    )
  } else {
    event.descr
  }

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

  NA_vars <- NA_vars[setdiff(colnames(ADTTE), colnames(ADSL))]

  if(length(NA_vars) > 0 && random_NA > 0 && random_NA <= 1) {
    ADTTE %<>% mutate_NA(NA_vars = NA_vars, percentage = random_NA)
  }

  # apply metadata
  ADTTE <- apply_metadata(ADTTE, "metadata/ADTTE.yml", seed = seed, ADSL = ADSL)

  ADTTE

}
