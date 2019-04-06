#!/bin/bash

data_directory=$1
file_name=$2

./makeTagDirectory $data_directory $file_name -format bed -force5th

./findPeaks $data_directory/strain17/ -o $file_name".txt" -style tss -size 5 -localSize 100

pos2bed.pl $data_directory/strain17/$file_name".txt" > $data_directory/strain17/$file_name".bed"

# Command Line promt:
# bash run_homer_general_script.sh data_directoryPATH PATH_to_text_file
# Example:
# bash run_homer_script.sh /Users/kendallanderson/Desktop/bin/ /Users/kendallanderson/Desktop/bin/str17_filenames.txt
