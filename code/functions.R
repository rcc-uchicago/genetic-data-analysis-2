# Function for reading the CFW phenotype data ("CFW_measures.txt") or
# covariate data ("CFW_covariates.txt") from a tab-delimited file.
read.pheno <- function (file)
  read.table(file,sep = "\t",quote = "",stringsAsFactors = FALSE,
             header = TRUE,check.names = FALSE)

# Visualize the empirical distribution of x using a histogram. Adjust
# inputs "bins" and "color" as needed to improve the plot.
plot.dist <- function (x, bins = 24, color = "darkblue")
  ggplot(data.frame(x),aes(x)) +
    geom_histogram(bins = bins,fill = color,na.rm = TRUE) +
    theme(axis.line = element_blank())
      
