#! /bin/bash
# This program uses functions using regular expressions
# to check the validity of email address, telephone numbers
# IP addresses and credit card numbers based on each 
# particular data format.

#Trap
trap "echo 'Halting process with Ctrl-C ' ; exit" SIGINT SIGTERM

source ../functionLibrary.sh

# If no argument is passed, help is printed to screen.
if [[ ! $@ =~ ^\-.+ ]]
then
  echo "You must enter an argument. Please re-run and enter -i, -e, -p, or -c followed by number for verification."
fi


while getopts :iepc opt;do  #setting opt 
   case $opt in
     i)check_ip "$2" ;;            #If -i is passed, go to check_ip function
     e)check_email "$2" ;;         #If -e is passed, go to check_email function
     p)check_pn "$2" ;;            #If -p is passed, go to check_pn function
     c)check_ccn "$2" ;;           #If -c is passed, go to check_ccn function

   esac
done

