#' Tumor Response Analysis Dataset (ADTR)
#'
#' Function for generating random dataset from Tumor Response Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: STUDYID, USUBJID, PARAMCD, BASETYPE, AVISITN, DTYPE
#'
#' @template ADSL_params
#' @template BDS_findings_params
#' @param max_n_tr As numeric. maximum number of eg results.
#' @param lookup control lookup process.
#' @param cycle_interval number of cycles between each visit.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data adtr
#' @template param_cached
#' @template return_data.frame
#'
#' @importFrom dplyr arrange case_when group_by mutate n rowwise select ungroup slice
#' @importFrom magrittr %>%
#' @importFrom stats rnorm
#'
#' @export
#'
#' @author tomlinsj, npaszty, Xuefeng Hou, dipietrc
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' radtr(ADSL, seed = 2)
radtr <- function(ADSL, # nolint
                  param = c("Sum of Longest Diameter by Investigator"),
                  paramcd = c("SLDINV"),
                  visit_format = "Cycle",
                  cycle_interval = 6L,
                  n_assessments = 4L,
                  n_days = 1L,
                  max_n_tr = 10L,
                  lookup = NULL,
                  seed = NULL,
                  cached = FALSE,
                  na_percentage = 0,
                  na_vars = list()) {
  stopifnot(is_logical_single(cached))
  if (cached) {
    return(get_cached_data("cadtr"))
  }
  stopifnot(is.data.frame(ADSL))
  stopifnot(is_character_vector(param))
  stopifnot(is_character_vector(paramcd))
  stopifnot(is_character_single(visit_format))
  stopifnot(is_integer_single(n_assessments))
  stopifnot(is_integer_single(cycle_interval))
  stopifnot(is_integer_single(n_days))
  stopifnot(is_integer_single(max_n_tr))
  stopifnot(is.null(seed) || is_numeric_single(seed))
  stopifnot((is_numeric_single(na_percentage) && na_percentage >= 0 && na_percentage < 1) || is.na(na_percentage)) # nolint
  # validate and initialize related variables

  param_init_list <- relvar_init(param, paramcd)
  if (!is.null(seed)) {
    set.seed(seed)
  }

  # Function independent to ADTR to match the same visit schedule format as teal.osprey dataset.
  # visit format is accepted as "Cycle" in the function call above.

  visit_schedule_adtr <- function(n_assessments, n_days, cycle_interval, visit_format) {
    cycles <- sort(rep(1:(n_assessments - 2), times = 1, each = n_days)) * cycle_interval
    days <- as.integer(rep(seq(from = 1, to = n_days, by = 1), times = 1, each = 1))
    assessments_ord <- 1:n_assessments
    visit_values <- c("Screening", paste(visit_format, cycles, "Day", days), "End of Treatment")
    visit_values <- reorder(visit_values, assessments_ord)
  }
  ADTR <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    AVISIT = visit_schedule_adtr(n_assessments, n_days, cycle_interval, visit_format),
    PARAM = as.factor(param_init_list$relvar1),
    stringsAsFactors = FALSE
  )
  # assign related variable values: PARAMxPARAMCD are related
  ADTR$PARAMCD <- as.factor(rel_var( # nolint
    df = ADTR,
    var_name = "PARAMCD",
    var_values = param_init_list$relvar2,
    related_var = "PARAM"
  ))
  ADTR <- var_relabel( # nolint
    ADTR,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )
  # merge ADSL to be able to add date and study day variables
  ADTR <- inner_join( # nolint
    ADSL, # nolint
    ADTR,
    by = c("STUDYID", "USUBJID")
  ) %>%
    rowwise() %>%
    mutate(trtsdt_int = as.numeric(as.Date(.data$TRTSDTM))) %>%
    mutate(trtedt_int = case_when(
      !is.na(TRTEDTM) ~ as.numeric(as.Date(.data$TRTEDTM)),
      is.na(TRTEDTM) ~ floor(.data$trtsdt_int + (.data$study_duration_secs) / 86400)
    )) %>%
    mutate(ADTM = as.POSIXct((sample(.data$trtsdt_int:.data$trtedt_int, size = 1) * 86400), origin = "1970-01-01")) %>%
    mutate(ADY = ceiling(as.numeric(difftime(.data$ADTM, .data$TRTSDTM, units = "days")))) %>%
    select(-.data$trtsdt_int, -.data$trtedt_int) %>%
    ungroup() %>%
    arrange(.data$STUDYID, .data$USUBJID, .data$ADTM)
  ADTR <- ADTR %>% # nolint
    mutate(AVISITN = as.integer(match(.data$AVISIT, levels(.data$AVISIT)))) %>%
    group_by(.data$USUBJID) %>%
    arrange(.data$USUBJID, .data$AVISITN) %>%
    ungroup()

  # Two functions independent to ADTR. Seeded values for tumor size are created for both baseline
  # and not baseline values.

  Tumor_avals_base <- function(data, n_assessments) { # nolint
    set.seed(length(unique(data$USUBJID)))
    vals_base <- rnorm(length(unique(data$USUBJID)), mean = 150, sd = 30)
    vals_base <- rep(vals_base, each = n_assessments)
    return(vals_base)
  }

  Tumor_avals <- function(data, n_assessments, vals_base) { # nolint
    vals_aval <- unique(vals_base)
    vals_aval <- rep(vals_aval, each = n_assessments - 1)
    set.seed(length(vals_aval))
    for (i in 1:length(vals_aval)) { # nolint
      vals_aval[i] <- rnorm(1, mean = vals_aval[i], sd = vals_aval[i] / 4)
    }

    return(vals_aval)
  }
  base_values <- Tumor_avals_base(ADTR, n_assessments)
  aval_values <- Tumor_avals(ADTR, n_assessments, base_values)

  # Creating two dummy variables SEQ_NUM and AVALDUMMY to help incorporate tumor values for AVAL and to ensure
  # that PCHG does not exceed 200%, nor go below -100% (double in size, or complete remission of tumor).

  SEQ_NUM <- as.integer(setdiff(1:length(base_values), seq(1, length(base_values), n_assessments))) # nolint
  aval_values <- data.frame(aval_values, SEQ_NUM) # nolint
  ADTR$BASE <- base_values # nolint
  ADTR$SEQ_NUM <- as.integer(1:length(base_values)) # nolint
  ADTR$AVALDUMMY <- ifelse( # nolint
    ADTR$AVISIT == "Screening",
    as.integer(NA),
    aval_values$aval_values[match(ADTR$SEQ_NUM, aval_values$SEQ_NUM)]
  )
  ADTR <- ADTR %>% # nolint
    mutate(AVAL = case_when(
      .data$AVISIT == "Screening" ~ as.numeric(NA),
      .data$AVISIT != "Screening" ~ case_when(
        .data$AVALDUMMY <= .data$BASE / 2 ~ .data$BASE / 2 + .data$BASE / 4,
        .data$AVALDUMMY >= .data$BASE * 2 ~ .data$BASE * 2 - .data$BASE / 4,
        TRUE ~ .data$AVALDUMMY)
    )) %>%
    mutate(AVALC = as.character(.data$AVAL)) %>%
    mutate(AVALU = "mm") %>%
    mutate(CHG = ifelse(.data$AVISIT != "Screening", .data$AVAL - .data$BASE, as.numeric(NA))) %>%
    mutate(PCHG = ifelse(.data$AVISIT != "Screening", (.data$CHG / .data$BASE) * 100, as.numeric(NA))) %>%
    mutate(DTYPE = "")

  ADTR[, c("AVALDUMMY", "SEQ_NUM")] <- NULL

  # Make times consistent with ADRS at ADY and ADTM.

  ADRS <- radrs(ADSL, seed = 2) %>% # nolint
    filter(.data$PARAMCD == "OVRINV")

  for (i in 1:nrow(ADTR)) { # nolint
    ADTR$ADTM[i] <- ADRS$ADTM[ADRS$AVISITN == ADTR$AVISITN[i] & ADRS$USUBJID == ADTR$USUBJID[i]]
    ADTR$ADY[i] <- ADRS$ADY[ADRS$AVISITN == ADTR$AVISITN[i] & ADRS$USUBJID == ADTR$USUBJID[i]]
  }

  # Insert Post-Baseline Minimum, new dataset with lowest AVAL value from baseline for each USUBJID,
  # then bind rows and rearrange

  ADTR1 <- ADTR %>% # nolint
    group_by(.data$USUBJID) %>%
    filter(!is.na(.data$AVAL)) %>%
    filter(.data$AVAL == min(.data$AVAL)) %>%
    slice(1) %>%
    mutate(AVISIT = "POST-BASELINE MINIMUM") %>%
    mutate(DTYPE = "MINIMUM") %>%
    ungroup()

  ADTR <- rbind(ADTR, ADTR1)
  ADTR <- ADTR %>% # nolint
    arrange(.data$USUBJID, .data$DTYPE)

  # Adding flag variables
  ADTR <- ADTR %>% # nolint
    mutate(ABLFL = ifelse(.data$AVISIT == "Screening", "Y", "")) %>%
    mutate(ONTRTFL = case_when(
      is.na(.data$TRTSDTM) ~ "",
      is.na(.data$ADTM) ~ "Y",
      .data$ADTM < .data$TRTSDTM ~ "",
      TRUE ~ "Y"
    )) %>%
    mutate(ANL01FL = ifelse(.data$DTYPE == "", "Y", "")) %>%
    mutate(ANL02FL = case_when(
      !is.na(.data$AVAL) & .data$DTYPE == "" & .data$AVISITN == n_assessments ~ "Y",
      .data$ABLFL == "Y" ~ "Y",
      TRUE ~ "")) %>%
    mutate(ANL03FL = case_when(.data$DTYPE == "MINIMUM" ~ "Y", .data$ABLFL == "Y" ~ "Y", TRUE ~ ""))

  # Adding variables that are in ADTR osprey but not RCD.
  ADTR <- ADTR %>% # nolint
    mutate(AEWITHFL = ifelse(.data$DCSREAS == "ADVERSE EVENT", "Y", "N")) %>%
    mutate(DTHFL = ifelse(!is.na(.data$DTHDT), "Y", "")) %>%
    mutate(DCSREAS_GRP = ifelse(.data$DCSREAS == "ADVERSE EVENT", "Safety", "Non-Safety")) %>%
    mutate(TRTDURD = ifelse(is.na(.data$TRTSDTM) | is.na(.data$TRTEDTM), NA, .data$TRTEDTM - (.data$TRTSDTM + 1))) %>%
    mutate(AGEGR1 = ifelse(.data$AGE < 65, "<65", ">=65"))

  # apply metadata
  ADTR <- apply_metadata(ADTR, "metadata/ADTR.yml") # nolint
  return(ADTR)

}
