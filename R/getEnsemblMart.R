#' Title
#'
#' @return
#' @export
#'
#' @examples

getEnsemblMart <- function() {
  # This must be run prior to running mapGenes()
  mart <- biomaRt::useDataset("hsapiens_gene_ensembl", biomaRt::useMart("ensembl"))
  return(mart)

}
