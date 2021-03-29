#!/bin/bash

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
  tr -c [[:alpha:][="'"=][=" "=]] " " | #Remove all characters except letters, ',
  tr " " "\n"       | #Replace all space character with newline
  sed 's/^\039//'      | #Replace apostrophe at the beginning of line
  tr -d " "         | #Remove all space characters
  tr [:upper:] [:lower:] | #Convert all upper case to lower case
 # tr -d
  awk 'NF'   |    #Remove empty lines
sort         | #Sort all words alphabetically 
uniq -c      | #Remove all duplicates
sort -nr

