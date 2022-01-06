#! /bin/bash -login
#SBATCH -p bmm
#SBATCH -J dryvalley_depth
#SBATCH -t 4:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=60gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jelumian@ucdavis.edu
#SBATCH -o /home/jemizzi/biogeo/scripts/report/dryvalley_depth.out
#SBATCH -e /home/jemizzi/biogeo/scripts/report/dryvalley_depth.err

# activate conda
. "/home/jemizzi/miniconda3/etc/profile.d/conda.sh"

# activate env
#conda activate anvio-7.1

# set name
name="SRR5855414"

# go to a particular directory
cd /home/jemizzi/biogeo/data

#mkdir 03_binning/${name}

# run will not stop if line fail
set x

# depth commands
#anvi-init-bam 02_mapping/${name}/${name}-RAW.bam -o 02_mapping/${name}/${name}.bam

conda activate biogeo

jgi_summarize_bam_contig_depths --outputDepth 03_binning/${name}/depth.txt 02_mapping/${name}/${name}.bam
