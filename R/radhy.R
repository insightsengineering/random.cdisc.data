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
#'
#' @templateVar data adhy
#' @template param_cached
#' @template return_data.frame
#'
#' @importFrom dplyr mutate if_else case_when arrange rowwise group_by group_modify n ungroup
#' @importFrom magrittr %>%
#' @importFrom rlang .data
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
                    "TBILI <= 2 times ULN and AST value category",
                    "TBILI > 2 times ULN and ALKPH <= 2 times ULN and ALT value category",
                    "TBILI > 2 times ULN and ALKPH <= 2 times ULN and AST value category",
                    "TBILI > 2 times ULN and ALKPH <= 5 times ULN and ALT value category",
                    "TBILI > 2 times ULN and ALKPH <= 5 times ULN and AST value category",
                    "TBILI <= 2 times ULN and two consecutive elevations of ALT in relation to ULN",
                    "TBILI > 2 times ULN and two consecutive elevations of AST in relation to ULN",
                    "TBILI <= 2 times ULN and two consecutive elevations of AST in relation to ULN",
                    "TBILI > 2 times ULN and two consecutive elevations of ALT in relation to ULN",
                    "TBILI > 2 times ULN and two consecutive elevations of ALT in relation to Baseline",
                    "TBILI <= 2 times ULN and two consecutive elevations of ALT in relation to Baseline",
                    "TBILI > 2 times ULN and two consecutive elevations of AST in relation to Baseline",
                    "TBILI <= 2 times ULN and two consecutive elevations of AST in relation to Baseline"
                  ),
                  paramcd = c(
                    "BLAL",
                    "BGAS",
                    "BGAL",
                    "BLAS",
                    "BA2AL",
                    "BA2AS",
                    "BA5AL",
                    "BA5AS",
                    "BL2AL2CU",
                    "BG2AS2CU",
                    "BL2AS2CU",
                    "BG2AL2CU",
                    "BG2AL2CB",
                    "BL2AL2CB",
                    "BG2AS2CB",
                    "BL2AS2CB"
                  ),
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

  # define parameters that will be assigned values "Y" or "N"
  paramcd_yn <- c("BL2AL2CU", "BG2AS2CU", "BL2AS2CU", "BG2AL2CU", "BG2AL2CB", "BL2AL2CB", "BG2AS2CB", "BL2AS2CB") # nolint

  # Add other variables to ADHY
  ADHY <- ADHY %>% # nolint
    mutate(
      PARAMCD = factor(rel_var(
        df = as.data.frame(ADHY),
        var_values = param_init_list$relvar2,
        related_var = "PARAM")),
      AVISITN = case_when(
        .data$AVISIT == "BASELINE" ~ 0,
        .data$AVISIT == "POST-BASELINE" ~ 9995,
        TRUE ~ NA_real_),
      ABLFL = if_else(.data$AVISIT == "BASELINE", "Y", NA_character_),
      ONTRTFL = if_else(.data$AVISIT == "POST-BASELINE", "Y", NA_character_),
      ANL01FL = "Y",
      SRCSEQ = NA_integer_
      ) %>%
    mutate(
      AVALC = case_when(
        .data$PARAMCD %in% paramcd_yn ~ sample(
          c("Y", "N"), prob = c(0.1, 0.9), size = n(), replace = TRUE),
        !(.data$PARAMCD %in% paramcd_yn) ~ sample(
          c("Criteria not met", ">3-5ULN", ">5-10ULN", ">10-20ULN", ">20ULN"), size = n(), replace = TRUE)
      )
    ) %>%
    mutate(
      AVAL = case_when(
        .data$AVALC == "Y" ~ 1,
        .data$AVALC == "N" ~ 0,
        .data$AVALC == "Criteria not met" ~ 0,
        .data$AVALC == ">3-5ULN" ~ 1,
        .data$AVALC == ">5-10ULN" ~ 2,
        .data$AVALC == ">10-20ULN" ~ 3,
        .data$AVALC == ">20ULN" ~ 4
        )
    )

  # add baseline variables
  ADHY <- ADHY %>% # nolint
    group_by(.data$USUBJID, .data$PARAMCD) %>%
    mutate(
      BASEC = .data$AVALC[.data$AVISIT == "BASELINE"],
      BASE = .data$AVAL[.data$AVISIT == "BASELINE"]) %>%
    ungroup()

  # merge ADSL to be able to add analysis datetime and analysis relative day variables
  ADHY <- inner_join(ADSL, ADHY, by = c("STUDYID", "USUBJID")) # nolint

  # define a simple helper function to create ADY variable
  add_ady <- function(x, avisit) {

    if (avisit == "BASELINE") {
      mutate(x,
             ADY = sample(x = -(1:14), # nolint
                          size = n(),
                          replace = TRUE))

    } else if (avisit == "POST-BASELINE") {
      rowwise(x) %>%
        mutate(ADY = sample(
          x = ifelse(
            !is.na(.data$TRTEDTM),
            difftime(.data$TRTEDTM, .data$TRTSDTM, units = "days"),
            (.data$study_duration_secs) / 86400),
          size = 1,
          replace = TRUE))

    } else {
      mutate(x, ADY = NA_integer_)
    }

  }

  # add ADY and ADTM variables
  ADHY <- ADHY %>% # nolint
    group_by(.data$AVISIT, .add = FALSE) %>%
    group_modify(~ add_ady(.x, .y$AVISIT)) %>%
    ungroup() %>%
    mutate(ADTM = .data$TRTSDTM + .data$ADY)

  # order columns and arrange rows; column order follows ADaM_1.1 specification
  ADHY <- # nolint
    ADHY[, c(
      colnames(ADSL),
      "PARAM",
      "PARAMCD",
      "AVAL",
      "AVALC",
      "BASE",
      "BASEC",
      "ABLFL",
      "ADTM",
      "ADY",
      "AVISIT",
      "AVISITN",
      "ONTRTFL",
      "SRCSEQ",
      "ANL01FL"
    )]

  ADHY <- ADHY %>% # nolint
    arrange(.data$STUDYID, .data$USUBJID, .data$PARAMCD, .data$AVISITN, .data$ADTM, .data$SRCSEQ)

  # apply metadata
  ADHY <- apply_metadata(ADHY, "metadata/ADHY.yml") # nolint

  return(ADHY)

}
