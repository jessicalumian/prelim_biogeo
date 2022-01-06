#! /bin/bash -login
#SBATCH -p bmm
#SBATCH -J sedch_asm
#SBATCH -t 20:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=60gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jelumian@ucdavis.edu
#SBATCH -o /home/jemizzi/biogeo/scripts/report/sedch_asm.out
#SBATCH -e /home/jemizzi/biogeo/scripts/report/sedch_asm.err

# load fastqc
module load megahit/1.0.6

# go to a particular directory
cd /home/jemizzi/biogeo/data

# run will not stop if line fail
set x

# remove directory before running or job will fail then run
rm -fr 01_megahit/ERR1333181
megahit --12 ERR1333181.fastq.gz -o 01_megahit/ERR1333181
