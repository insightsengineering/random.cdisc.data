% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{relvar_init}
\alias{relvar_init}
\title{Related Variables: Initialize}
\usage{
relvar_init(relvar1, relvar2)
}
\arguments{
\item{relvar1}{(\code{list} of \code{character})\cr List of n elements.}

\item{relvar2}{(\code{list} of \code{character})\cr List of n elements.}
}
\value{
A vector of n elements.
}
\description{
Verify and initialize related variable values.
For example, \code{relvar_init("Alanine Aminotransferase Measurement", "ALT")}.
}
\keyword{internal}
