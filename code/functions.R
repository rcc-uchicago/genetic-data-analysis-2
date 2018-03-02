# Function for reading the CFW phenotype data ("CFW_measures.txt") or
# covariate data ("CFW_covariates.txt") from a tab-delimited file.
read.flint.pheno <- function (file)
  read.table(file,sep = "\t",quote = "",stringsAsFactors = FALSE,
             header = TRUE,check.names = FALSE)

# TO DO: Explain here what this function does, and how to use it.
plot.dist <- function (x, color = "darkblue")
  qplot(x = x,fill = "constant",bins = 24,show.legend = FALSE,na.rm = TRUE) +
    scale_fill_manual(values = color) +
    theme(axis.line = element_blank())


