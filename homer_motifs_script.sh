### HOMER Motifs

# find motifs
findMotifsGenome.pl ./strain17_forward_18h_auto/tss_for_auto.txt strain17 ./strain17_forward_18h_auto/ -size 100
findMotifsGenome.pl ./strain17_reverse_18h_auto/tss_rev_auto.txt strain17 ./strain17_reverse_18h_auto/ -size 100
findMotifsGenome.pl ./strain17_forward_18h_5/tss_for_5.txt strain17 ./strain17_forward_18h_5/ -size 100
findMotifsGenome.pl ./strain17_reverse_18h_5/tss_rev_5.txt strain17 ./strain17_reverse_18h_5/ -size 100
findMotifsGenome.pl ./strain17_forward_18h_10/tss_for_10.txt strain17 ./strain17_forward_18h_10/ -size 100
findMotifsGenome.pl ./strain17_reverse_18h_10/tss_rev_10.txt strain17 ./strain17_reverse_18h_10/ -size 100
findMotifsGenome.pl ./strain17_forward_18h_20/tss_for_20.txt strain17 ./strain17_forward_18h_20/ -size 100
findMotifsGenome.pl ./strain17_reverse_18h_20/tss_rev_20.txt strain17 ./strain17_reverse_18h_20/ -size 100
findMotifsGenome.pl ./strain17_forward_18h_50/tss_for_50.txt strain17 ./strain17_forward_18h_50/ -size 100
findMotifsGenome.pl ./strain17_reverse_18h_50/tss_rev_50.txt strain17 ./strain17_reverse_18h_50/ -size 100


# FOUND TATAA
findMotifsGenome.pl ./homer_peak_files/tss_18h_strain17_forward_50.txt strain17 ./homer_motifs/ -size 100
findMotifsGenome.pl ./homer_peak_files/tss_18h_strain17_reverse_auto.txt strain17 ./homer_motifs/ -size 100

# Find specific TATAA motif
findMotifsGenome.pl ./strain17_forward_18h_auto/tss_for_auto.txtstrain17 ./homer_motifs/ -find ./motifs/tata.motif > tata_tss_18h_strain17_rev_auto.txt


# Reference
# http://homer.ucsd.edu/homer/ngs/peakMotifs.html
