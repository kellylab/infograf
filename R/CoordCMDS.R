#' 2D layout coordinates with classical multidimensional scaling (PCoA)
#'
#' Converts distance matrix to x, y coordinates using classical MDS.
#' Returns coordinates in a data.table and optionally eigenvalues.
#' AKA principle coordinates analysis.
#'
#' @param dm Distance matrix, must have row and column names.
#' @param eig Return eigenvalues?
#' @param ... Passed to `cmdscale`
#'
#' @return
#' If `eig`, list with point coordinates (`points`) and ranked eigenvalues (`eigrank`).
#' Otherwise just the coordinates. All as data.tables.
#'
#' @export
#'
#' @examples
CoordCMDS <- function(dm, eig = TRUE, ...) {
  fit <- cmdscale(dist(dm), eig = eig, ...)
  xform <- fit$points
	eigrank <- data.frame(rank = seq(length(fit$eig)), value = fit$eig)
  colnames(xform) <- c("x", "y")
  rn <- rownames(xform)
	xform <- as.data.frame(xform)
	xform$sample <- rn
  if (eig) {
    list(points = xform, eigrank = eigrank)
  } else {
    xform
  }
}
