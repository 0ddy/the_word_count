#!/usr/bin/env bash

#declare a dictionary to hold the words as key and their frequency as values
declare -A words_freq
#convert the content into a column of unique words and remove punctuations through a loop
for word in $(xargs -n1 < $1 | tr -d '[:punct:]' | sort -fu)
do 
#grep and count each unique word and append to the dictionary
    thecount=`grep -io "\b$word\b" $1 | wc -l`
    words_freq[$word]=$thecount
done
#copy the dictionary keys into another variable
the_words=${!words_freq[@]}
#loop through the keys 
for the_key in $the_words
do
#print the key against the dictionary to get the corresponding value
    echo $the_key ":" ${words_freq[$the_key]}
#pipe with a sort and reverse order using the 3rd column
done | sort -rn -k3
