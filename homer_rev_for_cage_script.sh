#!/bin/bash
#SBATCH --job-name=homer_rev_for_cage  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=shaleigh.smith@nyulangone.org # Where to send mail
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=6:00:00 # Time limit hrs:min:sec
#SBATCH --ntasks=4
#SBATCH --output=/gpfs/home/sas1531/omics/homer_rev_for_cage_%j.log # Standard output and error log
#SBATCH -p cpu_short

# Local Path:
# /Users/sha/Desktop/Omics/cage_scripts/homer_rev_for_cage_script.sh


# HOMER script
#module load homer/4.10
#module load samtools/1.3

# make tag directory
makeTagDirectory strain17_forward_18h_auto NHDF_18h_strain17_out.sorted.forward.faux.bed -format bed -force5th
makeTagDirectory strain17_reverse_18h_auto NHDF_18h_strain17_out.sorted.reverse.faux.bed -format bed -force5th

makeTagDirectory strain17_forward_18h_5 NHDF_18h_strain17_out.sorted.forward.faux.bed -format bed -force5th
makeTagDirectory strain17_reverse_18h_5 NHDF_18h_strain17_out.sorted.reverse.faux.bed -format bed -force5th

makeTagDirectory strain17_forward_18h_10 NHDF_18h_strain17_out.sorted.forward.faux.bed -format bed -force5th
makeTagDirectory strain17_reverse_18h_10 NHDF_18h_strain17_out.sorted.reverse.faux.bed -format bed -force5th

makeTagDirectory strain17_forward_18h_20 NHDF_18h_strain17_out.sorted.forward.faux.bed -format bed -force5th
makeTagDirectory strain17_reverse_18h_20 NHDF_18h_strain17_out.sorted.reverse.faux.bed -format bed -force5th

makeTagDirectory strain17_forward_18h_50 NHDF_18h_strain17_out.sorted.forward.faux.bed -format bed -force5th
makeTagDirectory strain17_reverse_18h_50 NHDF_18h_strain17_out.sorted.reverse.faux.bed -format bed -force5th

# Bed file must be in homer directory to create tag directory!!!!
#/Users/sha/Desktop/Omics/cage_data/homer/NHDF_18h_strain17_out.sorted.forward.faux.bed
#/Users/sha/Desktop/Omics/cage_data/homer/NHDF_18h_strain17_out.sorted.reverse.faux.bed

# find peaks no parameters
findPeaks strain17_forward_18h_auto -o ./strain17_forward_18h_auto/tss_for_auto.txt -style tss
# ouput = 40 peaks for both forward
findPeaks strain17_reverse_18h_auto -o ./strain17_reverse_18h_auto/tss_rev_auto.txt -style tss
# ouput = 33 peaks for bothreverse

# find peaks with:
# peak width 5 (very small to prevent false negatives because noisy sites are dicounted)
# local size 5000 (changes size of 'local region')
findPeaks strain17_forward_18h_5 -o ./strain17_forward_18h_5/tss_for_5.txt -style tss -localSize 5000 -size 5
# output = 357 peaks for both forward
findPeaks strain17_reverse_18h_5 -o ./strain17_reverse_18h_5/tss_rev_5.txt -style tss -localSize 5000 -size 5
# output = 400 peaks for both reverse

# find peaks with:
# peak width 10
# local size 5000
findPeaks strain17_forward_18h_10 -o ./strain17_forward_18h_10/tss_for_10.txt -style tss -localSize 5000 -size 10
# output = 253 peaks for both forward
findPeaks strain17_reverse_18h_10 -o ./strain17_reverse_18h_10/tss_rev_10.txt -style tss -localSize 5000 -size 10
# output = 243 peaks for both reverse

# find peaks with:
# peak width 20
# local size 5000
findPeaks strain17_forward_18h_20 -o ./strain17_forward_18h_20/tss_for_20.txt -style tss -localSize 5000 -size 20
# output = 140 peaks for both forward
findPeaks strain17_reverse_18h_20 -o ./strain17_reverse_18h_20/tss_rev_20.txt -style tss -localSize 5000 -size 20
# output = 136 peaks for both reverse

# find peaks with:
# peak width 50
# local size 5000
findPeaks strain17_forward_18h_50 -o ./strain17_forward_18h_50/tss_for_50.txt -style tss -localSize 5000 -size 50
# output = 80 peaks for both forward
findPeaks strain17_reverse_18h_50 -o ./strain17_reverse_18h_50/tss_rev_50.txt -style tss -localSize 5000 -size 50
# output = 77 peaks for both reverse

# Change to bed file

pos2bed.pl ./strain17_forward_18h_auto/tss_for_auto.txt > tss_for_auto.bed
pos2bed.pl ./strain17_reverse_18h_auto/tss_rev_auto.txt > tss_rev_auto.bed
pos2bed.pl ./strain17_forward_18h_5/tss_for_5.txt > tss_for_5.bed
pos2bed.pl ./strain17_reverse_18h_5/tss_rev_5.txt > tss_rev_5.bed
pos2bed.pl ./strain17_forward_18h_10/tss_for_10.txt > tss_for_10.bed
pos2bed.pl ./strain17_reverse_18h_10/tss_rev_10.txt > tss_rev_10.bed
pos2bed.pl ./strain17_forward_18h_20/tss_for_20.txt > tss_for_20.bed
pos2bed.pl ./strain17_reverse_18h_20/tss_rev_20.txt > tss_rev_20.bed
pos2bed.pl ./strain17_forward_18h_50/tss_for_50.txt > tss_for_50.bed
pos2bed.pl ./strain17_reverse_18h_50/tss_rev_50.txt > tss_rev_50.bed
