#! /bin/bash -login
#SBATCH -J dryvalley_btmap
#SBATCH -t 20:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=60gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jelumian@ucdavis.edu
#SBATCH -o /home/jemizzi/biogeo/scripts/report/dryvalley_btmap.out
#SBATCH -e /home/jemizzi/biogeo/scripts/report/dryvalley_btmap.err

# activate conda
. "/home/jemizzi/miniconda3/etc/profile.d/conda.sh"

# activate mapping env
conda activate biogeo

# set name
name="SRR5855414"

# go to a particular directory
cd /home/jemizzi/biogeo/data

mkdir 02_mapping/${name}


# run will not stop if line fail
set x

# mapping commands
bowtie2-build 01_megahit/${name}/final.contigs.fa 02_mapping/${name}

bowtie2 --threads 32 -x 02_mapping/${name} --interleaved ${name}.fastq.gz -S 02_mapping/${name}/${name}.sam

samtools view -F 4 -bS 02_mapping/${name}/${name}.sam -o 02_mapping/${name}/${name}-RAW.bam
