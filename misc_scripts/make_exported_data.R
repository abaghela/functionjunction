# Reactome pathway hierarchy
react_pthwy_hier <- readr::read_csv("/mnt/analysis1/ImportantFiles/Human/enr_pathway_highest_level_clean_names.csv")
usethis::use_data(react_pthwy_hier, overwrite = TRUE)

#### Read in gene lists (ET/Inflam)
dir <- "/mnt/analysis1/ImportantFiles/Important_Gene_Lists/"

gene_lists <- list(
  "endotox" = readxl::read_xlsx(paste0(dir,"EndotoxinToleranceSignature_GEx.xlsx"), sheet = "endotox"),
  "inflam" = readr::read_csv(paste0(dir,"InflammatorySignature_GEx.csv")),
  "endotox31" = readr::read_csv(paste0(dir,"Endotox31.csv"))
)
usethis::use_data(gene_lists, overwrite = TRUE)
