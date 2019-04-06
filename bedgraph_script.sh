#!/bin/bash
#SBATCH --job-name=peak_bedgraph  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=shaleigh.smith@nyulangone.org # Where to send mail
#SBATCH --ntasks=2 # Run on a multiple CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=2:00:00 # Time limit hrs:min:sec
#SBATCH -p cpu_short

module load bedtools/2.26.0

# 18h
genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_results/BBMap/BAM/NHDF_18h_forward_patton_BBMap.bam -bg -g gpfs/data/courses/bmscga4498/resources/patton/fasta/patton.fasta > ./NHDF_18h_forward_patton_BBMap.bedgraph

genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_results/BBMap/BAM/NHDF_18h_forward_strain17_BBMap.bam -bg -g /gpfs/data/courses/bmscga4498/resources/strain17/fasta/strain17.fasta > ./NHDF_18h_forward_strain17_BBMap.bedgraph

genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_results/BBMap/BAM/NHDF_18h_reverse_patton_BBMap.bam -bg -g gpfs/data/courses/bmscga4498/resources/patton/fasta/patton.fasta > ./NHDF_18h_reverse_patton_BBMap.bedgraph

genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_results/BBMap/BAM/NHDF_18h_reverse_strain17_BBMap.bam -bg -g /gpfs/data/courses/bmscga4498/resources/strain17/fasta/strain17.fasta > ./NHDF_18h_reverse_strain17_BBMap.bedgraph

#18h_PAA
genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_PAA_results/BBMap/BAM/NHDF_18h_PAA_forward_patton_BBMap.bam -bg -g gpfs/data/courses/bmscga4498/resources/patton/fasta/patton.fasta > ./NHDF_18h_PAA_forward_patton_BBMap.bedgraph

genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_PAA_results/BBMap/BAM/NHDF_18h_PAA_forward_strain17_BBMap.bam -bg -g /gpfs/data/courses/bmscga4498/resources/strain17/fasta/strain17.fasta > ./NHDF_18h_PAA_forward_strain17_BBMap.bedgraph

genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_PAA_results/BBMap/BAM/NHDF_18h_PAA_reverse_patton_BBMap.bam -bg -g gpfs/data/courses/bmscga4498/resources/patton/fasta/patton.fasta > ./NHDF_18h_PAA_reverse_patton_BBMap.bedgraph

genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_18h_PAA_results/BBMap/BAM/NHDF_18h_PAA_reverse_strain17_BBMap.bam -bg -g /gpfs/data/courses/bmscga4498/resources/strain17/fasta/strain17.fasta > ./NHDF_18h_PAA_reverse_strain17_BBMap.bedgraph

#6h
#18h_PAA
genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_6h_results/BBMap/BAM/NHDF_6h_forward_patton_BBMap.bam -bg -g gpfs/data/courses/bmscga4498/resources/patton/fasta/patton.fasta > ./NHDF_6h_forward_patton_BBMap.bedgraph

genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_6h_results/BBMap/BAM/NHDF_6h_forward_strain17_BBMap.bam -bg -g /gpfs/data/courses/bmscga4498/resources/strain17/fasta/strain17.fasta > ./NHDF_6h_forward_strain17_BBMap.bedgraph

genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_6h_results/BBMap/BAM/NHDF_6h_reverse_patton_BBMap.bam -bg -g gpfs/data/courses/bmscga4498/resources/patton/fasta/patton.fasta > ./NHDF_6h_reverse_patton_BBMap.bedgraph

genomeCoverageBed -ibam /gpfs/data/courses/bmscga4498/Group_2/pipeline/NHDF_6h_results/BBMap/BAM/NHDF_6h_reverse_strain17_BBMap.bam -bg -g /gpfs/data/courses/bmscga4498/resources/strain17/fasta/strain17.fasta > ./NHDF_6h_reverse_strain17_BBMap.bedgraph
