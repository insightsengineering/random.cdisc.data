#' Hys Law Analysis Dataset (ADHY)
#'
#' Function for generating random dataset from Hys Law Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: STUDYID, USUBJID, PARAMCD, AVISITN, ADTM, SRCSEQ.
#
#' @template ADSL_params
#' @param param As character string. list of parameter values.
#' @param paramcd As character string. list of parameter code values.
#' @param aval_base As character vector of levels for AVALC and BASEC variables.
#'
#' @templateVar data adhy
#' @template param_cached
#' @template return_data.frame
#'
#' @importFrom dplyr arrange case_when group_by mutate n rowwise select ungroup
#' cur_group cur_group_id cur_data transmute if_else relocate
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @author wojciakw
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
#' radhy(ADSL, seed = 2)
radhy <- function(ADSL, # nolint
                  param = c(
                    "TBILI <= 2 times ULN and ALT value category",
                    "TBILI > 2 times ULN and AST value category",
                    "TBILI > 2 times ULN and ALT value category",
                    "TBILI <= 2 times ULN and AST value category"),
                  paramcd = c("BLAL", "BGAS", "BGAL", "BLAS"),
                  aval_base = c("Criteria not met", ">3-5ULN", ">5-10ULN", ">10-20ULN", ">20ULN"),
                  seed = NULL,
                  cached = FALSE) {

  stopifnot(is_logical_single(cached))

  if (cached)
    return(get_cached_data("cadhy"))

  stopifnot(is.data.frame(ADSL))
  stopifnot(is_character_vector(param))
  stopifnot(is_character_vector(paramcd))
  stopifnot(is.null(seed) || is_numeric_single(seed))

  # validate and initialize related variables
  param_init_list <- relvar_init(param, paramcd)

  if (!is.null(seed))
    set.seed(seed)

  # create all combinations of unique values in STUDYID, USUBJID, PARAM, AVISIT
  ADHY <- expand.grid( # nolint
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = as.factor(c("BASELINE", "POST-BASELINE")),
    stringsAsFactors = FALSE)

  # for computational efficiency, a sample of final total size for BASE/BASEC
  # is taken once, rather than many samples of size 1 within mutate, further below
  base_sample <- sample_fct(x = aval_base, N = nrow(unique(ADHY[, c("STUDYID", "USUBJID", "PARAM")])))

  # note: for AVALC line below, in fact a subset (subsample) of size = no of rows with AVISIT != "BASELINE" <= n()
  # is taken from a full sample (drawn with sample_fct) of size n().
  # since the subset selection mechanism does not depend on full sample values,
  # such approach does not invalidate the statistical properties of the subsample, that is, it still comes
  # from a uniform distribution.
  ADHY <- ADHY %>% # nolint
    group_by(STUDYID, USUBJID, PARAM) %>%
    mutate(BASEC = base_sample[cur_group_id()]) %>%
    ungroup() %>%
    mutate(BASE = as.integer(BASEC) - 1,
           AVALC = if_else(AVISIT == "BASELINE", BASEC, sample_fct(x = aval_base, N = n())),
           AVAL = as.integer(AVALC) - 1,
           PARAMCD = factor(rel_var(
             df = as.data.frame(ADHY),
             var_values = param_init_list$relvar2,
             related_var = "PARAM")),
           AVISITN = case_when(
             AVISIT == "BASELINE" ~ 0,
             AVISIT == "POST-BASELINE" ~ 9995,
             TRUE ~ NA_real_),
           ABLFL = if_else(AVISIT == "BASELINE", "Y", NA_character_),
           ONTRTFL = if_else(AVISIT == "POST-BASELINE", "Y", NA_character_),
           ANL01FL = "Y",
           SRCSEQ = NA_integer_
    )

  # merge ADSL to be able to add analysis datetime and analysis relative day variables
  ADHY <- inner_join(ADSL, ADHY, by = c("STUDYID", "USUBJID")) # nolint

  ADHY <- ADHY %>% # nolint
    group_by(AVISIT, .add = FALSE) %>%
    mutate(ADY = if (cur_group() == "BASELINE")
      sample(x = -(1:14), size = n(), replace = TRUE) # nolint
      else
        unlist(transmute(
          rowwise(cur_data()),
          sample(
            x = ifelse(!is.na(TRTEDTM), difftime(TRTEDTM, TRTSDTM), study_duration_secs / 86400),
            size = 1,
            replace = TRUE)),
          use.names = FALSE)
    ) %>%
    ungroup() %>%
    mutate(ADTM = TRTSDTM + ADY)

  # order columns and arrange rows, column order follows ADaM_1.1 specification
  ADHY <- ADHY %>% # nolint
    relocate(
      colnames(ADSL),
      PARAM,
      PARAMCD,
      AVAL,
      AVALC,
      BASE,
      BASEC,
      ABLFL,
      ADTM,
      ADY,
      AVISIT,
      AVISITN,
      ONTRTFL,
      SRCSEQ,
      ANL01FL) %>%
    arrange(STUDYID, USUBJID, PARAMCD, AVISITN, ADTM, SRCSEQ)

  # apply metadata
  ADHY <- apply_metadata(ADHY, "metadata/ADHY.yml") # nolint

  return(ADHY)

}
