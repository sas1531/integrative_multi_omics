#!/bin/bash
#SBATCH --job-name=bbmap_cage  # Job name
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=shaleigh.smith@nyulangone.org # Where to send mail
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=10:00:00 # Time limit hrs:min:sec
#SBATCH --output=/gpfs/home/sas1531/omics/bbmap_cage_%j.log # Standard output and error log
#SBATCH -p cpu_short

# load
module load bbmap/38.25
module load samtools/1.3
module load bedtools/2.26.0
#module load macs2/2.1.1

# help (first load bbmap) then type bbmap.sh

# Align reads to strain17
bbmap.sh -Xmx26G ref=/gpfs/data/courses/bmscga4498/resources/strain17/strain17.fasta in=/gpfs/data/courses/bmscga4498/Group_2/pipeline/fastqc/clean/NHDF_18h_trimmed.fq.gz outm=/gpfs/home/sas1531/omics/NHDF_18h_strain17_out.sam ambiguous=random bamscript=/gpfs/home/sas1531/omics/NHDF_18h_strain17_index minid=0.90 slow

bbmap.sh -Xmx26G ref=/gpfs/data/courses/bmscga4498/resources/strain17/strain17.fasta in=/gpfs/data/courses/bmscga4498/Group_2/pipeline/fastqc/clean/NHDF_6h_trimmed.fq.gz outm=/gpfs/home/sas1531/omics/NHDF_6h_strain17_out.sam ambiguous=random bamscript=/gpfs/home/sas1531/omics/NHDF_6h_strain17_index minid=0.90 slow

bbmap.sh -Xmx26G ref=/gpfs/data/courses/bmscga4498/resources/strain17/strain17.fasta in=/gpfs/data/courses/bmscga4498/Group_2/pipeline/fastqc/clean/NHDF_18h_trimmed.fq.gz outm=/gpfs/home/sas1531/omics/NHDF_18h_PAA_strain17_out.sam ambiguous=random bamscript=/gpfs/home/sas1531/omics/NHDF_18h_PAA_strain17_index minid=0.90 slow

# Align reads to patton
bbmap.sh -Xmx26G ref=/gpfs/data/courses/bmscga4498/resources/patton/patton.fasta in=/gpfs/data/courses/bmscga4498/Group_2/pipeline/fastqc/clean/NHDF_18h_trimmed.fq.gz outm=/gpfs/home/sas1531/omics/NHDF_18h_patton_out.sam ambiguous=random bamscript=/gpfs/home/sas1531/omics/NHDF_18h_patton_index minid=0.90 slow

bbmap.sh -Xmx26G ref=/gpfs/data/courses/bmscga4498/resources/patton/patton.fasta in=/gpfs/data/courses/bmscga4498/Group_2/pipeline/fastqc/clean/NHDF_6h_trimmed.fq.gz outm=/gpfs/home/sas1531/omics/NHDF_6h_patton_out.sam ambiguous=random bamscript=/gpfs/home/sas1531/omics/NHDF_6h_patton_index minid=0.90 slow

bbmap.sh -Xmx26G ref=/gpfs/data/courses/bmscga4498/resources/patton/patton.fasta in=/gpfs/data/courses/bmscga4498/Group_2/pipeline/fastqc/clean/NHDF_18h_trimmed.fq.gz outm=/gpfs/home/sas1531/omics/NHDF_18h_PAA_patton_out.sam ambiguous=random bamscript=/gpfs/home/sas1531/omics/NHDF_18h_PAA_patton_index minid=0.90 slow

# Align these:
# in=/gpfs/data/courses/bmscga4498/Group_2/pipeline/fastqc/clean/NHDF_6h_trimmed.fq.gz
# in=/gpfs/data/courses/bmscga4498/Group_2/pipeline/fastqc/clean/NHDF_18h_PAA_trimmed.fq.gz

# Align reads to patton strain:
# path: /gpfs/data/courses/bmscga4498/resources/strain17/strain17.fasta
# path: /gpfs/data/courses/bmscga4498/resources/patton/patton.fasta


## Parse SAM File to a sorted, indexed BAM file
## forward and reverse?

## macs2 for peak calling
macs2 callpeak -t /gpfs/home/sas1531/omics/NHDF_18h_strain17_out.sorted.bam -f BAM --outdir /gpfs/home/sas1531/omics/ -n NHDF_18h_strain17_peaks -m 2 50 --bdg --nomodel --extsize 200 -g 1.52e5
