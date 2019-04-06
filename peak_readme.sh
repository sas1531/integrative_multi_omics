hsv1 directory:

original_bed:
Contains the original bed files from the alignment of CAGE-Seq data to the HSV-1 reference genomes using BBMAP

scripts:
Contains scripts to convert bed files to tag count text files.

tag_count:
Contains the desired tag count files. The first column of each file is the reference genome identifier (either hsv1-patton or hsv1-strain 17). The second and third columns are the same, this is the position in the genome (bp) where the tags are being counted at. The fourth column is the tag count: this is equivalent to the number of tags that mapped to the specific position (bp). Note that each tag represents the first basepair in every read that was mapped to the reference genome (not the full length of the read).

Each count txt file is named in this order, separated by underscores. Options are given in the parentheses:
Count (count)
Cell type (NHDF)
Hours after infection (6h, 18h)
Treatment (Blank, PAA)
Strand (forward, reverse)
Reference Genome (patton, strain17)
Alignment Tool (BBMap, Bowtie2, STAR)
