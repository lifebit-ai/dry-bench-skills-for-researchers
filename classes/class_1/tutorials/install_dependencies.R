options(repos = "https://cloud.r-project.org/")
install.packages("data.table")
install.packages("BiocManager")
BiocManager::install("EnhancedVolcano", update = FALSE)
