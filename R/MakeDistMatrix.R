#' Distance matrix from data.table
#'
#' Makes a named distance matrix from a data.table of (x, y, distance(x, y)).
#'
#' @param dt a data.table
#' @param id.x String, name of identifier column x
#' @param id.y String, name of identifier column y
#' @param value.cn name of column with distances
#'
#' @return
#' `dm`  Named distance `matrix`.
#'
#' @export
#'
#' @examples
MakeDistMatrix <- function(dt, id.x, id.y, value.cn = "distance") {
  formula <- paste(id.x, "~", id.y)
  dm <- data.table::dcast(dt, formula, value.var = value.cn)
  rn <- dm[, get("id.x")]
  dm <- as.matrix(dm[, -1])
  rownames(dm) <- rn
  dm
}
