% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/radsaftte.R
\name{radsaftte}
\alias{radsaftte}
\title{Time to Safety Event Analysis Dataset (ADSAFTTE)}
\usage{
radsaftte(adsl, ...)
}
\arguments{
\item{adsl}{(\code{data.frame})\cr Subject-Level Analysis Dataset (ADSL).}

\item{...}{Additional arguments to be passed to \code{radaette}}
}
\value{
\code{data.frame}
}
\description{
Function to generate random Time-to-Safety Event Dataset for a
given Subject-Level Analysis Dataset.
}
\details{
Keys: \code{STUDYID}, \code{USUBJID}, \code{PARAMCD}
}
\examples{
adsl <- radsl(N = 10, seed = 1, study_duration = 2)

adsaftte <- radsaftte(adsl, seed = 2)
adsaftte
}
