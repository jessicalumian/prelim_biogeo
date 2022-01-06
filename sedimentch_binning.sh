#! /bin/bash -login
#SBATCH -p bmm
#SBATCH -J sediment_bin
#SBATCH -t 20:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=60gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jelumian@ucdavis.edu
#SBATCH -o /home/jemizzi/biogeo/scripts/report/sediment_bin.out
#SBATCH -e /home/jemizzi/biogeo/scripts/report/sediment_bin.err

# activate conda
. "/home/jemizzi/miniconda3/etc/profile.d/conda.sh"

# go to a particular directory
cd /home/jemizzi/biogeo/data

# run will not stop if line fail
set x

# set name
name="ERR1333181"

# switch to metabat env
conda activate biogeo

# metabat2 binning code
metabat2 -i 01_megahit/${name}/final.contigs.fa -a 03_binning/${name}/depth.txt -o 03_binning/${name}

# look at bin quality
rm -rf 03_binning/${name}/checkm_lineage
checkm lineage_wf --reduced_tree -x fa 03_binning/${name} 03_binning/${name}/checkm_lineage
