#! /bin/bash -login
#SBATCH -p bmm
#SBATCH -J neolepto_asm
#SBATCH -t 60:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=120gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jelumian@ucdavis.edu
#SBATCH -o /home/jemizzi/biogeo/scripts/report/neolepto_asm.out
#SBATCH -e /home/jemizzi/biogeo/scripts/report/neolepto_asm.err

# load fastqc
module load megahit/1.0.6

# go to a particular directory
cd /home/jemizzi/biogeo/data

# run will not stop if line fail
set x

genome="SRR5468153"

# remove directory before running or job will fail then run
rm -fr 01_megahit/${genome}
megahit --12 ${genome}.fastq.gz -o 01_megahit/${genome}
