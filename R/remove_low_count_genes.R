#' @title remove_low_count_genes
#'
#' @param expr
#' @param no_genes
#'
#' @return
#' @export
#'
#' @examples

remove_low_count_genes <- function(expr_mat, no_genes = 10) {
  low_count_genes =  rowSums(expr_mat)/ncol(expr_mat) > no_genes
  expr_filt <- expr_mat[low_count_genes,]
  return(expr_filt)
}
