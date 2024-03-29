% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/radeg.R
\name{radeg}
\alias{radeg}
\title{ECG Analysis Dataset (ADEG)}
\usage{
radeg(
  adsl,
  egcat = c("INTERVAL", "INTERVAL", "MEASUREMENT", "FINDING"),
  param = c("QT Duration", "RR Duration", "Heart Rate", "ECG Interpretation"),
  paramcd = c("QT", "RR", "HR", "ECGINTP"),
  paramu = c("msec", "msec", "beats/min", ""),
  visit_format = "WEEK",
  n_assessments = 5L,
  n_days = 5L,
  max_n_eg = 10L,
  lookup = NULL,
  seed = NULL,
  na_percentage = 0,
  na_vars = list(ABLFL = c(1235, 0.1), BASE = c(NA, 0.1), BASEC = c(NA, 0.1), CHG =
    c(1234, 0.1), PCHG = c(1234, 0.1)),
  cached = FALSE
)
}
\arguments{
\item{adsl}{(\code{data.frame})\cr Subject-Level Analysis Dataset (ADSL).}

\item{egcat}{(\verb{character vector})\cr EG category values.}

\item{param}{(\verb{character vector})\cr Parameter values.}

\item{paramcd}{(\verb{character vector})\cr Parameter code values.}

\item{paramu}{(\verb{character vector})\cr Parameter unit values.}

\item{visit_format}{(\code{character})\cr Type of visit. Options are "WEEK" and "CYCLE".}

\item{n_assessments}{(\code{integer})\cr Number of weeks or cycles.}

\item{n_days}{(\code{integer})\cr Number of days in each cycle (only used if \code{visit_format} is "CYCLE").}

\item{max_n_eg}{(\code{integer})\cr Maximum number of EG results per patient. Defaults to 10.}

\item{lookup}{(\code{data.frame})\cr Additional parameters.}

\item{seed}{(\code{numeric})\cr Seed to use for reproducible random number generation.}

\item{na_percentage}{(\code{proportion})\cr Default percentage of values to be replaced by \code{NA}.}

\item{na_vars}{(\code{list})\cr A named list where the name of each element is a column name of \code{ds}. Each
element of this list should be a numeric vector with two elements:
\itemize{
\item{\code{seed} (\code{numeric})\cr The seed to be used for this element - can be \code{NA}.}
\item{\code{percentage} (\code{proportion})\cr Percentage of elements to be replaced with \code{NA}.
If \code{NA}, \code{na_percentage} is used as a default.}
}}

\item{cached}{boolean whether the cached ADEG data \code{cadeg} should be returned or new data
should be generated. If set to \code{TRUE} then the other arguments to \code{radeg} will be ignored.}
}
\value{
\code{data.frame}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#stable}{\figure{lifecycle-stable.svg}{options: alt='[Stable]'}}}{\strong{[Stable]}}

Function for generating random dataset from ECG Analysis Dataset for a given
Subject-Level Analysis Dataset.
}
\details{
One record per subject per parameter per analysis visit per analysis date.

Keys: \code{STUDYID}, \code{USUBJID}, \code{PARAMCD}, \code{BASETYPE}, \code{AVISITN}, \code{ATPTN}, \code{DTYPE}, \code{ADTM}, \code{EGSEQ}, \code{ASPID}
}
\examples{
adsl <- radsl(N = 10, seed = 1, study_duration = 2)

adeg <- radeg(adsl, visit_format = "WEEK", n_assessments = 7L, seed = 2)
adeg

adeg <- radeg(adsl, visit_format = "CYCLE", n_assessments = 2L, seed = 2)
adeg
}
\author{
tomlinsj, npaszty, Xuefeng Hou, dipietrc
}
