#' Time-to-Event Analysis Dataset (ADTTE)
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Function for generating a random Time-to-Event Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details
#'
#' Keys: `STUDYID`, `USUBJID`, `PARAMCD`
#'
#' @inheritParams argument_convention
#' @inheritParams radaette
#' @template param_cached
#' @templateVar data adtte
#'
#' @return `data.frame`
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' adsl <- radsl(N = 10, seed = 1, study_duration = 2)
#'
#' adtte <- radtte(adsl, seed = 2)
#' adtte
radtte <- function(adsl,
                   event_descr = NULL,
                   censor_descr = NULL,
                   lookup = NULL,
                   seed = NULL,
                   na_percentage = 0,
                   na_vars = list(CNSR = c(NA, 0.1), AVAL = c(1234, 0.1), AVALU = c(1234, 0.1)),
                   cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadtte"))
  }

  checkmate::assert_data_frame(adsl)
  checkmate::assert_character(censor_descr, null.ok = TRUE, min.len = 1, any.missing = FALSE)
  checkmate::assert_character(event_descr, null.ok = TRUE, min.len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  if (!is.null(seed)) {
    set.seed(seed)
  }
  study_duration_secs <- lubridate::seconds(attr(adsl, "study_duration_secs"))

  checkmate::assert_data_frame(lookup, null.ok = TRUE)
  lookup_tte <- if (!is.null(lookup)) {
    lookup
  } else {
    tibble::tribble(
      ~ARM, ~PARAMCD, ~PARAM, ~LAMBDA, ~CNSR_P,
      "ARM A", "EFS", "Event Free Survival", log(2) / 365, 0.4,
      "ARM B", "EFS", "Event Free Survival", log(2) / 305, 0.3,
      "ARM C", "EFS", "Event Free Survival", log(2) / 243, 0.2,
      "ARM A", "CRSD", "Duration of Confirmed Response", log(2) / 305, 0.4,
      "ARM B", "CRSD", "Duration of Confirmed Response", log(2) / 243, 0.3,
      "ARM C", "CRSD", "Duration of Confirmed Response", log(2) / 182, 0.2,
      "ARM A", "PFS", "Progression Free Survival", log(2) / 365, 0.4,
      "ARM B", "PFS", "Progression Free Survival", log(2) / 305, 0.3,
      "ARM C", "PFS", "Progression Free Survival", log(2) / 243, 0.2,
      "ARM A", "OS", "Overall Survival", log(2) / 610, 0.4,
      "ARM B", "OS", "Overall Survival", log(2) / 490, 0.3,
      "ARM C", "OS", "Overall Survival", log(2) / 365, 0.2,
    )
  }

  evntdescr_sel <- if (!is.null(event_descr)) {
    event_descr
  } else {
    c(
      "Death",
      "Disease Progression",
      "Last Tumor Assessment",
      "Adverse Event",
      "Alive"
    )
  }

  cnsdtdscr_sel <- if (!is.null(censor_descr)) {
    censor_descr
  } else {
    c(
      "Preferred Term",
      "Clinical Cut Off",
      "Completion or Discontinuation",
      "End of AE Reporting Period"
    )
  }

  adtte <- split(adsl, adsl$USUBJID) %>%
    lapply(FUN = function(pinfo) {
      lookup_tte %>%
        dplyr::filter(ARM == as.character(pinfo$ACTARMCD)) %>%
        dplyr::rowwise() %>%
        dplyr::mutate(
          STUDYID = pinfo$STUDYID,
          SITEID = pinfo$SITEID,
          USUBJID = pinfo$USUBJID,
          AVALU = "DAYS"
        ) %>%
        dplyr::select(-"LAMBDA", -"CNSR_P")
    }) %>%
    Reduce(rbind, .) %>%
    var_relabel(
      STUDYID = "Study Identifier",
      USUBJID = "Unique Subject Identifier" # )
    )

  # Loop through each patient and randomly assign a value for EVNTDESC
  adtte_split <- split(adtte, adtte$USUBJID)

  # Add EVNTDESC column
  adtte_lst <- lapply(adtte_split, function(split_df) {
    # First create an empty EVNTDESC variable to populate
    split_df$EVNTDESC <- NA
    for (i in 1:nrow(split_df)) { # nolint
      # If this is the first row then create a random value from evntdescr_sel for EVNTDESC
      if (i == 1) {
        split_df$EVNTDESC[i] <- sample(evntdescr_sel[c(1:4)], 1, prob = c(0.1, 0.3, 0.4, 0.2))
      } else if (i != 1 & i != nrow(split_df)) {
        # First check to see if "Death" has been entered in the as a previous value
        # If so we need to make the rest of the EVNTDESC values "Death" to make sense
        # The patient cannot die and then come back to life
        if (any(grepl("Death", split_df$EVNTDESC))) { # If previous value has "Death" the following need to be "Death"
          split_df$EVNTDESC[i] <- "Death"
        } else { # If there are no "Death" values randomly select another value
          split_df$EVNTDESC[i] <- sample(evntdescr_sel[c(1:4)], 1)
        }
      } else { # This is for processing OS as this can only be "Death" or "Alive"
        if (any(grepl("Death", split_df$EVNTDESC))) { # If previous value has "Death" the following need to be "Death"
          split_df$EVNTDESC[i] <- "Death"
        } else { # If there are no "Death" values randomly select another value
          split_df$EVNTDESC[i] <- "Alive"
        }
      }
    }
    split_df
  })

  # Add CNSR column
  adtte_lst <- lapply(adtte_lst, function(split_df) {
    # First create an empty CNSR variable to populate
    split_df$CNSR <- NA
    for (i in 1:nrow(split_df)) { # nolint
      # If this is the first row then create a random value from evntdescr_sel for EVNTDESC
      if (split_df$EVNTDESC[i] == "Death" | split_df$EVNTDESC[i] == "Disease Progression") {
        split_df$CNSR[i] <- 0
      } else {
        split_df$CNSR[i] <- 1
      }
    }
    split_df
  })

  # Add AVAL column
  adtte_lst <- lapply(adtte_lst, function(split_df) {
    # First create an empty CNSR variable to populate
    split_df$AVAL <- NA
    for (i in 1:nrow(split_df)) { # nolint
      if (i == 1) {
        split_df$AVAL[i] <- runif(1, 15, 100)
      } else if (i != 1 & any(grepl("Death", split_df[1:i - 1, "EVNTDESC"]))) {
        # Check if there are any death values before the current row
        # Set the AVAL to the value of the row that has the "Death" value
        # as the patient cannot live longer than this value
        death_position <- match("Death", split_df[1:i - 1, "EVNTDESC"][[1]])
        split_df$AVAL[i] <- split_df$AVAL[death_position]
      } else if (i == 2) {
        split_df$AVAL[i] <- runif(1, 100, 200)
      } else if (i == 3) {
        split_df$AVAL[i] <- runif(1, 200, 300)
      } else if (i == 4) {
        split_df$AVAL[i] <- runif(1, 300, 500)
      }
    }
    split_df
  })

  # Add CNSDTDSC column
  adtte_lst <- lapply(adtte_lst, function(split_df) {
    # First create an empty CNSDTDSC variable to populate
    split_df$CNSDTDSC <- NA
    for (i in 1:nrow(split_df)) { # nolint
      if (split_df$CNSR[i] == 1 & split_df$EVNTDESC[i] == "Last Tumor Assessment") {
        split_df$CNSDTDSC[i] <- "Completion or Discontinuation"
      } else if (split_df$CNSR[i] == 1 & split_df$EVNTDESC[i] == "Adverse Event") {
        split_df$CNSDTDSC[i] <- "Preferred Term"
      } else if (split_df$CNSR[i] == 1 & split_df$EVNTDESC[i] == "Alive") {
        split_df$CNSDTDSC[i] <- "Alive During Study"
      } else {
        split_df$CNSDTDSC[i] <- ""
      }
    }
    split_df
  })

  # Take the split df and combine them back together
  adtte <- do.call("rbind", adtte_lst)
  rownames(adtte) <- NULL

  adtte <- var_relabel(
    adtte,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add TTE date and study day variables
  adtte <- dplyr::inner_join(
    dplyr::select(adtte, -"SITEID", -"ARM"),
    adsl,
    by = c("STUDYID", "USUBJID")
  ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(TRTENDT = lubridate::date(dplyr::case_when(
      is.na(TRTEDTM) ~ lubridate::floor_date(lubridate::date(TRTSDTM) + study_duration_secs, unit = "day"),
      TRUE ~ TRTEDTM
    ))) %>%
    dplyr::mutate(ADTM = sample(
      seq(lubridate::as_datetime(TRTSDTM), lubridate::as_datetime(TRTENDT), by = "day"),
      size = 1
    )) %>%
    dplyr::mutate(ADY = ceiling(difftime(ADTM, TRTSDTM, units = "days"))) %>%
    dplyr::select(-TRTENDT) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(STUDYID, USUBJID, ADTM)

  adtte <- adtte %>%
    dplyr::group_by(USUBJID) %>%
    dplyr::mutate(TTESEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = TTESEQ) %>%
    dplyr::mutate(PARAM = as.factor(PARAM)) %>%
    dplyr::mutate(PARAMCD = as.factor(PARAMCD)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      STUDYID,
      USUBJID,
      PARAMCD,
      ADTM,
      TTESEQ
    )

  mod_before_adtte <- adtte

  # adding adverse event counts and log follow-up time
  adtte <- dplyr::bind_rows(
    adtte,
    data.frame(
      adtte %>%
        dplyr::group_by(USUBJID) %>%
        dplyr::slice_head(n = 1) %>%
        dplyr::mutate(
          PARAMCD = "TNE",
          PARAM = "Total Number of Exacerbations",
          AVAL = stats::rpois(1, 3),
          AVALU = "COUNT",
          lgTMATRSK = log(stats::rexp(1, rate = 3)),
          dplyr::across(
            c("ASEQ", "TTESEQ", "ADY", "ADTM", "EVNTDESC"),
            ~NA
          )
        )
    )
  ) %>%
    dplyr::arrange(
      STUDYID,
      USUBJID,
      PARAMCD,
      ADTM,
      TTESEQ
    )

  mod_after_adtte <- adtte

  if (length(na_vars) > 0 && na_percentage > 0) {
    adtte <- mutate_na(ds = adtte, na_vars = na_vars, na_percentage = na_percentage)
  }

  # apply metadata
  adtte <- apply_metadata(adtte, "metadata/ADTTE.yml")

  return(adtte)
}
