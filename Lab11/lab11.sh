#!/bin/bash
# This program is to use a function library and either copy or move
# files.

#Trap
trap "echo 'Halting process with Ctrl-C ' ; exit" SIGINT SIGTERM

movefunc()
{
	local SRC=$1          #SRC is source
	local DEST=$2         #DEST is desination
	local METH=$3         #METH is method used
	if [[ $METH == "copy" ]]; then
		cp $SRC $DEST
	else
		mv $SRC $DEST
	fi

}

print_syntax() #print syntax help for user
{
	echo "Usage: $0 [-fh]"
	echo "-f force move instead of copy"
	echo "-h help print usage syntax" 
}

METHOD=copy  #is this correct location? or above movefunc()

while getopts :fh opt     #set getops for -f and -h
do
	case $opt in
		f)METHOD=move;;
 		h)print_syntax; exit;;
	esac
done

source ../functionLibrary.sh

for item in $(ls ~/timefiles)
do
  check_timestamp ~/timefiles/$item   #function and argument passed to it
				      #this becomes $1 in TIME function library
  create_directory ~/$MONTH/$DAY      #this becomes $1 in create_directory
                                      #if YEAR is added: create_directory ~/$YEAR/$MONTH/$DAY

  #copy/move
  movefunc ~/timefiles/$item ~/$MONTH/$DAY $METHOD 
	# if YEAR is added: movefunc ~/timefiles/$item ~/$YEAR/$MONTH/$DAY $METHOD
 
done



