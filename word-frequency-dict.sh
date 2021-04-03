#!/bin/bash

#USAGE: ./word-frequency-dict.sh [BOOK FILE] [DICTIONARY FILE]

#Input file names get stored
if [[ $1 = "" ]];
  then
    bookname="./TEST TEXTS/Bram Stoker - Dracula.txt" 
  else
bookname=$1
fi

if [[ $2 = "" ]];
  then
    dictionary="./dictionaries/eng-hun/eng-hun.txt" 
  else
dictionary=$2
fi

#Input file names printed for debug
echo $bookname
echo $dictionary

cat "$bookname"     | #Read in the text 
  tr -c [[:alpha:][="'"=]] " " | #Replace all characters except letters, apostrophe, with space
  tr " " "\n"       | #Replace all space character with newline
  #  sed 's/^\039//'      | #Replace apostrophe at the beginning of line TODO (perhaps the best solution would be to try this only when searching for the word, if there's no find, then try without apostrophe)
  tr [:upper:] [:lower:] | #Convert all upper case to lower case
  awk 'NF'   |    #Remove empty lines
  sort         | #Sort all words alphabetically 
  uniq -c      | #Remove all duplicate occurences and insert the number of occurences on the beginning of the line
  sort -nr     | #Sort all words by their number of occurences
  sed 's/^[^[:alpha:]]*//' |  #Delete until the first [:alpha:] character
  xargs -i grep '^{}' "$dictionary" #Search for every word in the dictionary, at the beginning of the line NOT WORKING YET
