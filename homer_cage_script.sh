#!/bin/bash
#SBATCH --job-name=homer_cage  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=shaleigh.smith@nyulangone.org # Where to send mail
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=4:00:00 # Time limit hrs:min:sec
#SBATCH --ntasks=4
#SBATCH --output=/gpfs/home/sas1531/omics/homer_cage_%j.log # Standard output and error log
#SBATCH -p cpu_short


# HOMER script
module load homer/4.10
module load samtools/1.3

# make tag directory
makeTagDirectory hsv_genome NHDF_18h_strain17_out.sam

#/Users/sha/Desktop/Omics/cage_data/align_clean/NHDF_18h_strain17_out.sam

# load genome
loadGenome.pl -name strain17 -fasta /Users/sha/Desktop/Omics/hsv1_genomes/strain17/strain17.fasta -gtf /Users/sha/Desktop/Omics/hsv1_genomes/strain17/strain17.gtf -org null

# find peaks
findPeaks hsv_genome -o auto -style tss

# annotate peaks
annotatePeaks.pl tss.txt strain17 > NHDF_18h_strain17_homer_peaks.txt

# Change to bed file
pos2bed.pl tss.txt > tss.bed


loadGenome.pl -name strain17 -fasta /gpfs/data/courses/bmscga4498/resources/strain17/fasta/strain17.fasta -gtf /gpfs/data/courses/bmscga4498/resources/strain17/strain17.gtf -org null
