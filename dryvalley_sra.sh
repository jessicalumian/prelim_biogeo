#! /bin/bash -login
#SBATCH -J dryvalley_sra
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

# download file
fastq-dump --gzip SRR5855414
