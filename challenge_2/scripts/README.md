# Scripts Directory
> To run all the scripts using one command 
make the scripts executable and run the main script
execute: `chmod +x *.sh ; bash main.sh`

> `The main.sh` Contains four scripts (outlined below) which performs all the RBH analysis
- `conda env create -n blast -f blast.yml; conda activate blast` Rebuilding virtual env, activate the conda environment for reproducible analysis

- `getData.sh` Retrieves data (already predetermined within the script) from NCBI and subsets the subject (100 genes) for querying.

- `blastR_ex.sh` Performs blast and RBH blast analysis for the data retrieved

- `bash getRBH.sh` Filters reciprocal blast results for best hits

> NB: Scritps should be ran from the script directory