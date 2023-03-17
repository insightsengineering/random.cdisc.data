#' Adverse Event Analysis Dataset (ADAE)
#'
#' Function for generating random Adverse Event Analysis Dataset for a given
#' Subject-Level Analysis Dataset.
#'
#' @details One record per each record in the corresponding SDTM domain.
#'
#' Keys: STUDYID USUBJID ASTDTM AETERM AESEQ.
#'
#' @template ADSL_params
#' @template lookup_param
#' @template lookup_aag_param
#' @param max_n_aes Maximum number of AEs per patient.
#' @inheritParams radsl
#' @inheritParams mutate_na
#'
#' @templateVar data adae
#' @template param_cached
#'
#' @template return_data.frame
#'
#' @importFrom rlang .data
#'
#' @export
#'
#' @examples
#' library(random.cdisc.data)
#' ADSL <- radsl(N = 10, study_duration = 2, seed = 1)
#' radae(ADSL, seed = 2)
#'
#' # Add metadata.
#' aag <- utils::read.table(
#'   sep = ",", header = TRUE,
#'   text = paste(
#'     "NAMVAR,SRCVAR,GRPTYPE,REFNAME,REFTERM,SCOPE",
#'     "CQ01NAM,AEDECOD,CUSTOM,D.2.1.5.3/A.1.1.1.1 AESI,dcd D.2.1.5.3,",
#'     "CQ01NAM,AEDECOD,CUSTOM,D.2.1.5.3/A.1.1.1.1 AESI,dcd A.1.1.1.1,",
#'     "SMQ01NAM,AEDECOD,SMQ,C.1.1.1.3/B.2.2.3.1 AESI,dcd C.1.1.1.3,BROAD",
#'     "SMQ01NAM,AEDECOD,SMQ,C.1.1.1.3/B.2.2.3.1 AESI,dcd B.2.2.3.1,BROAD",
#'     "SMQ02NAM,AEDECOD,SMQ,Y.9.9.9.9/Z.9.9.9.9 AESI,dcd Y.9.9.9.9,NARROW",
#'     "SMQ02NAM,AEDECOD,SMQ,Y.9.9.9.9/Z.9.9.9.9 AESI,dcd Z.9.9.9.9,NARROW",
#'     sep = "\n"
#'   ), stringsAsFactors = FALSE
#' )
#'
#' adae <- radae(ADSL, lookup_aag = aag)
#'
#' with(
#'   adae,
#'   cbind(
#'     table(AEDECOD, SMQ01NAM),
#'     table(AEDECOD, CQ01NAM)
#'   )
#' )
radae <- function(ADSL, # nolint
                  max_n_aes = 10L,
                  lookup = NULL,
                  lookup_aag = NULL,
                  seed = NULL,
                  na_percentage = 0,
                  na_vars = list(
                    AEBODSYS = c(NA, 0.1),
                    AEDECOD = c(1234, 0.1),
                    AETOXGR = c(1234, 0.1)
                  ),
                  cached = FALSE) {
  checkmate::assert_flag(cached)
  if (cached) {
    return(get_cached_data("cadae"))
  }

  checkmate::assert_data_frame(ADSL)
  checkmate::assert_integer(max_n_aes, len = 1, any.missing = FALSE)
  checkmate::assert_number(seed, null.ok = TRUE)
  checkmate::assert_number(na_percentage, lower = 0, upper = 1)
  checkmate::assert_true(na_percentage < 1)

  # check lookup parameters
  checkmate::assert_data_frame(lookup, null.ok = TRUE)
  lookup_ae <- if (!is.null(lookup)) {
    lookup
  } else {
    tibble::tribble(
      ~AEBODSYS, ~AELLT, ~AEDECOD, ~AEHLT, ~AEHLGT, ~AETOXGR, ~AESOC, ~AESER, ~AEREL,
      "cl A.1", "llt A.1.1.1.1", "dcd A.1.1.1.1", "hlt A.1.1.1", "hlgt A.1.1", "1", "cl A", "N", "N",
      "cl A.1", "llt A.1.1.1.2", "dcd A.1.1.1.2", "hlt A.1.1.1", "hlgt A.1.1", "2", "cl A", "Y", "N",
      "cl B.1", "llt B.1.1.1.1", "dcd B.1.1.1.1", "hlt B.1.1.1", "hlgt B.1.1", "5", "cl B", "Y", "Y",
      "cl B.2", "llt B.2.1.2.1", "dcd B.2.1.2.1", "hlt B.2.1.2", "hlgt B.2.1", "3", "cl B", "N", "N",
      "cl B.2", "llt B.2.2.3.1", "dcd B.2.2.3.1", "hlt B.2.2.3", "hlgt B.2.2", "1", "cl B", "Y", "N",
      "cl C.1", "llt C.1.1.1.3", "dcd C.1.1.1.3", "hlt C.1.1.1", "hlgt C.1.1", "4", "cl C", "N", "Y",
      "cl C.2", "llt C.2.1.2.1", "dcd C.2.1.2.1", "hlt C.2.1.2", "hlgt C.2.1", "2", "cl C", "N", "Y",
      "cl D.1", "llt D.1.1.1.1", "dcd D.1.1.1.1", "hlt D.1.1.1", "hlgt D.1.1", "5", "cl D", "Y", "Y",
      "cl D.1", "llt D.1.1.4.2", "dcd D.1.1.4.2", "hlt D.1.1.4", "hlgt D.1.1", "3", "cl D", "N", "N",
      "cl D.2", "llt D.2.1.5.3", "dcd D.2.1.5.3", "hlt D.2.1.5", "hlgt D.2.1", "1", "cl D", "N", "Y"
    )
  }

  checkmate::assert_data_frame(lookup_aag, null.ok = TRUE)
  AAG <- if (!is.null(lookup_aag)) { # nolint
    lookup_aag
  } else {
    aag <- utils::read.table(
      sep = ",", header = TRUE,
      text = paste(
        "NAMVAR,SRCVAR,GRPTYPE,REFNAME,REFTERM,SCOPE",
        "CQ01NAM,AEDECOD,CUSTOM,D.2.1.5.3/A.1.1.1.1 AESI,dcd D.2.1.5.3,",
        "CQ01NAM,AEDECOD,CUSTOM,D.2.1.5.3/A.1.1.1.1 AESI,dcd A.1.1.1.1,",
        "SMQ01NAM,AEDECOD,SMQ,C.1.1.1.3/B.2.2.3.1 AESI,dcd C.1.1.1.3,BROAD",
        "SMQ01NAM,AEDECOD,SMQ,C.1.1.1.3/B.2.2.3.1 AESI,dcd B.2.2.3.1,BROAD",
        "SMQ02NAM,AEDECOD,SMQ,Y.9.9.9.9/Z.9.9.9.9 AESI,dcd Y.9.9.9.9,NARROW",
        "SMQ02NAM,AEDECOD,SMQ,Y.9.9.9.9/Z.9.9.9.9 AESI,dcd Z.9.9.9.9,NARROW",
        sep = "\n"
      ), stringsAsFactors = FALSE
    )
  }

  if (!is.null(seed)) set.seed(seed)
  study_duration_secs <- attr(ADSL, "study_duration_secs")

  ADAE <- Map( # nolint
    function(id, sid) {
      n_aes <- sample(c(0, seq_len(max_n_aes)), 1)
      i <- sample(seq_len(nrow(lookup_ae)), n_aes, TRUE)
      dplyr::mutate(
        lookup_ae[i, ],
        USUBJID = id,
        STUDYID = sid
      )
    },
    ADSL$USUBJID,
    ADSL$STUDYID
  ) %>%
    Reduce(rbind, .) %>%
    `[`(c(10, 11, 1, 2, 3, 4, 5, 6, 7, 8, 9)) %>%
    dplyr::mutate(AETERM = gsub("dcd", "trm", .data$AEDECOD)) %>%
    dplyr::mutate(AESEV = dplyr::case_when(
      AETOXGR == 1 ~ "MILD",
      AETOXGR %in% c(2, 3) ~ "MODERATE",
      AETOXGR %in% c(4, 5) ~ "SEVERE"
    ))

  ADAE <- var_relabel( # nolint
    ADAE,
    STUDYID = "Study Identifier",
    USUBJID = "Unique Subject Identifier"
  )

  # merge ADSL to be able to add AE date and study day variables
  ADAE <- dplyr::inner_join(ADAE, ADSL, by = c("STUDYID", "USUBJID")) %>% # nolint
    dplyr::rowwise() %>%
    dplyr::mutate(TRTEDT = lubridate::date(dplyr::case_when(
      is.na(.data$TRTEDTM) ~ lubridate::floor_date(lubridate::date(TRTSDTM) + study_duration_secs, unit = "day"),
      TRUE ~ .data$TRTEDTM
    ))) %>%
    dplyr::mutate(ASTDTM = sample(
      seq(lubridate::as_datetime(TRTSDTM), lubridate::as_datetime(TRTEDT), by = "day"),
      size = 1
    )) %>%
    dplyr::mutate(ASTDY = ceiling(difftime(.data$ASTDTM, .data$TRTSDTM, units = "days"))) %>%
    # add 1 to end of range incase both values passed to sample() are the same
    dplyr::mutate(AENDTM = sample(
      seq(lubridate::as_datetime(ASTDTM), lubridate::as_datetime(TRTEDT + 1), by = "day"),
      size = 1
    )) %>%
    dplyr::mutate(AENDY = ceiling(difftime(.data$AENDTM, .data$TRTSDTM, units = "days"))) %>%
    dplyr::mutate(LDOSEDTM = dplyr::case_when(
      .data$TRTSDTM < .data$ASTDTM ~ lubridate::as_datetime(stats::runif(1, .data$TRTSDTM, .data$ASTDTM)),
      TRUE ~ .data$ASTDTM
    )) %>%
    mutate(LDRELTM = as.numeric(difftime(.data$ASTDTM, .data$LDOSEDTM, units = "mins"))) %>%
    dplyr::select(-TRTEDT) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$STUDYID, .data$USUBJID, .data$ASTDTM, .data$AETERM)

  ADAE <- ADAE %>% # nolint
    dplyr::group_by(.data$USUBJID) %>%
    dplyr::mutate(AESEQ = seq_len(dplyr::n())) %>%
    dplyr::mutate(ASEQ = .data$AESEQ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      .data$STUDYID,
      .data$USUBJID,
      .data$ASTDTM,
      .data$AETERM,
      .data$AESEQ
    )

  outcomes <- c(
    "UNKNOWN",
    "NOT RECOVERED/NOT RESOLVED",
    "RECOVERED/RESOLVED WITH SEQUELAE",
    "RECOVERING/RESOLVING",
    "RECOVERED/RESOLVED"
  )

  actions <- c(
    "DOSE RATE REDUCED",
    "UNKNOWN",
    "NOT APPLICABLE",
    "DRUG INTERRUPTED",
    "DRUG WITHDRAWN",
    "DOSE INCREASED",
    "DOSE NOT CHANGED",
    "DOSE REDUCED",
    "NOT EVALUABLE"
  )

  ADAE <- ADAE %>% # nolint
    dplyr::mutate(AEOUT = factor(ifelse(
      .data$AETOXGR == "5",
      "FATAL",
      as.character(sample_fct(outcomes, nrow(ADAE), prob = c(0.1, 0.2, 0.1, 0.3, 0.3)))
    ))) %>%
    dplyr::mutate(AEACN = factor(ifelse(
      .data$AETOXGR == "5",
      "NOT EVALUABLE",
      as.character(sample_fct(actions, nrow(ADAE), prob = c(0.05, 0.05, 0.05, 0.01, 0.05, 0.1, 0.45, 0.1, 0.05)))
    ))) %>%
    dplyr::mutate(AESDTH = dplyr::case_when(
      .data$AEOUT == "FATAL" ~ "Y",
      TRUE ~ "N"
    )) %>%
    dplyr::mutate(TRTEMFL = ifelse(.data$ASTDTM >= .data$TRTSDTM, "Y", "")) %>%
    dplyr::mutate(AECONTRT = sample(c("Y", "N"), prob = c(0.4, 0.6), size = dplyr::n(), replace = TRUE)) %>%
    dplyr::mutate(ANL01FL = ifelse(.data$TRTEMFL == "Y" & .data$ASTDTM <= .data$TRTEDTM + lubridate::month(1), "Y", "")) %>%
    dplyr::mutate(ANL01FL = ifelse(is.na(.data$ANL01FL), "", .data$ANL01FL))

  ADAE <- ADAE %>% # nolint
    dplyr::mutate(AERELNST = sample(c("Y", "N"), prob = c(0.4, 0.6), size = dplyr::n(), replace = TRUE)) %>%
    dplyr::mutate(AEACNOTH = sample(
      x = c("MEDICATION", "PROCEDURE/SURGERY", "SUBJECT DISCONTINUED FROM STUDY", "NONE"),
      prob = c(0.2, 0.4, 0.2, 0.2),
      size = dplyr::n(),
      replace = TRUE
    ))

  # Split metadata for AEs of special interest (AESI).
  l_AAG <- split(AAG, interaction(AAG$NAMVAR, AAG$SRCVAR, AAG$GRPTYPE, drop = TRUE)) # nolint

  # Create AESI flags
  l_AESI <- lapply(l_AAG, function(d_adag, d_adae) { # nolint

    names(d_adag)[names(d_adag) == "REFTERM"] <- d_adag$SRCVAR[1] # nolint
    names(d_adag)[names(d_adag) == "REFNAME"] <- d_adag$NAMVAR[1] # nolint

    if (d_adag$GRPTYPE[1] == "CUSTOM") { # nolint

      d_adag <- d_adag[-which(names(d_adag) == "SCOPE")] # nolint
    } else if (d_adag$GRPTYPE[1] == "SMQ") { # nolint

      names(d_adag)[names(d_adag) == "SCOPE"] <- paste0(substr(d_adag$NAMVAR[1], 1, 5), "SC") # nolint
    }

    d_adag <- d_adag[-which(names(d_adag) %in% c("NAMVAR", "SRCVAR", "GRPTYPE"))] # nolint
    d_new <- dplyr::left_join(x = d_adae, y = d_adag, by = intersect(names(d_adae), names(d_adag)))
    d_new[, dplyr::setdiff(names(d_new), names(d_adae)), drop = FALSE]
  }, ADAE)

  ADAE <- dplyr::bind_cols(ADAE, l_AESI) # nolint

  ADAE <- dplyr::mutate(ADAE, AERELNST = sample( # nolint
    x = c("CONCURRENT ILLNESS", "OTHER", "DISEASE UNDER STUDY", "NONE"),
    prob = c(0.3, 0.3, 0.3, 0.1),
    size = dplyr::n(),
    replace = TRUE
  ))


  ADAE <- ADAE %>% # nolint
    dplyr::mutate(AES_FLAG = sample( # nolint
      x = c("AESLIFE", "AESHOSP", "AESDISAB", "AESCONG", "AESMIE"),
      prob = c(0.1, 0.2, 0.2, 0.2, 0.3),
      size = dplyr::n(),
      replace = TRUE
    )) %>% # nolint
    dplyr::mutate(AES_FLAG = dplyr::case_when( # nolint
      AESDTH == "Y" ~ "AESDTH",
      TRUE ~ .data$AES_FLAG
    )) %>% # nolint
    dplyr::mutate( # nolint
      AESCONG = ifelse(.data$AES_FLAG == "AESCONG", "Y", "N"),
      AESDISAB = ifelse(.data$AES_FLAG == "AESDISAB", "Y", "N"),
      AESHOSP = ifelse(.data$AES_FLAG == "AESHOSP", "Y", "N"),
      AESLIFE = ifelse(.data$AES_FLAG == "AESLIFE", "Y", "N"),
      AESMIE = ifelse(.data$AES_FLAG == "AESMIE", "Y", "N")
    ) %>% # nolint
    dplyr::select(-"AES_FLAG") # nolint

  if (length(na_vars) > 0 && na_percentage > 0) {
    ADAE <- mutate_na(ds = ADAE, na_vars = na_vars, na_percentage = na_percentage) # nolint
  }

  # apply metadata
  ADAE <- apply_metadata(ADAE, "metadata/ADAE.yml") # nolint

  return(ADAE)
}
