#! /bin/bash
# This program takes one argument and duplicates the functionality
# of the basename command exactly using pattern matching.

# First two lines are optional per Instructor.
# First two line print the command on the screen.
name=${0##*/}
echo $name $1

#Only contains forward slashes or slash at beginning
if [[ $1 =~ ^[/]+$ ]]
then
   echo "/"
   exit
fi 

#Forward slashes at end
tmpVar=$1
tmpVar1=""

while [[ $tmpVar =~ / ]] ; do
	
	tmpVar1=$tmpVar	
	tmpVar=${tmpVar##*/}	
	
	if [[ $tmpVar = "" ]] ; then
		tmpVar=$tmpVar1
		tmpVar=${tmpVar%/*}	
	fi
done
echo $tmpVar



