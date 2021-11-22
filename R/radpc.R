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
  base_mean = 50,
  rel_increase_by_visit = 0.5,
  rel_increase_by_plasma = 0.5,
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
    rel_increase_by_visit >= 0 && rel_increase_by_visit <= 1,
    rel_increase_by_plasma >= 0 && rel_increase_by_plasma <= 1,
    is_character_single(avalu),
    is_numeric_single(base_mean)
  )

  if (!is.null(seed)) {
    set.seed(seed)
  }

  ADPC <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = factor(paste0(c("Plasma Drug X", "Plasma Drug Y"), "(", avalu, ")")),
    PCTPTNUM = c(0, 0.5, 1, 1.5, 2, 3, 4, 8, 12),
    stringsAsFactors = FALSE
  )

  ADPC <- ADSL %>%
    dplyr::inner_join(ADPC, by = c("STUDYID", "USUBJID"))
  ADPC <- ADPC %>%
    dplyr::mutate(
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
        ),
      ),
      NRELTM1 = PCTPTNUM,
      ARELTM1 = round(rnorm(n(), mean = PCTPTNUM, sd = 0.1), 1),
      is_plasmay = case_when(
        grepl("Plasma Drug Y", ADPC$PARAM) ~ TRUE,
        TRUE ~ FALSE,
      ),
      substract = case_when(
        PCTPTNUM == 3 ~ 2,
        PCTPTNUM == 4 ~ 3.5,
        PCTPTNUM == 8 ~ 9,
        TRUE ~ 0
      ),
      AVAL = case_when(
        ARMCD == "ARM B" | (ARMCD == "ARM A" & grepl("Plasma Drug Y", PARAM)) ~ NA_real_,
        PCTPT == "Predose" |  PCTPTNUM == 12 ~ 0,
        TRUE ~ round(
          rnorm(n(), base_mean, 5) +
            PCTPTNUM * rnorm(n(), base_mean * rel_increase_by_visit, 1)
          + is_plasmay * rnorm(n(), base_mean * rel_increase_by_plasma, 5)
          - substract * rnorm(n(), base_mean * rel_increase_by_visit, 0.2),
          2)
      ),
      AVALC = factor(case_when(
        AVAL == NA_real_ ~ "NA",
        AVAL == 0 ~ "BLQ",
        TRUE ~ as.character(AVAL, 0)
      )
      ),
      AVALU = avalu,
      RELTMU = "hr"
    ) %>%
    dplyr::select(-c(is_plasmay, substract))

  if (length(na_vars) > 0 && na_percentage > 0 && na_percentage <= 1) {
    ADPC <- mutate_na(ds = ADPC, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  ADPC <- apply_metadata(ADPC, "metadata/ADPC.yml") # nolint
  return(ADPC)
}
