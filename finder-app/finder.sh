#!/bin/bash

filesdir=$1
searchstr=$2

if  [ -z $filesdir ];
then
     
      echo "\$filesdir is empty"
	  exit 1

fi

if [ ! -e $filesdir ];
then
	echo "$filesdir does not exist."
    exit 1
	
fi

if  [ -z $searchstr ];
then
     
      echo "\$searchstr is empty"
	  exit 1

fi

cd $filesdir

vara="$(grep -roh $searchstr . | wc -w)"
files="$(find . -type f | wc -l)"
echo " The number of files are $files and the number of matching lines are $vara  "

