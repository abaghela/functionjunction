#' @title na2zero
#'
#' @description Turn NAs in a dataframe to zeroes
#'
#' @param dataframe
#'
#' @return dataframe
#'
#' @examples
#' dataset <- matrix(sample(c(NA,1:5), 25, replace = TRUE), 5)
#' df <- as.data.frame(dataset)
#' functionjunction::na2zero(df)
#'
#' @export


na2zero <- function(mat) {

  mat[is.na(mat)] <- 0
  return(mat)
}

