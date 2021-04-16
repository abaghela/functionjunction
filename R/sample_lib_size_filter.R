#' @title sample_lib_size_filter
#'
#' @param expr
#' @param min_lib_size
#'
#' @return
#' @export
#'
#' @examples

sample_lib_size_filter <- function(expr_mat, min_lib_size = 1000000) {
  low_lib_size = colSums(expr_mat) >= min_lib_size
  return(expr_mat[,low_lib_size])
}
