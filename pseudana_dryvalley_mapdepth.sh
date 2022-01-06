#! /bin/bash -login
#SBATCH -p bmm
#SBATCH -J pseud_dryvalley_mapdepth
#SBATCH -t 20:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=60gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jelumian@ucdavis.edu
#SBATCH -o /home/jemizzi/biogeo/scripts/report/pseud_dryvalley_mapdepth.out
#SBATCH -e /home/jemizzi/biogeo/scripts/report/pseud_dryvalley_mapdepth.err

# activate conda
. "/home/jemizzi/miniconda3/etc/profile.d/conda.sh"

# activate mapping env
conda activate biogeo

# set name
name="SRR6266338"

# go to a particular directory
cd /home/jemizzi/biogeo/data

rm -fr 02_mapping/${name}
mkdir 02_mapping/${name}

# mapping commands
bowtie2-build 01_megahit/${name}/final.contigs.fa 02_mapping/${name}/contigs

bowtie2 --threads 32 -x 02_mapping/${name}/contigs --interleaved ${name}.fastq.gz -S 02_mapping/${name}/${name}.sam

samtools view -F 4 -bS 02_mapping/${name}/${name}.sam -o 02_mapping/${name}/${name}-RAW.bam

# activate env
conda activate anvio-7.1

rm -fr 03_binning/${name}
mkdir 03_binning/${name}

# depth commands
anvi-init-bam 02_mapping/${name}/${name}-RAW.bam -o 02_mapping/${name}/${name}.bam

conda activate biogeo

jgi_summarize_bam_contig_depths --outputDepth 03_binning/${name}/depth.txt 02_mapping/${name}/${name}.bam
