#' Hy's Law Analysis Dataset (ADHY)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating a random Hy's Law Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#'
#' Keys: `STUDYID`, `USUBJID`, `PARAMCD`, `AVISITN`, `ADTM`, `SRCSEQ`
#
#' @inheritParams argument_convention
#' @template param_cached
#' @templateVar data adhy
#'
#' @return `data.frame`
#' @export
#'
#' @author wojciakw
#'
#' @examples
#' library(random.cdisc.data)
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' adhy <- radhy(adsl, seed = 2)
#' adhy
radhy <- function(adsl,
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

  if (cached) {
    return(get_cached_data("cadhy"))
  }

  checkmate::assert_data_frame(adsl)
  checkmate::assert_character(param, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(paramcd, min.len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)

  # validate and initialize related variables
  param_init_list <- relvar_init(param, paramcd)

  if (!is.null(seed)) {
    set.seed(seed)
  }
  study_duration_secs <- lubridate::seconds(attr(adsl, "study_duration_secs"))

  # create all combinations of unique values in STUDYID, USUBJID, PARAM, AVISIT
  adhy <- expand.grid(
    STUDYID = unique(adsl$STUDYID),
    USUBJID = adsl$USUBJID,
    PARAM = as.factor(param_init_list$relvar1),
    AVISIT = as.factor(c("BASELINE", "POST-BASELINE")),
    APERIODC = as.factor(c("PERIOD 1", "PERIOD 2")),
    stringsAsFactors = FALSE
  )

  # remove records that are not needed and were created as a side product of expand.grid above
  adhy <- dplyr::filter(adhy, !(AVISIT == "BASELINE" & APERIODC == "PERIOD 2"))

  # define TBILI ALT/AST params, period dependent parameters and the parameters that will be assigned values "Y" or "N"
  paramcd_tbilialtast <- c("BLAL", "BGAS", "BGAL", "BLAS", "BA2AL", "BA2AS", "BA5AL", "BA5AS")
  paramcd_by_period <- c("ALTPULN", "ASTPULN", "ALTASTPU", "ALTPBASE", "ASTPBASE", "ALTASTPB")
  paramcd_yn <- c(
    "BL2AL2CU", "BG2AS2CU", "BL2AS2CU", "BG2AL2CU", "BG2AL2CB", "BL2AL2CB", "BG2AS2CB", "BL2AS2CB",
    paramcd_by_period
  )

  # add other variables to adhy
  adhy <- adhy %>%
    rel_var(
      var_name = "PARAMCD",
      related_var = "PARAM",
      var_values = param_init_list$relvar2
    ) %>%
    dplyr::mutate(
      AVALC = dplyr::case_when(
        PARAMCD %in% paramcd_tbilialtast ~ sample(
          x = c(">3-5ULN", ">5-10ULN", ">10-20ULN", ">20ULN", "Criteria not met"), size = dplyr::n(), replace = TRUE
        ),
        PARAMCD %in% paramcd_yn ~ sample(
          x = c("Y", "N"), prob = c(0.1, 0.9), size = dplyr::n(), replace = TRUE
        )
      ),
      AVAL = dplyr::case_when(
        AVALC == ">3-5ULN" ~ 1,
        AVALC == ">5-10ULN" ~ 2,
        AVALC == ">10-20ULN" ~ 3,
        AVALC == ">20ULN" ~ 4,
        AVALC == "Y" ~ 1,
        AVALC == "N" ~ 0,
        AVALC == "Criteria not met" ~ 0
      ),
      AVISITN = dplyr::case_when(
        AVISIT == "BASELINE" ~ 0L,
        AVISIT == "POST-BASELINE" ~ 9995L,
        TRUE ~ NA_integer_
      ),
      APERIOD = dplyr::case_when(
        APERIODC == "PERIOD 1" ~ 1L,
        APERIODC == "PERIOD 2" ~ 2L,
        TRUE ~ NA_integer_
      ),
      ABLFL = dplyr::if_else(AVISIT == "BASELINE", "Y", NA_character_),
      ONTRTFL = dplyr::if_else(AVISIT == "POST-BASELINE", "Y", NA_character_),
      ANL01FL = "Y",
      SRCSEQ = NA_integer_
    )

  # remove records for parameters with period 2 and not in paramcd_by_period
  adhy <- dplyr::filter(adhy, PARAMCD %in% paramcd_by_period | APERIODC == "PERIOD 1")

  # add baseline variables
  adhy <- adhy %>%
    dplyr::group_by(USUBJID, PARAMCD) %>%
    dplyr::mutate(
      BASEC = AVALC[AVISIT == "BASELINE"],
      BASE = AVAL[AVISIT == "BASELINE"]
    ) %>%
    dplyr::ungroup()

  adhy <- adhy %>%
    var_relabel(
      STUDYID = attr(adsl$STUDYID, "label"),
      USUBJID = attr(adsl$USUBJID, "label")
    )

  # merge ADSL to be able to add analysis datetime and analysis relative day variables
  adhy <- dplyr::inner_join(adhy, adsl, by = c("STUDYID", "USUBJID"))

  # define a simple helper function to create ADY variable
  add_ady <- function(x, avisit) {
    if (avisit == "BASELINE") {
      dplyr::mutate(
        x,
        ADY = sample(x = -(1:14), size = dplyr::n(), replace = TRUE)
      )
    } else if (avisit == "POST-BASELINE") {
      dplyr::rowwise(x) %>%
        dplyr::mutate(ADY = as.integer(sample(
          dplyr::if_else(
            !is.na(TRTEDTM),
            as.numeric(difftime(TRTEDTM, TRTSDTM, units = "days")),
            as.numeric(study_duration_secs, "days")
          ),
          size = 1,
          replace = TRUE
        )))
    } else {
      dplyr::mutate(x, ADY = NA_integer_)
    }
  }

  # add ADY and ADTM variables
  adhy <- adhy %>%
    dplyr::group_by(AVISIT, .add = FALSE) %>%
    dplyr::group_modify(~ add_ady(.x, .y$AVISIT)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(ADTM = TRTSDTM + lubridate::days(ADY))

  # order columns and arrange rows; column order follows ADaM_1.1 specification
  adhy <-
    adhy[, c(
      colnames(adsl),
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

  adhy <- adhy %>%
    dplyr::arrange(
      STUDYID,
      USUBJID,
      PARAMCD,
      AVISITN,
      ADTM,
      SRCSEQ
    )

  # apply metadata
  adhy <- apply_metadata(adhy, "metadata/adhy.yml")

  return(adhy)
}
