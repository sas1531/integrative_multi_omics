#!/bin/bash
files=./*patton*.bed
for i in $files
do
    str1=`basename "$i"` #to get the name of the file
    cut -f 2 $str1 | sort -n | uniq -c | awk '{print "hsv1_patton",$2,$2,$1}' | sed $'s/ /\t/g'> count_${str1}
done

files=./*strain17*.bed
for i in $files
do
    str1=`basename "$i"` #to get the name of the file
    cut -f 2 $str1 | sort -n | uniq -c | awk '{print "hsv1_strain17",$2,$2,$1}' | sed $'s/ /\t/g'> count_${str1}
done
