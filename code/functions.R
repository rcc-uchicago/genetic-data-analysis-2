# Function for reading the CFW phenotype data ("CFW_measures.txt") or
# covariate data ("CFW_covariates.txt") from a tab-delimited file.
read.pheno <- function (file)
  read.table(file,sep = "\t",quote = "",stringsAsFactors = FALSE,
             header = TRUE,check.names = FALSE)

# Visualize the empirical distribution of x using a histogram. Adjust
# inputs "bins" and "color" as needed to improve the plot.
plot.dist <- function (x, bins = 24, color = "darkblue")
  ggplot(data.frame(x),aes(x),environment = environment()) +
    geom_histogram(bins = bins,fill = color,na.rm = TRUE) +
    theme(axis.line = element_blank())
      
# Draw a scatterplot to visualize the relationship between two
# continuous variables, x and y. The best linear fit between x and y is
# shown as a line in the scatterplot.
draw.scatterplot <- function (x, y, size = 2) {
  dat <- data.frame(x = x,y = y)
  fit <- lm(y ~ x,dat)
  return(ggplot(dat,aes(x = x,y = y),environment = environment()) +
         geom_point(color = "darkblue",size = size,shape = 20,na.rm = TRUE) +
         geom_abline(intercept = coef(fit)["(Intercept)"],
                     slope = coef(fit)["x"],color = "magenta",size = 1) +
         theme(axis.line = element_blank()))
}

# Draw a box plot to visualize the relationship between a discrete
# variable x and a continuous variable y.
draw.boxplot <- function (x, y)
  ggplot(data.frame(x = x,y = y),aes(x = x,y = y)) +
  geom_boxplot(width = 0.5,na.rm = TRUE) +
  theme(axis.line = element_blank())

  
