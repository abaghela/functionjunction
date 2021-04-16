#' @title reactome_pathway_enrichment
#'
#' @param gene_list
#' @param background_genes
#' @param p_val
#'
#' @return
#' @export
#'
#' @examples
#' @import dplyr
#' @import stringr

reactome_pathway_enrichment <- function(gene_list, background_genes, p_val = 0.05) {

  # Set res to NULL
  res <- NULL

  # Check if the gene list is empty
  if(length(gene_list) == 0){
    return(res)
  }

  gene_list = na.omit(gene_list)
  background_genes = na.omit(background_genes)

  # Get results
  tryCatch({
    res <- ReactomePA::enrichPathway(gene = as.character(gene_list),
                                     universe = as.character(background_genes))@result},
    error = function(e){cat("ERROR :", conditionMessage(e), "\n")}
    )

  if (is.null(res)){
    return(res)
  } else {
    res <- res %>%
      dplyr::mutate(geneID = stringr::str_split(geneID, pattern = "/")) %>%
      dplyr::filter(p.adjust <= p_val)
    return(res)
  }
}
