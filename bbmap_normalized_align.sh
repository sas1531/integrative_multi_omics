#!/bin/bash
#SBATCH --job-name=bbmap_cage  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=shaleigh.smith@nyulangone.org # Where to send mail
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=64gb # Job memory request
#SBATCH --time=24:00:00 # Time limit hrs:min:sec
#SBATCH --output=/gpfs/data/courses/bmscga4498/tss_sites/patton/bbmap_cage_%j.log # Standard output and error log
#SBATCH -p cpu_medium

# load
module load bbmap/38.25
module load samtools/1.3
module load bedtools/2.26.0

# Align reads to patton
bbmap.sh -Xmx26G ref=/gpfs/data/courses/bmscga4498/resources/hg38_patton.fasta in=/gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_PAA_results/trim/NHDF_18h_PAA_trimmed.fq.gz outm=/gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_PAA_patton_out.sam ambiguous=random minid=0.90 slow

bbmap.sh -Xmx26G ref=/gpfs/data/courses/bmscga4498/resources/hg38_patton.fasta in=/gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_6h_results/trim/NHDF_6h_trimmed.fq.gz outm=/gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_6h_patton_out.sam ambiguous=random minid=0.90 slow

bbmap.sh -Xmx26G ref=/gpfs/data/courses/bmscga4498/resources/hg38_patton.fasta in=/gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_results/trim/NHDF_18h_trimmed.fq.gz outm=/gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_patton_out.sam ambiguous=random minid=0.90 slow

samtools view -b -o /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_patton_out.bam /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_patton_out.sam
samtools sort -o /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_patton_out.sorted.bam /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_patton_out.bam
samtools index /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_patton_out.sorted.bam

samtools view -b -o /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_PAA_patton_out.bam /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_PAA_patton_out.sam
samtools sort -o /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_PAA_patton_out.sorted.bam /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_PAA_patton_out.bam
samtools index /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_PAA_patton_out.sorted.bam

samtools view -b -o /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_6h_patton_out.bam /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_6h_patton_out.sam
samtools sort -o /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_6h_patton_out.sorted.bam /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_6h_patton_out.bam
samtools index /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_6h_patton_out.sorted.bam

bedtools bamtobed -i NHDF_18h_patton_out.sorted.bam > NHDF_18h_patton_out.bed
bedtools bamtobed -i NHDF_18h_PAA_patton_out.sorted.bam > NHDF_18h_PAA_patton_out.bed
bedtools bamtobed -i NHDF_6h_patton_out.sorted.bam > NHDF_6h_patton_out.bed

genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_patton_out.sorted.bam -d -g /gpfs/data/courses/bmscga4498/resources/hg38_patton.fasta > ./NHDF_18h_patton_out.bedgraph
genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_18h_PAA_patton_out.sorted.bam -d -g /gpfs/data/courses/bmscga4498/resources/hg38_patton.fasta > ./NHDF_18h_PAA_patton_out.bedgraph
genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/tss_sites/patton/NHDF_6h_patton_out.sorted.bam -d -g /gpfs/data/courses/bmscga4498/resources/hg38_patton.fasta > ./NHDF_6h_patton_out.bedgraph
