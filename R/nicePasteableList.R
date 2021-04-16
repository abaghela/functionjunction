#' @title functionjunction
#'
#' @description Return a vector into list form.
#'
#' @param character
#'
#' @return character
#'
#' @examples
#' functionjunction::nicePasteableList(char_vector)
#'
#' @export


nicePasteableList <- function (c_vector) {
  return(cat(noquote(as.character(c_vector)), sep = "\n"))
}
