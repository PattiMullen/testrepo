#!/bin/bash
# This program parses commandline arguements and options.
# Options: -d dubug, -v verbose, -h help, -n name, -l list.

while getopts :dvhn:l: opt;do

   case $opt in
     d) set -x;;             #If -d is passed
     v) VERBOSE=true;;       #If -v is passed sets to true
     h) echo "Syntax: $0 -dvh -n <name> -l <dir>";;
     n) echo "Hello, $OPTARG!";;
     l) DIR=$OPTARG
        read -p "Continue? (y/n)" ANS
        if [[ $ANS == 'y' ]];then
           ls $DIR
        fi;;
     \?) $0 -h; exit;;   #If any other opttions, print help & exit
    esac
done
shift $(($OPTIND -1))

