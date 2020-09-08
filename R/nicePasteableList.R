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


nicePasteableList <- function (char_vector) {
  return(cat(noquote(as.character(char_vector)), sep = "\n"))
}
