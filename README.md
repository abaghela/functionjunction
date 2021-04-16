# functionjunction

This package incudes functions I commonly use to wrangle and analyze data, particularly genomic and sequencing data. 

Functions can be used to:
- Perform miscellaneous tasks
    - remove low variance columns in a dataframe
    - make clean column names
    - convert NAs to zero
    - output characters in a vector to new lines such that it can be copy and pasted
    
- Process raw expression (count) matrices
    - remove low count genes 
    - remove low count samples

- Convert gene symbols using biomart

- Perform functional enrichment
    - Reactome pathway enrichment using ReactomePA
    - MsigDB gene set enrichment using EnrichR
