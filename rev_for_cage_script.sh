#!/bin/bash
#SBATCH --job-name=rev_for_cage  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=shaleigh.smith@nyulangone.org # Where to send mail
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=6:00:00 # Time limit hrs:min:sec
#SBATCH --ntasks=4
#SBATCH --output=/gpfs/home/sas1531/omics/homer_input/rev_for_cage_%j.log # Standard output and error log
#SBATCH -p cpu_short


module load samtools/1.3
module load bedtools/2.26.0

### Extract reverse reads
samtools view -b -f16 /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_PAA_results/BBMap/NHDF_18h_PAA_pattonAligned.sortedByCoord.out.bam > NHDF_18hPAA_patton_reverse.bam
samtools index NHDF_18hPAA_patton_reverse.bam

samtools view -b -f16 /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_PAA_results/BBMap/NHDF_18h_PAA_strain17Aligned.sortedByCoord.out.bam > NHDF_18hPAA_strain17_reverse.bam
samtools index NHDF_18hPAA_strain17_reverse.bam

samtools view -b -f16 /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_results/BBMap/NHDF_18h_pattonAligned.sortedByCoord.out.bam > NHDF_18h_patton_reverse.bam
samtools index NHDF_18h_patton_reverse.bam

samtools view -b -f16 /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_results/BBMap/NHDF_18h_strain17Aligned.sortedByCoord.out.bam > NHDF_18h_strain17_reverse.bam
samtools index NHDF_18h_strain17_reverse.bam

samtools view -b -f16 /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_6h_results/BBMap/NHDF_6h_pattonAligned.sortedByCoord.out.bam > NHDF_6h_patton_reverse.bam
samtools index NHDF_6h_patton_reverse.bam

samtools view -b -f16 /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_6h_results/BBMap/NHDF_6h_strain17Aligned.sortedByCoord.out.bam > NHDF_6h_strain17_reverse.bam
samtools index NHDF_6h_strain17_reverse.bam


### Extract forward reads
samtools view -b -F16 -F4 /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_PAA_results/BBMap/NHDF_18h_PAA_pattonAligned.sortedByCoord.out.bam > NHDF_18hPAA_patton_forward.bam
samtools index NHDF_18hPAA_patton_forward.bam

samtools view -b -F16 -F4 /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_PAA_results/BBMap/NHDF_18h_PAA_strain17Aligned.sortedByCoord.out.bam > NHDF_18hPAA_strain17_forward.bam
samtools index NHDF_18hPAA_strain17_forward.bam

samtools view -b -F16 -F4 /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_results/BBMap/NHDF_18h_pattonAligned.sortedByCoord.out.bam > NHDF_18h_patton_forward.bam
samtools index NHDF_18h_patton_forward.bam

samtools view -b -F16 -F4 /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_results/BBMap/NHDF_18h_strain17Aligned.sortedByCoord.out.bam > NHDF_18h_strain17_forward.bam
samtools index NHDF_18h_strain17_forward.bam

samtools view -b -F16 -F4 /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_6h_results/BBMap/NHDF_6h_pattonAligned.sortedByCoord.out.bam > NHDF_6h_patton_forward.bam
samtools index NHDF_6h_patton_forward.bam

samtools view -b -F16 -F4 /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_6h_results/BBMap/NHDF_6h_strain17Aligned.sortedByCoord.out.bam > NHDF_6h_strain17_forward.bam
samtools index NHDF_6h_strain17_forward.bam


### Convert bam to bed
bamToBed -bed12 -i NHDF_18hPAA_patton_reverse.bam > NHDF_18hPAA_patton_reverse.bed
bamToBed -bed12 -i NHDF_18hPAA_strain17_reverse.bam > NHDF_18hPAA_strain17_reverse.bed
bamToBed -bed12 -i NHDF_18h_patton_reverse.bam > NHDF_18h_patton_reverse.bed
bamToBed -bed12 -i NHDF_18h_strain17_reverse.bam > NHDF_18h_strain17_reverse.bed
bamToBed -bed12 -i NHDF_6h_patton_reverse.bam > NHDF_6h_patton_reverse.bed
bamToBed -bed12 -i NHDF_6h_strain17_reverse.bam > NHDF_6h_strain17_reverse.bed

bamToBed -bed12 -i NHDF_18hPAA_patton_forward.bam > NHDF_18hPAA_patton_forward.bed
bamToBed -bed12 -i NHDF_18hPAA_strain17_forward.bam > NHDF_18hPAA_strain17_forward.bed
bamToBed -bed12 -i NHDF_18h_patton_forward.bam > NHDF_18h_patton_forward.bed
bamToBed -bed12 -i NHDF_18h_strain17_forward.bam > NHDF_18h_strain17_forward.bed
bamToBed -bed12 -i NHDF_6h_patton_forward.bam > NHDF_6h_patton_forward.bed
bamToBed -bed12 -i NHDF_6h_strain17_forward.bam > NHDF_6h_strain17_forward.bed

### Sort the bed
#awk '$7 ~ /^+$/ {print $0}' NHDF_18h_strain17_out.sorted.bed | cut -f2 | sort -n | uniq -c | sed 's/^ *//' | sed 's/ /\t/g' |
awk '{print "JN555585.1",$12,$12-1,"+",$16,"+"}' NHDF_18hPAA_patton_forward.bed | sed $'s/ /\t/g'> NHDF_18hPAA_patton_forward.faux.bed
awk '{print "JN555585.1",$9,$9+1,"+",$13,"+"}' NHDF_18hPAA_strain17_forward.bed | sed $'s/ /\t/g'> NHDF_18hPAA_strain17_forward.faux.bed
awk '{print "JN555585.1",$12,$12-1,"+",$16,"+"}' NHDF_18h_patton_forward.bed | sed $'s/ /\t/g'> NHDF_18h_patton_forward.faux.bed
awk '{print "JN555585.1",$9,$9+1,"+",$13,"+"}' NHDF_18h_strain17_forward.bed | sed $'s/ /\t/g'> NHDF_18h_strain17_forward.faux.bed
awk '{print "JN555585.1",$12,$12-1,"+",$16,"+"}' NHDF_6h_patton_forward.bed | sed $'s/ /\t/g'> NHDF_6h_patton_forward.faux.bed
awk '{print "JN555585.1",$9,$9+1,"+",$13,"+"}' NHDF_6h_strain17_forward.bed | sed $'s/ /\t/g'> NHDF_6h_strain17_forward.faux.bed


#awk '$7 ~ /^-$/ {print $0}' NHDF_18h_strain17_out.sorted.bed | cut -f3 | sort -n | uniq -c | sed 's/^ *//' | sed 's/ /\t/g' |
awk '{print "JN555585.1",$12,$12-1,"-",$16,"-"}' NHDF_18hPAA_patton_reverse.bed | sed $'s/ /\t/g'> NHDF_18hPAA_patton_reverse.faux.bed
awk '{print "JN555585.1",$9,$9-1,"-",$13,"-"}' NHDF_18hPAA_strain17_reverse.bed | sed $'s/ /\t/g'> NHDF_18hPAA_strain17_reverse.faux.bed
awk '{print "JN555585.1",$12,$12-1,"-",$16,"-"}' NHDF_18h_patton_reverse.bed | sed $'s/ /\t/g'> NHDF_18h_patton_reverse.faux.bed
awk '{print "JN555585.1",$9,$9-1,"-",$13,"-"}' NHDF_18h_strain17_reverse.bed | sed $'s/ /\t/g'> NHDF_18h_strain17_reverse.faux.bed
awk '{print "JN555585.1",$12,$12-1,"-",$16,"-"}' NHDF_6h_patton_reverse.bed | sed $'s/ /\t/g'> NHDF_6h_patton_reverse.faux.bed
awk '{print "JN555585.1",$9,$9-1,"-",$13,"-"}' NHDF_6h_strain17_reverse.bed | sed $'s/ /\t/g'>  NHDF_6h_strain17_reverse.faux.bed
