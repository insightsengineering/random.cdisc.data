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
                    "TBILI <= 2 times ULN and two consecutive elevations of AST in relation to Baseline",
                    "ALT > 3 times ULN by Period",
                    "AST > 3 times ULN by Period",
                    "ALT or AST > 3 times ULN by Period",
                    "ALT > 3 times Baseline by Period",
                    "AST > 3 times Baseline by Period",
                    "ALT or AST > 3 times Baseline by Period"
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
                    "BL2AS2CB",
                    "ALTPULN",
                    "ASTPULN",
                    "ALTASTPU",
                    "ALTPBASE",
                    "ASTPBASE",
                    "ALTASTPB"
                  ),
                  seed = NULL,
                  cached = FALSE) {

  checkmate::assert_flag(cached)

  if (cached)
    return(get_cached_data("cadhy"))

  checkmate::assert_data_frame(ADSL)
  checkmate::assert_character(param, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramcd, min.len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)

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
    APERIODC = as.factor(c("PERIOD 1", "PERIOD 2")),
    stringsAsFactors = FALSE)

  # remove records that are not needed and were created as a side product of expand.grid above
  ADHY <- dplyr::filter(ADHY, !(.data$AVISIT == "BASELINE" & .data$APERIODC == "PERIOD 2")) # nolint

  # define TBILI ALT/AST params, period dependent parameters and the parameters that will be assigned values "Y" or "N"
  paramcd_tbilialtast <- c("BLAL", "BGAS", "BGAL", "BLAS", "BA2AL", "BA2AS", "BA5AL", "BA5AS") # nolint
  paramcd_by_period <- c("ALTPULN", "ASTPULN", "ALTASTPU", "ALTPBASE", "ASTPBASE", "ALTASTPB")
  paramcd_yn <- c(
    "BL2AL2CU", "BG2AS2CU", "BL2AS2CU", "BG2AL2CU", "BG2AL2CB", "BL2AL2CB", "BG2AS2CB", "BL2AS2CB",
    paramcd_by_period
  ) # nolint

  # add other variables to ADHY
  ADHY <- ADHY %>% # nolint
    dplyr::mutate(
      PARAMCD = factor(rel_var(
        df = as.data.frame(ADHY),
        var_values = param_init_list$relvar2,
        related_var = "PARAM")),
      AVALC = dplyr::case_when(
        .data$PARAMCD %in% paramcd_tbilialtast ~ sample(
          x = c(">3-5ULN", ">5-10ULN", ">10-20ULN", ">20ULN", "Criteria not met"), size = dplyr::n(), replace = TRUE),
        .data$PARAMCD %in% paramcd_yn ~ sample(
          x = c("Y", "N"), prob = c(0.1, 0.9), size = dplyr::n(), replace = TRUE)
        ),
      AVAL = dplyr::case_when(
        .data$AVALC == ">3-5ULN" ~ 1,
        .data$AVALC == ">5-10ULN" ~ 2,
        .data$AVALC == ">10-20ULN" ~ 3,
        .data$AVALC == ">20ULN" ~ 4,
        .data$AVALC == "Y" ~ 1,
        .data$AVALC == "N" ~ 0,
        .data$AVALC == "Criteria not met" ~ 0
      ),
      AVISITN = dplyr::case_when(
        .data$AVISIT == "BASELINE" ~ 0L,
        .data$AVISIT == "POST-BASELINE" ~ 9995L,
        TRUE ~ NA_integer_),
      APERIOD = dplyr::case_when(
        .data$APERIODC == "PERIOD 1" ~ 1L,
        .data$APERIODC == "PERIOD 2" ~ 2L,
        TRUE ~ NA_integer_),
      ABLFL = dplyr::if_else(.data$AVISIT == "BASELINE", "Y", NA_character_),
      ONTRTFL = dplyr::if_else(.data$AVISIT == "POST-BASELINE", "Y", NA_character_),
      ANL01FL = "Y",
      SRCSEQ = NA_integer_
    )

  # remove records for parameters with period 2 and not in paramcd_by_period
  ADHY <- dplyr::filter(ADHY, .data$PARAMCD %in% paramcd_by_period | .data$APERIODC == "PERIOD 1") # nolint

  # add baseline variables
  ADHY <- ADHY %>% # nolint
    dplyr::group_by(.data$USUBJID, .data$PARAMCD) %>%
    dplyr::mutate(
      BASEC = .data$AVALC[.data$AVISIT == "BASELINE"],
      BASE = .data$AVAL[.data$AVISIT == "BASELINE"]) %>%
    dplyr::ungroup()

  ADHY <- ADHY %>% # nolint
    var_relabel(
      STUDYID = attr(ADSL$STUDYID, "label"),
      USUBJID = attr(ADSL$USUBJID, "label")
    )

  # merge ADSL to be able to add analysis datetime and analysis relative day variables
  ADHY <- dplyr::inner_join(ADSL, ADHY, by = c("STUDYID", "USUBJID")) # nolint

  # define a simple helper function to create ADY variable
  add_ady <- function(x, avisit) {

    if (avisit == "BASELINE") {
      dplyr::mutate(
        x,
        ADY = sample(x = -(1:14), size = dplyr::n(), replace = TRUE) # nolint
      )
    } else if (avisit == "POST-BASELINE") {
      dplyr::rowwise(x) %>%
        dplyr::mutate(ADY = as.integer(sample(
          x = ifelse(
            !is.na(.data$TRTEDTM),
            difftime(.data$TRTEDTM, .data$TRTSDTM, units = "days"),
            (.data$study_duration_secs) / 86400),
          size = 1,
          replace = TRUE)))

    } else {
      dplyr::mutate(x, ADY = NA_integer_)

    }

  }

  # add ADY and ADTM variables
  ADHY <- ADHY %>% # nolint
    dplyr::group_by(.data$AVISIT, .add = FALSE) %>%
    dplyr::group_modify(~ add_ady(.x, .y$AVISIT)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(ADTM = .data$TRTSDTM + .data$ADY)

  # `+` operation causes that tzone attribute is lost for POSIXct objects
  attributes(ADHY$ADTM) <- attributes(ADSL$TRTSDTM)

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
      "APERIOD",
      "APERIODC",
      "ONTRTFL",
      "SRCSEQ",
      "ANL01FL"
    )]

  ADHY <- ADHY %>% # nolint
    dplyr::arrange(
      .data$STUDYID,
      .data$USUBJID,
      .data$PARAMCD,
      .data$AVISITN,
      .data$ADTM,
      .data$SRCSEQ
    )

  # apply metadata
  ADHY <- apply_metadata(ADHY, "metadata/ADHY.yml") # nolint

  return(ADHY)

}
