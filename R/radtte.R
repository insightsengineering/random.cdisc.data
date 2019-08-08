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
#' @inheritParams mutate_na
#'
#' @templateVar data adtte
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @importFrom dplyr filter mutate rowwise
#' @importFrom magrittr %>%
#' @importFrom tibble tribble
#'
#' @export
#'
#' @examples
#' ADSL <- radsl(seed = 1)
#' ADTTE <- radtte(ADSL, seed = 2)
#' head(ADTTE)
#'
#' ADTTE <- radtte(ADSL, seed = 2, na_percentage = 0.1)
#' print(which(is.na(ADTTE$AVAL)))
#'
radtte <- function(ADSL, # nolint
                   lookup = NULL,
                   seed = NULL,
                   event.descr = NULL, # nolint
                   na_percentage = 0,
    na_vars = list(CNSR = c(NA, 0.1), AVAL = c(1234, 0.1), AVALU = c(1234, 0.1)),
                   cached = FALSE) {

  stopifnot(is.logical.single(cached))
  if (cached) {
    return(get_cached_data("cadtte"))
  }

  stopifnot(is.data.frame(ADSL))
  stopifnot(is.null(seed) || is.numeric.single(seed))

  if (!is.null(seed)) {
    set.seed(seed)
  }

  lookup_TTE <- if_null( # nolint
    lookup,
    tribble(
      ~ARM,  ~PARAMCD, ~PARAM, ~LAMBDA, ~CNSR_P,
      "ARM A", "OS",  "Overall Survival",          1 / 80,  0.4,
      "ARM B", "OS",  "Overall Survival",          1 / 100, 0.2,
      "ARM C", "OS",  "Overall Survival",          1 / 60,  0.42,
      "ARM A", "PFS", "Progression Free Survival", 1 / 100, 0.3,
      "ARM B", "PFS", "Progression Free Survival", 1 / 150, 0.1,
      "ARM C", "PFS", "Progression Free Survival", 1 / 80,  0.32,
      "ARM A", "EFS", "Event Free Survival",       1 / 80,  0.2,
      "ARM B", "EFS", "Event Free Survival",       1 / 100, 0.08,
      "ARM C", "EFS", "Event Free Survival",       1 / 60,  0.23
    )
  )

  evntdescr_sel <- if_null(
    event.descr,
    c(
      "Death",
      "Disease Progression",
      "Last Tumor Assessment",
      "Adverse Event",
      "Last Date Known To Be Alive"
    )
  )

  ADTTE <- split(ADSL, ADSL$USUBJID) %>% # nolint
    lapply(FUN = function(pinfo) {

      lookup_TTE %>%
        dplyr::filter(ARM == as.character(pinfo$ACTARMCD)) %>%
        rowwise() %>%
        mutate(
          STUDYID = pinfo$STUDYID,
          SITEID = pinfo$SITEID,
          USUBJID = pinfo$USUBJID,
          CNSR = sample(c(0, 1), 1, prob = c(1 - CNSR_P, CNSR_P)),
          AVAL = rexp(1, LAMBDA),
          AVALU = "DAYS",
          EVNTDESC = if (CNSR == 1) sample(evntdescr_sel[-c(1:2)], 1) else sample(evntdescr_sel, 1)
        ) %>%
        select(-LAMBDA, -CNSR_P)

    }) %>%
    Reduce(rbind, .) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier"
    )

  na_vars <- na_vars[setdiff(colnames(ADTTE), colnames(ADSL))]
  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADTTE <- mutate_na(ds = ADTTE, na_vars = na_vars, na_percentage = na_percentage) #nolint
  }
  apply_metadata(ADTTE, "metadata/ADTTE.yml", seed = seed, ADSL = ADSL)
}
