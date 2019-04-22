# Function for reading the CFW phenotype data ("CFW_measures.txt") or
# covariate data ("CFW_covariates.txt") from a tab-delimited file.
read.pheno <- function (file)
  read.table(file,sep = "\t",quote = "",stringsAsFactors = FALSE,
             header = TRUE,check.names = FALSE)

# Compare the empirical quantiles of x against the expected values
# under the normal distribution.
check.normal.quantiles <- function (x) {

  # Discard the missing values.
  x <- x[!is.na(x)]
    
  # Transform the observations so that they have zero mean and unit
  # variance.
  x <- (x - mean(x))/sqrt(var(x))
  
  # Create a data frame giving the observed and expected proportion of
  # samples within 1, 2 and 3 standard deviations of the mean.
  return(data.frame(exp = c(pnorm(1) - pnorm(-1),
                            pnorm(2) - pnorm(-2),
                            pnorm(3) - pnorm(-3)),
                    obs = c(mean(-1 < x & x < 1),
                            mean(-2 < x & x < 2),
                            mean(-3 < x & x < 3)),
                    row.names = c("sd1","sd2","sd3")))
}

# Draw a box plot to visualize the relationship between a categorical
# variable x and a continuous variable y.
draw.boxplot <- function (x, y)
  ggplot(data.frame(x = x,y = y),aes(x = x,y = y)) +
  geom_boxplot(width = 0.5,na.rm = TRUE) +
  theme(axis.line = element_blank())

# Draw a quantile-quantile plot comparing the empirical quantiles
# against quantiles expected under the standard normal distribution.
draw.qqplot <- function (x) {

  # Discard the missing values.
  x <- x[!is.na(x)]
    
  # Transform the observations so that they have zero mean and unit
  # variance.
  x <- (x - mean(x))/sqrt(var(x))

  # Create the quantile-quantile plot using ggplot2.
  return(ggplot(data.frame(x = x),aes(sample = x)) +
         geom_abline(intercept = 0,slope = 1,color = "magenta") +
         geom_qq(color = "darkblue") +
         labs(x = "normal quantiles",y = "empirical quantiles") +
         theme(axis.line = element_blank()))
}

# Create a "genomic inflation" plot---simply, the observed negative
# log10 p-values against the expected p-values under the null
# distribution.
plot.inflation <- function (x, size = 2) {

  # Get the number of p-values.
  n <- length(x)
    
  # Compute the negative log10(p-values), and sort them from largest
  # to smallest.
  y <- rev(sort(-log10(x)))

  # Create the q-q plot.
  return(ggplot(data.frame(x = -log10((1:n)/n),y = y),aes(x = x,y = y)) +
         geom_abline(intercept = 0,slope = 1,color = "magenta") +
         geom_point(color = "dodgerblue",shape = 20,size = 2) +
         labs(x = "Expected -log10 p-value",y = "Observed -log10 p-value") +
         theme(axis.line = element_blank()))
}

# Create a Manhattan plot from a data frame containing the results of
# a GEMMA association analysis.
plot.gwscan <- function (gwscan, size = 1) {

  # Add a column with the marker index.
  n      <- nrow(gwscan)
  gwscan <- cbind(gwscan,marker = 1:n)

  # Convert the p-values to the -log10 scale.
  gwscan <- transform(gwscan,p_lrt = -log10(p_lrt))

  # Add column "odd.chr" to the table, and find the positions of the
  # chromosomes along the x-axis.
  gwscan <- transform(gwscan,odd.chr = (chr %% 2) == 1)
  x.chr  <- tapply(gwscan$marker,gwscan$chr,mean)
  
  # Create the genome-wide scan ("Manhattan plot").
  return(ggplot(gwscan,aes(x = marker,y = p_lrt,color = odd.chr)) +
         geom_point(size = size,shape = 20) +
         scale_x_continuous(breaks = x.chr,labels = 1:19) +
         scale_color_manual(values = c("skyblue","darkblue"),guide = "none") +
         labs(x = "",y = "-log10 p-value") +
         theme_cowplot(font_size = 10) +
         theme(axis.line = element_blank(),
               axis.ticks.x = element_blank()))
}

# Create a simple Manhattan plot from a data frame containing the
# results of a GEMMA association analysis, in which p-values are
# plotted against base-pair positions (in Mb).
plot.region.pvalues <- function (gwscan, size = 1) {

  # Convert the p-values to the -log10 scale.
  gwscan <- transform(gwscan,p_lrt = -log10(p_lrt))

  # Convert the positions to the Megabase (Mb) scale.
  gwscan <- transform(gwscan,ps = ps/1e6)
  
  # Create a Manhattan plot.
  return(ggplot(gwscan,aes(x = ps,y = p_lrt)) +
         geom_point(color = "darkblue",size = size,shape = 20) +
         labs(x = "base-pair position (Mb)",y = "-log10 p-value") +
         theme_cowplot(font_size = 10) +
         theme(axis.line = element_blank()))
}
