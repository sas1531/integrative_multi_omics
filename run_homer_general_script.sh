#!/bin/bash

data_directory=$1
txt_file=$2

while IFS=‘’ read -r line || [[ -n “$line” ]]; do
	echo “Text read from file: $line”
	/Users/kendallanderson/Desktop/bin/homer_script.sh $data_directory $line
done < $txt_file


# Command Line promt:
# bash run_homer_general_script.sh data_directoryPATH PATH_to_text_file
# Example:
# bash run_homer_script.sh /Users/kendallanderson/Desktop/bin/ /Users/kendallanderson/Desktop/bin/str17_filenames.txt
