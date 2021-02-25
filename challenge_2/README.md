# Challenge Two - Applied bioinformatics
> Task
Download any two Nostoc bacterial genomes ​from NCBI​, use one complete genome (the “reference”) and of the other only a small fraction e.g. one hundred genes (the “subject”). Write a simple pipeline that identifies the RBH for the “subject” genes.

> To esnsure reprodicibility conda was used.

* Rebuilding virtual env, activate the conda environment for reproducibility (Functions are not exported by default to be made available in subshells therefore has to be done outside this script)

* Within this directoty, run the following commands to replicate and activate my virtual environment. 
    `conda env create -n blast -f blast.yml`

    `source activate blast`


> Answers 
- Navigate to the script directory `cd scripts`
- Run `chmod +x *.sh ; bash main.sh` to activate clone the virtual environment containing all software and perform the analysis
- All the results will be stored in the results directory

> NB: Scritps should be ran from the script directory

> If Miniconda is not installed, instalation can be done using the commands below

1. [Download Miniconda](https://www.anaconda.com/download/) for your specific OS to your home directory
    - Linux: `wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh`
    - Mac: `curl https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh`
2. Run:
    - `bash Miniconda3-latest-Linux-x86_64.sh`
    - `bash Miniconda3-latest-MacOSX-x86_64.sh`
3. Follow all the prompts: if unsure, accept defaults
4. Close and re-open your terminal
5. If the installation is successful, you should see a list of installed packages with
    - `conda list`
If the command cannot be found, you can add Anaconda bin to the path using:
    ` export PATH=~/miniconda3/bin:$PATH`
