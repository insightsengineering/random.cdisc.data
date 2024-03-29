% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/radqlqc.R
\name{radqlqc}
\alias{radqlqc}
\title{EORTC QLQ-C30 V3 Analysis Dataset (ADQLQC)}
\usage{
radqlqc(adsl, percent, number, seed = NULL, cached = FALSE)
}
\arguments{
\item{adsl}{(\code{data.frame})\cr Subject-Level Analysis Dataset (ADSL).}

\item{percent}{(\code{numeric})\cr Completion - Completed at least y percent of questions, 1 record per visit}

\item{number}{(\code{numeric})\cr Completion - Completed at least x question(s), 1 record per visit}

\item{seed}{(\code{numeric})\cr Seed to use for reproducible random number generation.}

\item{cached}{boolean whether the cached ADQLQC data \code{cadqlqc} should be returned or new data
should be generated. If set to \code{TRUE} then the other arguments to \code{radqlqc} will be ignored.}
}
\value{
\code{data.frame}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#stable}{\figure{lifecycle-stable.svg}{options: alt='[Stable]'}}}{\strong{[Stable]}}

Function for generating a random EORTC QLQ-C30 V3 Analysis Dataset for a given
Subject-Level Analysis Dataset.
}
\details{
Keys: \code{STUDYID}, \code{USUBJID}, \code{PARCAT1N}, \code{PARAMCD}, \code{BASETYPE}, \code{AVISITN}, \code{ATPTN}, \code{ADTM}, \code{QSSEQ}
}
\examples{
adsl <- radsl(N = 10, study_duration = 2, seed = 1)

adqlqc <- radqlqc(adsl, seed = 1, percent = 80, number = 2)
adqlqc
}
