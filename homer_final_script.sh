
## Must do everything for forward and reverse
## Note that this has been made for BBMap tss_forward_output
## Converting from bed12 to bed6 might required different conversion based on aligner

# Convert forward bed 12 file to forward bed 6 file
# Patton
awk '{print "JN555585.1",$12,$12-1,"+",$16,"+"}' bed12_forward.bed | sed $'s/ /\t/g'> bed6_forward.bed
# Strain 17
awk '{print "JN555585.1",$9,$9+1,"+",$13,"+"}' bed12_forward.bed | sed $'s/ /\t/g'> bed6_forward.bed

# Convert reverse bed 12 file to forward bed 6 file
# Patton
awk '{print "JN555585.1",$12,$12-1,"-",$16,"-"}' bed12_reverse.bed | sed $'s/ /\t/g'> bed6_reverse.bed
# Strain 17
awk '{print "JN555585.1",$9,$9-1,"-",$13,"-"}' bed12_reverse.bed| sed $'s/ /\t/g'> bed6_reverse.bed


### Peak Calling
# A tag directory contains the bed file that you are peak calling from
# Every time you need to call peaks from a different bed file,
  # you must make a new tag directory
# The tag directory name can be anything


# Make tag directory
makeTagDirectory tag_directory_forward_name bed6_forward.bed -format bed -force5th
makeTagDirectory tag_directory_reverse_name bed6_reverse.bed -format bed -force5th

# Find Peaks
findPeaks tag_directory_forward_name \
-o ./tag_directory_forward_name/tss_forward_output.txt \
-style tss \
-localSize 5000 \
-size 50

findPeaks tag_directory_reverse_name \
-o ./tag_directory_reverse_name/tss_reverse_output.txt \
-style tss \
-localSize 5000 \
-size 50

# Convert peaks tss text file to bed
pos2bed.pl ./tag_directory_forward_name/tss_forward_output.txt > tss_forward.bed
pos2bed.pl ./tag_directory_reverse_name/tss_reverse_output.txt > tss_reverse.bed
