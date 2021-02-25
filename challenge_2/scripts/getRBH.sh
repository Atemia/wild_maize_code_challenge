#!/usr/bin/env bash

# This scripts gets the best hits from reciprocal blast outputs

# Usage execute: bash getRBH.sh 

echo "RBH Statistics recording ..."
# Input the Query blast results file
# blast_query="$1" 										# for automation
blast_query="../results/blast.out"

# Input the reciprocal blast results file
# blast_reciprocal="$2"									# for automation
# blast_reciprocal="../results/blast_reciprocal.out"​
blast_reciprocal="../results/blast_reciprocal.out"

# Final output file
RBH_final_out="../results/blast_RBH.txt"

# Loop over query blast results
while IFS=$'\t' read -r f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12
do
	#RBH to DB blast results
	if grep -q "${f2}"$'\t'"${f1}"$'\t' ${blast_reciprocal}; then #RBH by comparing the blast.out and reciprocal the blast outputs 
		echo -e "${f1}\t${f2}" >> ${RBH_final_out} 
	fi
done < ${blast_query}

# Add headers to output RBH file
echo -e 'Query_Hit\tData_base_Hit' | cat - ${RBH_final_out} > temp && mv temp ${RBH_final_out}

echo "RBH Statistics recording Done!"
echo "All results are found in the results directory: access by running, cd ../results"