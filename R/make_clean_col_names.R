#' @title make_clean_col_names
#'
#' @param df
#'
#' @return df
#' @export
#'
#' @examples
#' @import janitor
make_clean_col_names <- function(df) {
  colnames(df) <- colnames(df) %>% janitor::make_clean_names()
  return(df)
}
