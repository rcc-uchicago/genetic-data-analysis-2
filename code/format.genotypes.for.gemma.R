# TO DO: Explain here what this script does, and how to use it.

# Repeat for each autosomal chromosome.
for (i in 1:19) {
  cat(sprintf("chromosome %d\n",i))

  # Load the genotype data from the .RData file.
  input.file <- sprintf("../data/chr%d.prunedgen.final.maf001.0.98.RData",i)
  load(input.file)

  # Write the marker positions in a space-delimited text file with one
  # row for each marker, and three columns: (1) marker id, (2)
  # base-pair position, and (3) chromosome. See p. 12 of the GEMMA
  # manual for more information about this file. Here, since the SNP
  # id is not provided, we enter a dummy id of the form snp-X-Y, where
  # X is the chromosome and Y is the base-pair position.
  map.file <- sprintf("../data/chr%02d.map.txt",i)
  cat(" - Writing marker positions to",map.file,"\n")
  pruned_pos$CHR <- i
  pruned_pos     <- transform(pruned_pos,ID = paste("snp",CHR,POS,sep = "-"))
  write.table(pruned_pos[c("ID","POS","CHR")],map.file,sep = " ",
              quote = FALSE,row.names = FALSE,col.names = FALSE)

  # Write the mean genotypes ("dosages") as a space-delimited text
  # file in the format used by GEMMA, in which we have one row per
  # marker, and one column per sample (mouse). The first three columns
  # give the marker id, and the two alleles (here we give the
  # alternative allele first, but this isn't required).
  #
  # For some reason the dosages were stored as numbers between 0 and
  # 1, but ordinarily, for diploid organisms, the dosages would be
  # stored as numbers between 0 and 2, representing the expected
  # allele count. (Here, it isn't clear if this gives the count of the
  # alternative or reference allele, because they did not document
  # this. Typically these are the alternative or minor allele counts,
  # but we would have to contact the authors to make sure, or see if
  # this information is given somewhere in the paper.)
  geno.file <- sprintf("../data/chr%02d.geno.txt",i)
  cat(" - Writing genotype data to",geno.file,"\n")
  pruned_dosages <- 2 * pruned_dosages
  pruned_dosages <- as.data.frame(pruned_dosages,check.names = FALSE)
  pruned_dosages <- round(pruned_dosages,digits = 3)
  pruned_dosages <- cbind(pruned_pos[c("ID","ALT","REF")],pruned_dosages)
  write.table(pruned_dosages,geno.file,sep = " ",quote = FALSE,
              row.names = FALSE,col.names = FALSE)

}
