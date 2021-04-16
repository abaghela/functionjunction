# mapGenes maps ensembl gene names to the hgnc name
#' @title mapGenes
#'
#' @param genes
#' @param ID
#' @param mart
#'
#' @return a dataframe
#' @export
#'
#' @examples
#'
#' @import biomart
#' @import magrittr
#' @import dplyr


#mart <- biomaRt::useDataset("hsapiens_gene_ensembl", biomaRt::useMart("ensembl"))
mapGenes <- function(genes, ID = "ensembl_gene_id", mart) {

  if(!(ID %in% c("ensembl_gene_id", "hgnc_symbol","entrezgene_id") )) {
    return(cat("Please choose either: ensembl_gene_id, hgnc_symbol, entrezgene_id.\n"))

  }

  # Perform the mapping with getBM
  geneList <- biomaRt::getBM(filters= ID,
                             attributes= c("ensembl_gene_id", "hgnc_symbol","entrezgene_id",  "description"),
                             values= as.character(genes),
                             mart=mart)

  # Often biomart has multiple mappings to one gene or no mappings to a gene!
  df <- data.frame(V1 = setdiff(as.character(genes), geneList[[ID]] ))
  names(df) <- ID
  geneList %<>% full_join(df)
  geneList <- geneList[match(as.character(genes), geneList$ensembl_gene_id),]
  return(geneList)

  }
