#!/usr/bin/env bash

declare -A words_freq
for word in $(xargs -n1 < $1 | tr -d '[:punct:]' | sort -fu)
do 
    thecount=`grep -io "\b$word\b" $1 | wc -l`
    words_freq[$word]=$thecount
done

the_words=${!words_freq[@]}
for the_key in $the_words
do
    echo $the_key ":" ${words_freq[$the_key]}
done | sort -rn -k3
