#!/usr/bin/env bash
# Rebuilding virtual env, activate the conda environment for reproducibility (Functions are not exported by default to be made available in subshells therefore has to be done outside this script)
# conda env create -n blast -f blast.yml
# source activate blast

# Data retrival
bash getData.sh

# Performing blast and RBH blast
bash blastR_ex.sh

# Filters reciprocal blast results for best hits
bash getRBH.sh