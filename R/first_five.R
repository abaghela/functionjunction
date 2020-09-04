#' @title functionjunction
#'
#' @description Return the first X rows and columns
#'
#' @param matrix
#'
#' @return dataframe
#'
#' @examples
#' functionjunction::first_five(mat)
#'
#' @export

first_five <- function(mat, rows = 5, columns = 5) {
  mat <- as.data.frame(mat)

  mat_rows = nrow(mat)
  mat_cols = ncol(mat)

  if (mat_rows < rows){
    rows = mat_rows
  }
  if (mat_cols < columns){
    columns = mat_cols
  }

  mat <- mat[1:rows,1:columns]
  return(mat)
}
