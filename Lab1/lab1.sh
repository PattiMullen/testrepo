#!/bin/bash
# This checks to see if a number is larger than 5
# Only valid for the following examples for input
# -100, +100, 0087, 5a, and 5.2 floating point numbers

read -p "Please enter a number: " NUM

# Only allow -, +, integer or decimal for input
# Valid if valid number is entered after 1st invalid prompt.
# Example: if 'aa' is entered then 'aa' entered again, the 
# screen display  will be an invalid "Your number is less 
# than 5"
if [[ ! $NUM =~ ^[+-]?[0-9]*[.]?[0-9]*$ ]]
then 
  echo "Please enter a valid integer"
  read NUM
  exit
fi

#Takes out leading zeros and changes +0 to +
NUM=$(echo $NUM | sed -e 's/^0*//')
NUM=$(echo $NUM | sed -e 's/^[+]0*/+/')

# negative numbers  will be less than 5
if [[ $NUM == -* ]];then 
  echo "Your number is less than 5"
  exit
fi

# For decimal number input (float), split into integer and decimal
INT=$(echo $NUM | awk -F\. '{print $1}')
DEC=$(echo $NUM | awk -F\. '{print $2}')

if [[ $INT -gt 5 ]]
then
   echo "Your number is greater than 5"
   exit 
fi

if [[ $INT -lt 5 ]]
then 
   echo "Your number is less than 5" 
   exit
fi

if [[ $INT -eq 5 ]]
then
  if [[ $DEC -gt 0 ]]
  then
    echo "Your number is greater than 5"
  else
    echo "Your number is equal to 5"
  fi
fi

