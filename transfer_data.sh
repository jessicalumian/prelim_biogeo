#! /bin/bash -login
#SBATCH -p bmm
#SBATCH -J transfer_data
#SBATCH -t 1-0:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=30gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jelumian@ucdavis.edu

# load sra toolkit
module load sratoolkit

# go to a particular directory
cd /home/jemizzi/biogeo/data

# run will not stop if line fail
set x

# download files 
# microcoleus
#fastq-dump --gzip SRR855414
#fastq-dump --gzip SRR5855413
#fastq-dump --gzip SRR2952554
#fastq-dump --gzip SRR5247052
#fastq-dump --gzip ERR3588763
fastq-dump --gzip SRR5891573
#fastq-dump --gzip SRR10953298
#fastq-dump --gzip ERR1333181
fastq-dump --gzip SRR5459769
fastq-dump --gzip SRR6048908
fastq-dump --gzip SRR12473531
#fastq-dump --gzip ERR3192241

# phormidium
fastq-dump --gzip SRR7528444
fastq-dump --gzip SRR5216658
fastq-dump --gzip SRR7428116

# pseudanabaena
#fastq-dump --gzip SRR6266338
#fastq-dump --gzip SRR5829599

# neosynechococcus and leptolyngbya (same data set)
#fastq-dump --gzip SRR5468153
