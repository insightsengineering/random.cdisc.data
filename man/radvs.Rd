% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/radvs.R
\name{radvs}
\alias{radvs}
\title{Vital Signs Analysis Dataset (ADVS)}
\usage{
radvs(
  ADSL,
  param = c("Diastolic Blood Pressure", "Pulse Rate", "Respiratory Rate",
    "Systolic Blood Pressure", "Temperature", "Weight"),
  paramcd = c("DIABP", "PULSE", "RESP", "SYSBP", "TEMP", "WEIGHT"),
  paramu = c("Pa", "beats/min", "breaths/min", "Pa", "C", "Kg"),
  visit_format = "WEEK",
  n_assessments = 5L,
  n_days = 5L,
  seed = NULL,
  na_percentage = 0,
  na_vars = list(CHG2 = c(1235, 0.1), PCHG2 = c(1235, 0.1), CHG = c(1234, 0.1), PCHG =
    c(1234, 0.1), AVAL = c(123, 0.1), AVALU = c(123, 0.1)),
  cached = FALSE
)
}
\arguments{
\item{ADSL}{Subject-Level Analysis Dataset (ADSL).}

\item{param}{As character string. list of parameter values.}

\item{paramcd}{As character string. list of parameter code values.}

\item{paramu}{As character string. list of parameter unit values.}

\item{visit_format}{Type of visit either "WEEK" or "CYCLE".}

\item{n_assessments}{Number of weeks or cycles.}

\item{n_days}{Number of days within cycle.}

\item{seed}{Seed for random number generation.}

\item{na_percentage}{(\code{numeric}) Default percentage of values to be replaced by NA}

\item{na_vars}{(\code{list}) A named list where the name of each element is a column name of \code{ds}. Each
 element of this list should be a numeric vector with two elements
 \itemize{
    \item{seed }{The seed to be used for this element - can be left NA}
    \item{percentage }{How many element should be replaced. 0 is 0 \% 1 is 100 \%, can be left NA and default
    percentage is used. This will overwrite default percentage (percentage argument))}
}}

\item{cached}{boolean whether the cached ADVS data \code{cadvs} should be returned or new data
should be generated. If set to \code{TRUE} then the other arguments to \code{radvs} will be ignored.}
}
\value{
data.frame
}
\description{
Function for generating random dataset from Vital Signs Analysis Dataset for a given
Subject-Level Analysis Dataset.
}
\details{
One record per subject per parameter per analysis visit per analysis date.

Keys: STUDYID, USUBJID, PARAMCD, BASETYPE, AVISITN, ATPTN, DTYPE, ADTM, VSSEQ, ASPID.
}
\examples{
library(random.cdisc.data)
ADSL <- radsl(N = 10, seed = 1, study_duration = 2)
radvs(ADSL, visit_format = "WEEK", n_assessments = 7L, seed = 2)
radvs(ADSL, visit_format = "CYCLE", n_assessments = 3L, seed = 2)
}
\author{
npaszty
}