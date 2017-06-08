#' Make list of non-redundant (non-reciprocal) pairings
#'
#' Given list of things, return data.table of non-redundant pairs between
#' things (including self-self).
#'
#' @param things vector of things
#' @param prefix string, prefix of column names (e.g. "thing")
#' @param suffix character length 2, suffix of column names (usually c("i", "j"), e.g.)
#' @param sep separator joining prefix and suffix (e.g. ".")
#'
#' @return data.table with thing i in one column and thing j in another
#' @export
#'
#' @examples
MakeNonRedundantPairs <- function(things, prefix = "thing",
                                  suffix = c("i", "j"), sep = ".") {
  library(data.table)
  N <- length(things)
  x <- lapply(1:N, function(n) {
    if (n == 1) {
      j <- things
    } else {
      j <- things[-seq(n - 1)]
    }
    out <- data.table(i = things[n], j = j)
    setnames(out, paste(prefix, suffix, sep = sep))
    out
  })
  x <- rbindlist(x)
  x
}