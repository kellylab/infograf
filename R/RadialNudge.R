#' Nudge nodes of circular graph outward
#'
#' Given a circular ggraph layout, radially project the nodes outward.
#' Allows you to create radial layers or 'shells' of the same nodes formatted
#' different ways to show different data features.
#' Should you want to do such a crazy thing.
#'
#' @param layout a ggraph layout with circular = TRUE
#' @param dr the amount by which to project nodes outward
#'
#' @return the same layout with all nodes projected outward
#' @export
#'
#' @examples
RadialNudge <- function(layout, dr) {
  coord <- select(layout, x, y)
  coord <- mutate(coord, theta = atan2(y, x))
  coord <- mutate(coord, x = x + dr * cos(theta), y = y + dr * sin(theta))
  # dendrogram to igraph and back again
  layout <- create_layout(den_to_igraph(layout), "manual",
                          node.positions = coord
                          )
  return(layout)
}