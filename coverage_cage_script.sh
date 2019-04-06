#!/bin/bash
#SBATCH --job-name=coverage_cage  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=shaleigh.smith@nyulangone.org # Where to send mail
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=2:00:00 # Time limit hrs:min:sec
#SBATCH --output=/gpfs/home/sas1531/omics/coverage_cage_%j.log # Standard output and error log
#SBATCH -p cpu_short

#Load Bedtools
module load bedtools/2.26.0

# get mean output coverage
bedtools coverage -a /gpfs/data/courses/bmscga4498/resources/strain17/strain17.gff3 -b /gpfs/home/sas1531/omics/NHDF_18h_strain17_out.sorted.ba -mean -hist > mean_coverage.bedgraph

# get depth output coverage
bedtools coverage -a /gpfs/data/courses/bmscga4498/resources/strain17/strain17.gff3 -b /gpfs/home/sas1531/omics/NHDF_18h_strain17_out.sorted.ba -d -hist > depth_coverage.bedgraph
