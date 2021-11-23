#' PK dataset
#'
#' @template ADSL_params
#' @param avalu (`string`)\cr Analysis value unit value
#' @param base_mean (`numeric`)
#' @param rel_increase_by_visit (`numeric`)\cr relative increase in analysis value over visits.
#' @param rel_increase_by_plasma (`numeric`)\cr relative increase in analysis value between parameters.
#' @inheritParams radsl
#'
#' @details One record per per study per subject per parameter per time point
#'
#' @return
#' @importFrom stats rnorm
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' library(dplyr)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' ADPC <- radpc(ADSL, seed = 2)
#'
radpc <- function(
  ADSL, # nolint
  avalu = "ug/mL",
  seed = NULL,
  na_percentage = 0,
  na_vars = list(
    AVAL = c(NA, 0.1)
  ),
  cached = FALSE
){

  stopifnot(is_logical_single(cached))
  if (cached) {
    return(get_cached_data("cadlb"))
  }

  stopifnot(
    is_character_single(avalu),
    is_numeric_single(base_mean)
  )

  if (!is.null(seed)) {
    set.seed(seed)
  }


  ADPC <- tidyr::expand_grid(
    data.frame(
      STUDYID = ADSL$STUDYID,
      USUBJID = ADSL$USUBJID,
      ARMCD = ADSL$ARMCD,
      A0 = .D,
      ka = .ka - runif(length(ADSL$USUBJID), -0.2, 0.2),
      ke = .ke - runif(length(ADSL$USUBJID), -0.2, 0.2)
     ),
     PCTPTNUM = c(0, 0.5, 1, 1.5, 2, 3, 4, 8, 12),
     PARAM = c("Plasma Drug X", "Plasma Drug Y"),
   ) %>%
     mutate(
       VISITDY = case_when(
         PCTPTNUM < 24 ~ 1,
         PCTPTNUM >=24 & PCTPTNUM < 48 ~ 2,
         PCTPTNUM == 48 ~ 3,
         PCTPTNUM == 72 ~ 4,
         TRUE ~ 8
       ),
       VISIT = paste("Day", VISITDY),
       PCTPT = factor(case_when(
         PCTPTNUM == 0 ~ "Predose",
         TRUE ~ paste0(PCTPTNUM, "H")
       )),
       ARELTM1 = PCTPTNUM,
       NRELTM1 = PCTPTNUM,
       A0 = ifelse(PARAM == "Plasma Drug Y", A0, A0 / 2),
       AVAL = round((A0 * ka * (exp(-ka * ARELTM1) - exp(-ke * ARELTM1))) / (ke - ka), digits = 3), # PK Equation
       AVALC = ifelse(AVAL == 0, "BLQ", as.character(AVAL)),
       AVALU = avalu,
       RELTMU = "hr"
     ) %>%
    select(-c(A0, ka, ke))

  ADPC <- ADSL %>%
    dplyr::inner_join(ADPC, by = c("STUDYID", "USUBJID"))


  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADPC <- mutate_na(ds = ADPC, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADPC <- apply_metadata(ADPC, "metadata/ADPC.yml") # nolint
  return(ADPC)
}
