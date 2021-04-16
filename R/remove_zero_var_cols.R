#' @title remove_zero_var_cols
#'
#' @param df
#'
#' @return
#' @export
#'
#' @examples
#' @import caret

remove_zero_var_cols <- function(df){
  df <- as.data.frame(df)
  cols_to_remove <- caret::nearZeroVar(df, names = TRUE)
  df_removed <- df %>% dplyr::select(!one_of(cols_to_remove))
  return(df_removed)
}
