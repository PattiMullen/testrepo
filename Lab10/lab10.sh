#!/bin/bash
# This program outputs the files of the OS
# and cleans up if forced to exit with Ctrl +C

#Cleanup Function
#Get rid of directory and files will delete recursive
CleanUp()
{
   rm -Rf $TEMPDIR
   exit
}

TEMPDIR=$(mktemp -d)    #mktemp is temp directory with -d debug
#Trap with no CleanUp Function
#trap "echo 'Whoops! I have trapped Ctrl-C ' ; rm -Rf $TEMPDIR ; exit" SIGINT SIGTERM
#Trap with CleanUp Function
trap "echo 'Whoops! I have trapped Ctrl-C ' ; CleanUp" SIGINT SIGTERM

LISTNUM=1
for item in $(find /)  #taking find / and assigning it to item
do 
  echo "File ${LISTNUM}: ${item##*/}"
  #echo $item
  echo $item >> $TEMPDIR/file.txt
  (( LISTNUM++ ))
done


