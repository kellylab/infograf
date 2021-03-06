% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/genJSD.R
\name{genJSD}
\alias{genJSD}
\title{Generalized Jensen-Shannon divergence}
\usage{
genJSD(x, w = NULL)
}
\arguments{
\item{x}{Matrix where each column is a discrete/binned probability distribution
(doesn't have to be normalized)}

\item{w}{weights of distributions, length must == ncol(x)}
}
\value{
JSD of all distribs in x
}
\description{
Generalized Jensen-Shannon divergence from matrix.
}
