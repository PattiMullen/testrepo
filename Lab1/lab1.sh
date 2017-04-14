#!/bin/bash
# This checks to see if a number is larger than 5

read -p "Please enter a number: " num

#only allow -, +, integer or decimal
if [[! $ num =~ ^{-+]?[0-9]*[.]?[0-9]*$
then 
  echo "Please enter a valid integer"
  read num
fi

#If negative then less than 5
if [[ $num -lt 5 ]]
then 
  echo "Your number is less than 5"
  exit
fi

#Takes out leading zeros and changes +0 to +
num=$(echo $num| sed -e 's/^0*//')
num=$(echo $num| sed -e 's/^[+]0*/+/')

INT=$(echo $num | awk -F\.'{print $1}')
DEC=$(echo $num | awk -F\.{print $2})

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
  if $DEC -gt 0 ]]
    echo "Your number is greater than 5"
  else
    echo "Your number is equal to 5"
  exit
fi


fi

