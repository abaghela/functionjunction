#' @title remove_na_rows_cols
#'
#' @param df
#' @param col_perc_max
#' @param row_perc_max
#'
#' @return
#' @export
#'
#' @examples
#' @import purrr


remove_na_rows_cols <- function(df, col_perc_max = 10, row_perc_max = 10) {
  # Filter columnns first
  keep_cols <- df %>%
    map(~sum(is.na(.x))/length(.x)) %>%
    map(~.x*100) %>%
    purrr::keep(~.x <= col_perc_max) %>%
    names()

  # Filter rows now
  keep_rows <- (rowSums(is.na(df))/ncol(df))*100 < row_perc_max

  df_filt <- df[keep_rows,keep_cols]
  return(df_filt)
}
