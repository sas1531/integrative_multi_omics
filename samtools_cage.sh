#!/bin/bash
#SBATCH --job-name=sam_cage  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=shaleigh.smith@nyulangone.org # Where to send mail
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=10:00:00 # Time limit hrs:min:sec
#SBATCH --output=/gpfs/home/sas1531/omics/sam_cage_%j.log # Standard output and error log
#SBATCH -p cpu_short

# Get bam file summary statistics
module load samtools/1.3

samtools flagstat /gpfs/data/courses/bmscga4498/Group_2/Bowtie2/st17_18hr_sorted.bam
