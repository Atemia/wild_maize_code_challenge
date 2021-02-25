#!/usr/bin/env bash
# This scripts downloads the a complete genome and CDS of Nostoc punctiforme PCC 73102 and Nostoc commune HK-02.
# It also genrates a query subject using the first 100 genes of the Nostoc commune HK-02 CDS

# Download the full genome to the data directory # Nostoc punctiforme PCC 73102
wget https://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/Nostoc_punctiforme/latest_assembly_versions/GCF_000020025.1_ASM2002v1/GCF_000020025.1_ASM2002v1_genomic.fna.gz -P ../data 

gzip -d ../data/GCF_000020025.1_ASM2002v1_genomic.fna.gz # unzip the ref genome


# Download subject CDS to the data directory # Nostoc commune HK-02
wget https://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/Nostoc_commune/latest_assembly_versions/GCF_003113895.1_ASM311389v1/GCF_003113895.1_ASM311389v1_cds_from_genomic.fna.gz -P ../data

gzip -d ../data/GCF_003113895.1_ASM311389v1_cds_from_genomic.fna.gz # unzip the subject

#rm -f ../data/*.gz # remove the compresed files

# Extarcting 100 CDS from the subject
echo "Extarcting 100 CDS from Nostoc commune HK-02 CDS .... "

mkdir ../data/.temp # make a temporary folder for the dirty work

grep  "^>" ../data/GCF_003113895.1_ASM311389v1_cds_from_genomic.fna > ../data/.temp/all_genes_in_subject.txt # get all the CDS headers

head -n 100 ../data/.temp/all_genes_in_subject.txt > ../data/.temp/100_genes_subject # get a list the fist 100 genes 

cds_file=../data/GCF_003113895.1_ASM311389v1_cds_from_genomic.fna

id_101="$(head -n 101 ../data/.temp/all_genes_in_subject.txt | tail -n 1 | cut -f 1 -d " ")" #get the full header of the sequence then extract the id number only

count_line=0 # intitialize a counter

while IFS=$" " read -r f1 f2
do  
    let count_line++
    # # echo ${f1}
    if [ "${f1}" == "${id_101}" ] ; then # find matching line in the complete CDS file the 101st gene id  
        #echo "${count_line}"
        #echo "${f1}"
        position_gene101=${count_line} # get the position of the 101st gene in the file
        break

    fi    
done < ${cds_file}

head -n $(expr ${position_gene101} - 1) ${cds_file} > ../data/query_Nostoc_commune_HK-02_100_genes.fa # subtract 1 from the last line to retain only the first 100 genes then extarct the genes from the CDS file

rm -rf ../data/.temp # remove the temporary file

echo "Done ..."