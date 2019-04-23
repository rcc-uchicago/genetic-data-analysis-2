# This script prepares the genotype data for association analysis in
# GEMMA. Preparing the genotype data involves these three steps:
#
#   1. Load the genotype data from the .RData file.
#
#   2. Write the SNP positions to a text file in the "SNP annotation"
#      format used by GEMMA.
#
#   3. Align the columns of the genotype matrix to the rows of the
#      phenotype data table (we use the ids in
#      listof1934miceusedforanalysis.txt).
#
#   4. Write the genotypes to the "BIMBAM" format used by GEMMA.
#
library(stringr)

# Load the list of 1,934 samples that were used in Nicod et al,
# 2016. 
ids <- read.table("listof1934miceusedforanalysis.txt",
                  stringsAsFactors = FALSE)[[1]]

# Repeat for each autosomal chromosome.
for (i in 6) {
  cat(sprintf("chromosome %d\n",i))

  # Load the genotype data from the .RData file.
  cat(" - Loading genotype data from .RData file.\n")
  input.file <- sprintf("chr%d.prunedgen.final.maf001.0.98.RData",i)
  load(input.file)

  # Write the marker positions in a space-delimited text file with one
  # row for each marker, and three columns: (1) marker id, (2)
  # base-pair position, and (3) chromosome. See p. 12 of the GEMMA
  # manual for more information about this file. Here, since the SNP
  # id is not provided, we enter a dummy id of the form snp-X-Y, where
  # X is the chromosome and Y is the base-pair position.
  map.file <- sprintf("chr%02d.map.txt",i)
  cat(" - Writing marker positions to",map.file,"\n")
  pruned_pos$CHR <- i
  pruned_pos     <- transform(pruned_pos,ID = paste("snp",CHR,POS,sep = "-"))
  write.table(pruned_pos[c("ID","POS","CHR")],map.file,sep = " ",
              quote = FALSE,row.names = FALSE,col.names = FALSE)

  # Align the columns of the genotype matrix so that they match up with
  # the 1,934 selected ids.
  geno.ids       <- unlist(nameList)
  geno.ids       <- str_replace(geno.ids,fixed("___"),"/")
  geno.ids       <- str_replace(geno.ids,fixed("_recal.reheadered.bam"),"")
  cols           <- match(ids,geno.ids)
  pruned_dosages <- pruned_dosages[,cols]
  
  # Write the mean genotypes ("dosages") as a space-delimited text
  # file in the format used by GEMMA, in which we have one row per
  # marker, and one column per sample (mouse). The first three columns
  # give the marker id, and the two alleles (here we give the
  # alternative allele first, but this isn't required).
  #
  # For some reason the dosages were stored as numbers between 0 and
  # 1, but ordinarily, for diploid organisms, the dosages would be
  # stored as numbers between 0 and 2, representing an expected allele
  # count. It appears that these are the expected counts of the
  # ALTERNATIVE allele (to be certain, we would have to contact the
  # authors to make sure, or see if this information is given
  # somewhere in the paper).
  geno.file <- sprintf("chr%02d.geno.txt",i)
  cat(" - Writing genotype data to",geno.file,"\n")
  pruned_dosages <- 2 * pruned_dosages
  pruned_dosages <- as.data.frame(pruned_dosages,check.names = FALSE)
  pruned_dosages <- round(pruned_dosages,digits = 3)
  pruned_dosages <- cbind(pruned_pos[c("ID","ALT","REF")],pruned_dosages)
  write.table(pruned_dosages,geno.file,sep = " ",quote = FALSE,
              row.names = FALSE,col.names = FALSE)
}
