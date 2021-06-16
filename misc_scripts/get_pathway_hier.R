library(tidyverse)
library(magrittr)

# Read in pathwy hierarchy and pathway names
pathwy_hier <- read_tsv("/mnt/analysis1/ImportantFiles/Human/ReactomePathwaysRelation.txt", col_names = c("higher", "pathwy.id"))
pathwy_hier %<>% 
  dplyr::filter(grepl("HSA", higher)) %>% 
  dplyr::filter(grepl("HSA", pathwy.id)) 
pathwy_names <- read_tsv("/mnt/analysis1/ImportantFiles/Human/ReactomePathways.txt", col_names = c("pathwy.id", "description", "organism")) %>% 
  filter(grepl("HSA", pathwy.id)) %>% 
  dplyr::select(-one_of("organism"))

# Get function to join and rename 
pathwy_join <- function(input, name) {
  nam <- name
  p <- left_join(input, pathwy_hier) %>% 
    dplyr::rename(!!nam := "pathwy.id", pathwy.id = "higher") 
  return(p)
}

full_hier <- pathwy_names %>% 
  dplyr::select(one_of("pathwy.id")) %>% 
  pathwy_join(name = "enr_pathway")

for (i in 1:11) {
  names <- as.character(english::as.english(i))
  full_hier %<>% pathwy_join(name = names)
}
length(na.omit(full_hier$pathwy.id))
full_hier %<>% dplyr::select(-one_of("pathwy.id"))

enr_pathwy_high_level <- data.frame()
for (row in 1:nrow(full_hier)) {
  p <- na.omit(as.character(full_hier[row,]))
  
  how_deep <- length(p)
  
  if (how_deep >=3) {
    p <- data.frame(enr_pathway = p[1], one_lower_level = p[length(p)-1], top_level = p[length(p)] )
    enr_pathwy_high_level <- bind_rows(enr_pathwy_high_level, p)
  } else {
    p <- data.frame(enr_pathway = p[1], one_lower_level = p[1], top_level = p[length(p)] )
    enr_pathwy_high_level <- bind_rows(enr_pathwy_high_level, p)
  }
}

# Get descriptions
enr_pathwy_high_level %<>% 
  left_join(pathwy_names, by = c("enr_pathway" = "pathwy.id")) %>% 
  dplyr::rename(enr_pathway_descrip = "description") %>% 
  left_join(pathwy_names, by = c("one_lower_level" = "pathwy.id")) %>% 
  dplyr::rename(one_lower_level_pathway_descrip = "description") %>% 
  left_join(pathwy_names, by = c("top_level" = "pathwy.id")) %>% 
  dplyr::rename(top_level_pathway_descrip = "description")
  
full_hier %>% write_csv("/mnt/analysis1/ImportantFiles/Human/pathway_hierarchy_full.csv")
enr_pathwy_high_level %>% write_csv("/mnt/analysis1/ImportantFiles/Human/enr_pathway_highest_level.csv")

