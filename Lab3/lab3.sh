#!/bin/bash
# Prompts for the user ID. If root, display insecure waring
# to run script as root and exit. If not root, get the user's
# home directory from /etc/passwd file and display the size 
# of the contents.

if [[ $UID -eq 0 ]]
then 
   echo "Insecure to run this script as root. This will terminate."
   exit
elif [[ $UID -le 500 ]]
then
   exit
fi 

if [[ -e /etc/passwd ]] && [[ -r /etc/passwd ]]
then
   DIR=$(grep $UID /etc/passwd | cut -d: -f6)
   du -s $DIR
fi
