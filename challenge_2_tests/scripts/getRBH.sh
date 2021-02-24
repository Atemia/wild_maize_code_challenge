#!/usr/bin/env bash

# Gets the best hits from reciprocal blast outputs

# Usage execute: bash getRBH.sh 

#Input query blast results file
# queryPath="$1"
# blast_out="../results/blast.out"
queryPath="../results/blast.out"

#Input DB reciprocal blast results file
# dbPath="$2"
# blast_reciprocal="../results/blast_reciprocal.out"​
dbPath="../results/blast_reciprocal.out"

#Final output files
outFileRBH="../results/blast_RBH.txt"
outFileSummary="../results/blast_RBH_summary.txt"

#Add headers to output RBH files
echo "queryHit,dbHit" > ${outFileRBH}
echo "queryHits,dbHits,bestHits" > ${outFileSummary}​

#Output start status message
echo "Recording RBH..."
​
#Loop over query blast results
while IFS=$'\t' read -r f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12
do
	#Determine RBH to DB blast results
	if grep -q "${f2}"$'\t'"${f1}"$'\t' ${dbPath}; then #RBH
		echo "${f1},${f2}" >> ${outFileRBH}
	fi
done < ${queryPath}

#Output summary of RBH
queryHits=$(wc -l "${queryPath}" | cut -d ' ' -f 1)
dbHits=$(wc -l "${dbPath}" | cut -d ' ' -f 1)
bestHits=$(($(wc -l "${outFileRBH}" | cut -d ' ' -f 1)-1))
echo "${queryHits}","${dbHits}","${bestHits}" #>> ${outFileSummary}
​
#Output end status message
echo "Finished recording RBH!"