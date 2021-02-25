#!/usr/bin/env bash

# The Script performs a reciprocal blast search

# Usage execute: bash blast_ex.sh


#Input Query file
#subject="$1"
subject="../data/query_Nostoc_commune_HK-02_100_genes.fa"

#Input DB reciprocal file
# refDB="$2"
refDB="../data/GCF_000020025.1_ASM2002v1_genomic.fna"

#Path to output results
# outputPath="$3"
outputPath="../results/"

# create blast db for both the reference and subject sequences
echo "Creating a database of our reference sequence and the subject ... ️ ⚙️"

makeblastdb -in ${refDB} -dbtype nucl

makeblastdb -in ${subject} -dbtype nucl

echo -e "\nDone ✅\n"

# running Reciprocal BLAST. blastn to search nucleotide database
echo -e "Running Reciprocal blast ..."

blastn -db ${refDB} -query ${subject} -outfmt 6 -evalue 1e-3 -out ${outputPath}blast.out

blastn -db ${subject} -query ${refDB} -outfmt 6 -evalue 1e-3 -out ${outputPath}blast_reciprocal.out

echo -e "\nDone ✅ \n"