#!/bin/bash
# This checks to see if a number is larger than 5

echo "Please enter a number: " 
read num

#Takes out leading zeros
num=$(echo $num| sed -e 's/^0*//')
num=$(echo $num| sed -e 's/^[+]0*/+/')
num=$(echo $num| sed -e 's/^[-]0*/-/')

#Deals with anything entered other than - + or integer
#Not working correctly
if [[ ! $num =~ [-+[:digit:]] ]]
then
  echo "Please enter proper integer"
  read num
fi

remainder=$(( num % 2 ))
if [[ $remainder -eq 0 ]]
then 
  echo "Your number is even"
else
  echo "Your number is odd"

fi

