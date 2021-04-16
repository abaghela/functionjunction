# # Read in Mart
# mart <- biomaRt::useDataset("hsapiens_gene_ensembl", biomaRt::useMart("ensembl"))
#
# # Read in Genes
# gtf_cols <- c("seqname", "source", "feature", "start", "end","score", "strand", "frame", "attribute")
# gtf <- readr::read_tsv("~/my_things/ImportantFiles/Human/Homo_sapiens.GRCh38.92.gtf", col_names = gtf_cols)
# gtf_clean <- gtf %>%
#   dplyr::filter(feature == "CDS") %>%
#   tidyr::separate(
#     attribute,
#     into = c("gene_id", "transcript_id", "locus_tag", "name", "ref"),
#     sep = ";"
#   )
# gtf_clean$gene_id %>% stringr::str_remove("gene_id ") %>% head()
#
#
# # mapStuff maps ensembl gene names to the hgnc name
# mapStuff <- function(genes, ID) {
#   if (ID == "ensembl"){
#     geneList <- biomaRt::getBM(filters= "ensembl_gene_id", attributes= c("ensembl_gene_id", "hgnc_symbol","entrezgene_id",  "description"),values= as.character(genes),mart=mart)
#     temp <- data.frame(ensembl_gene_id= setdiff(as.character(genes), geneList$ensemble_gene_id))
#     geneList %<>% full_join(temp)
#     rm(temp)
#     geneList <- geneList[match(as.character(genes), geneList$ensembl_gene_id),]
#     return(geneList)
#   }
#   if (ID == "hgnc") {
#     geneList <- biomaRt::getBM(filters= "hgnc_symbol", attributes= c("ensembl_gene_id","hgnc_symbol", "entrezgene_id", "description"),values= as.character(genes),mart=mart)
#     temp <- data.frame(hgnc_symbol= setdiff(as.character(genes), as.character(geneList$hgnc_symbol)))
#     geneList %<>% full_join(temp)
#     rm(temp)
#     geneList <- geneList[match(as.character(genes), geneList$hgnc_symbol),]
#     return(geneList)
#   }
#   if (ID == "entrez") {
#     geneList <- biomaRt::getBM(filters= "entrezgene_id", attributes= c("ensembl_gene_id","hgnc_symbol", "entrezgene_id", "description"),values= as.integer(genes),mart=mart)
#     temp <- data.frame(entrezgene= setdiff(as.integer(genes), as.integer(geneList$entrezgene)))
#     geneList %<>% full_join(temp)
#     rm(temp)
#     geneList <- geneList[match(as.integer(genes), geneList$entrezgene),]
#     return(geneList)
#   }
# }
#
#
# universe = samples_lib_filt_no_low_count_filt$samples_merged$ensembl_gene_id %>% mapStuff(ID = "ensembl")
# universe %>% write_rds("./counts/universe.rds")
