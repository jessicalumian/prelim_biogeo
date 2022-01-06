#! /bin/bash -login
#SBATCH -p bmm
#SBATCH -J glaciersnw_asm
#SBATCH -t 60:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=60gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jelumian@ucdavis.edu
#SBATCH -o /home/jemizzi/biogeo/scripts/report/glaciersnow_asm.out
#SBATCH -e /home/jemizzi/biogeo/scripts/report/glaciersnow_asm.err

# load fastqc
module load megahit/1.0.6

# go to a particular directory
cd /home/jemizzi/biogeo/data

# set name
name="SRR5891573"

# run will not stop if line fail
set x

# remove directory before running or job will fail then run
rm -fr 01_megahit/${name}
megahit -r ${name}.fastq.gz -o 01_megahit/${name}
