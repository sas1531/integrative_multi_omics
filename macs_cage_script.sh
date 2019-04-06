## macs2 for peak calling
module load macs2/2.1.1

macs2 callpeak \
-t /gpfs/home/sas1531/omics/NHDF_18h_strain17_out.sorted.bam \
-f BAM \
--outdir /gpfs/home/sas1531/omics/ \
-n NHDF_18h_strain17_peaks \
--bdg \
--nomodel \
--extsize 200 \
-g 1.52e5


macs2 callpeak -t /gpfs/home/sas1531/omics/NHDF_18h_strain17_out.bam -f BAM --outdir /gpfs/home/sas1531/omics/ -n NHDF_18h_strain17_peaks_ext20 --bdg --nomodel --extsize 20 -g 1.52e5
macs2 callpeak -t /gpfs/home/sas1531/omics/NHDF_18h_strain17_out.bam -f BAM --outdir /gpfs/home/sas1531/omics/ -n NHDF_18h_strain17_peaks_ext40 --bdg --nomodel --extsize 40 -g 1.52e5
macs2 callpeak -t /gpfs/home/sas1531/omics/NHDF_18h_strain17_out.bam -f BAM --outdir /gpfs/home/sas1531/omics/ -n NHDF_18h_strain17_peaks_ext60 --bdg --nomodel --extsize 60 -g 1.52e5
macs2 callpeak -t /gpfs/home/sas1531/omics/NHDF_18h_strain17_out.bam -f BAM --outdir /gpfs/home/sas1531/omics/ -n NHDF_18h_strain17_peaks_ext100 --bdg --nomodel --extsize 100 -g 1.52e5
macs2 callpeak -t /gpfs/home/sas1531/omics/NHDF_18h_strain17_out.bam -f BAM --outdir /gpfs/home/sas1531/omics/ -n NHDF_18h_strain17_peaks_ext120 --bdg --nomodel --extsize 120 -g 1.52e5
macs2 callpeak -t /gpfs/home/sas1531/omics/NHDF_18h_strain17_out.bam -f BAM --outdir /gpfs/home/sas1531/omics/ -n NHDF_18h_strain17_peaks_ext140 --bdg --nomodel --extsize 140 -g 1.52e5
macs2 callpeak -t /gpfs/home/sas1531/omics/NHDF_18h_strain17_out.bam -f BAM --outdir /gpfs/home/sas1531/omics/ -n NHDF_18h_strain17_peaks_ext160 --bdg --nomodel --extsize 160 -g 1.52e5
macs2 callpeak -t /gpfs/home/sas1531/omics/NHDF_18h_strain17_out.bam -f BAM --outdir /gpfs/home/sas1531/omics/ -n NHDF_18h_strain17_peaks_ext180 --bdg --nomodel --extsize 180 -g 1.52e5
