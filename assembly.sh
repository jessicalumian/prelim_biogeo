#!/bin/bash -l
#
#SBATCH --job-name=metagenome_dryvalley.sh
#SBATCH -t 4:00:00
#SBATCH --mem=32768
#SBATCH -o /home/jemizzi/rotation-project/scripts/error-output-reports/megahit-metagenome.sh.metagenome.out
#SBATCH -e /home/jemizzi/rotation-project/scripts/error-output-reports/megahit-metagenome.sh.metagenome.err
#SBATCH --mail-user=jelumian@ucdavis.edu
#SBATCH --mail-type=ALL

module load megahit/1.0.6-hotfix1

# note - make sure existing output directory, ie /megahit-assembly, doesn't already exist or job will fail
megahit --12 /home/jemizzi/biogeo/genomes/DryValleySRR5855414.fastq.gz -o /home/jemizzi/biogeo/genomes/dryvalley-megahit
