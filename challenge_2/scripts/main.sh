#!/usr/bin/env bash
# Rebuilding virtual env, activate the conda environment for reproducibility
conda env create -n blast -f blast.yml; conda activate blast 

# Data retrival
bash getData.sh

# Performing blast and RBH blast
bash blastR_ex.sh

# Filters reciprocal blast results for best hits
bash getRBH.sh