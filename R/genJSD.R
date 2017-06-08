#' Generalized Jensen-Shannon divergence
#'
#' Generalized Jensen-Shannon divergence from matrix.
#'
#' @param x Matrix where each column is a discrete/binned probability distribution
#' (doesn't have to be normalized)
#' @param w weights of distributions, length must == ncol(x)
#'
#' @return JSD of all distribs in x
# library(Matrix)
genJSD <- function(x, w = NULL) {
  library(entropy)
  # try to coerce x to a matrix
  if (!(class(x) %in% c("matrix", "dgeMatrix"))) {
    x <- as.matrix(x)
  }
  n <- ncol(x)
  if (is.null(w)) {
    w <- rep(1 / n, n)
  }
  # normalization
  x <- sweep(x, 2, colSums(x), FUN="/")
  # weighted sum of distributions
  wsum <- rowSums(x %*% w)
  # weighted entropy of distributions
  Hi <- sapply(1:n, function(i) {
    return(entropy.plugin(x[, i], unit = "log2"))
    })
  # the second term returns 1x1 matrix; as.numeric converts to scalar
  jsd <- entropy.plugin(wsum, unit = "log2") - as.numeric(Hi %*% w)
  return(jsd)
}