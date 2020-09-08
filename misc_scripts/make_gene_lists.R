#### Read in gene lists
dir <- "~/my_things/ImportantFiles/Important_Gene_Lists/"
#dir <- "/mnt/analysis1/ImportantFiles/Important_Gene_Lists/"

gene_lists <- list(
  "endotox" = readxl::read_xlsx(paste0(dir,"EndotoxinToleranceSignature_GEx.xlsx"), sheet = "endotox"),
  "inflam" = readr::read_csv(paste0(dir,"InflammatorySignature_GEx.csv")),
  "endotox31" = readr::read_csv(paste0(dir,"Endotox31.csv")),
  "septi" = readr::read_csv(paste0(dir,"septicyteLabSig.csv")),
  "sms" = readr::read_csv(paste0(dir,"11geneSMSsig.txt")),
  "ratio" = readr::read_csv(paste0(dir,"ratioSig.csv")),
  "mars" = readr::read_csv(paste0(dir,"scicluna_mars_genes.csv")),
  #"doubleLPS" = readRDS("../beverlie/double_LPS.RDS"),
  #"de_genes_most_sev" = read_csv("../signature_validation/de_genes_mostsevere_vs_non_sepsis.csv")
  "daven" = readr::read_csv(paste0(dir,"davenport_endotoxinTolerance.csv")),
  "ratio_full" = readr::read_csv(paste0(dir,"ratioSig_full.csv"))
  #"patent_1" = readxl::read_xlsx(paste0(dir,"EndotoxinToleranceSignature_GEx.xlsx", sheet = "patent_1")),
  #"patent_2" = readxl::read_xlsx(paste0(dir,"EndotoxinToleranceSignature_GEx.xlsx", sheet = "patent_2")),
  #"patent_3" =readxl::read_xlsx(paste0(dir,"EndotoxinToleranceSignature_GEx.xlsx", sheet = "patent_3"))

)

#readr::write_rds(gene_lists, "./data/gene_lists.RData")
usethis::use_data(gene_lists)
