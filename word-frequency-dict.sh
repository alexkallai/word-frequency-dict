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
  tr -cd [[:alpha:][="'"=][=" "=]] | #Remove all characters except letters, ', control characters, space characters
  tr " " "\n"       | #Replace all space character with newline
  tr -d " "         | #Remove all space characters
  tr [:upper:] [:lower:] | #Convert all upper case to lower case
 # tr -d
  awk 'NF'       #Remove empty lines
