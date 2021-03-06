% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CoordCMDS.R
\name{CoordCMDS}
\alias{CoordCMDS}
\title{2D layout coordinates with classical multidimensional scaling (PCoA)}
\usage{
CoordCMDS(dm, eig = TRUE, ...)
}
\arguments{
\item{dm}{Distance matrix, must have row and column names.}

\item{eig}{Return eigenvalues?}

\item{...}{Passed to `cmdscale`}
}
\value{
If `eig`, list with point coordinates (`points`) and ranked eigenvalues (`eigrank`).
Otherwise just the coordinates. All as data.tables.
}
\description{
Converts distance matrix to x, y coordinates using classical MDS.
Returns coordinates in a data.table and optionally eigenvalues.
AKA principle coordinates analysis.
}
