#!/bin/bash

# This program loops through data in a file and determines 
# if files are in a directory, then outputs the name to 
# the appropriate found or lost file. 

for item in $(cat ~/medialab/medialist.txt)
do
   if [[ -e ~/medialab/$item ]]
   then
      echo $item >> foundfiles.txt
   else 
      echo $item >> lostfiles.txt
   fi

done


