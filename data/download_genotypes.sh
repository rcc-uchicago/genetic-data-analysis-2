#!/bin/bash

# Script to download the genotype files that are used for the
# genome-wide association analyses. These files are large, so it may
# 10 minutes, or longer, depending on the speed of your Internet
# connection.

BASEURL=http://mtweb.cs.ucl.ac.uk/dosages

for (( i=1 ; i <= 19 ; i++ )); do
  wget ${BASEURL}/chr${i}.prunedgen.final.maf001.0.98.RData
done
