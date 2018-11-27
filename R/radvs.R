#' Vital Signs Dataset
#'
#' Function for generating random dataset from laboratory Test Findings domain for a given
#' Subject-Level Analysis Dataset
#'
#' @details One record per subject per parameter per analysis visit per analysis date.
#' SDTM variables are populated on new records coming from other single records.
#' Otherwise, SDTM variables are left blank.
#'
#' Keys: STUDYID USUBJID PARAMCD AVISITN
#'
#' @template param_ADSL
#' @inheritParams radsl
#'
#' @export
#' @importFrom yaml yaml.load_file
#'
#' @author npaszty
#' @template return_data.frame
#'
#' @examples
#'
#' ADSL <- radsl()
#' ADVS <- radvs(ADSL)
#' head(ADVS)
radvs <- function(ADSL, seed = NULL) {

  if (!is.null(seed)) set.seed(seed)

  # Create an example ADVS dataset from the 100 patient, with 7 visits with 6
  # parameters for each subject.
  ADVS <- expand.grid(
    STUDYID = unique(ADSL$STUDYID),
    USUBJID = ADSL$USUBJID,
    PARAM = c("Diastolic Blood Pressure", "Pulse Rate", "Respiratory Rate", "Systolic Blood Pressure",
              "Temperature", "Weight"),
    AVISIT = c("SCREENING", "BASELINE",  paste0("WEEK ", 1:5)),
    stringsAsFactors = FALSE
  )

  ADVS$PARAMCD <- c("DIABP", "PULSE", "RESP", "SYSBP", "TEMP", "WEIGHT")

  ADVS$AVISITCD <- ifelse(ADVS$AVISIT %in% "SCREENING", "SCR",
                          ifelse(ADVS$AVISIT %in% "BASELINE", "BL",
                                 ifelse(grepl("WEEK", ADVS$AVISIT), "W", NA)))

  ADVS$AVISITCDN <- as.numeric(ifelse(ADVS$AVISIT %in% "SCREENING", -1,
                                      ifelse(ADVS$AVISIT %in% "BASELINE", 0,
                                             ifelse(grepl("WEEK", ADVS$AVISIT) , substr(ADVS$AVISIT, start=6, stop=7), NA))))

  ADVS$AVAL <- rnorm(nrow(ADVS), mean = 50, sd = 8)

  ADVS <- Reduce(rbind, lapply(split(ADVS, ADVS$USUBJID), function(x) {
    x$STUDYID <- ADSL$STUDYID[which(ADSL$USUBJID == x$USUBJID[1])]
    x$BASE2 <- x$AVAL[1]
    x$CHG2 <- x$AVAL - x$BASE2
    x$PCHG2 <- 100 * x$CHG2 / x$BASE2
    x$BASE <- x$AVAL[2]
    x$CHG <- x$AVAL - x$BASE
    x$PCHG <- 100 * x$CHG / x$BASE
    x
  })) %>%
    mutate(AVISITCD = factor(AVISITCD) %>% reorder(AVISITCDN)) %>%
    mutate(AVISITN = AVISITCDN) %>%
    var_relabel(
      USUBJID = attr(ADSL$USUBJID, "label"),
      STUDYID = attr(ADSL$STUDYID, "label")
    )

  ## read domain metadata file
  metadata <- yaml.load_file(file.path(
    path.package(package = "random.cdisc.data", quiet = FALSE),
    "advs.yml"
  ))

  # assign label to data frame
  attr(ADVS, "label") <- metadata$domain$label

  ## assign labels to variables
  for(var in intersect(names(ADVS), names(metadata$variables))) {
    attr(ADVS[[var]], "label") <- metadata$variables[[var]]$label
  }

  ## reorder data frame columns to expected BDS order
  ADVS <- ADVS[, unique(c("STUDYID", "USUBJID",
                        intersect(names(ADVS), names(metadata$variables))))]


  ## add all ADSL variables to domain - BDS is one proc away
  ADVS <- inner_join(ADSL, ADVS, by=c("STUDYID", "USUBJID"))

  ADVS

}


