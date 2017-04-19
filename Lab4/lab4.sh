#!/bin/bash
# Prompt the user for a number, ensure its a number and
# the number is between 50 and 100. 

read -p "Please enter a number: " NUM

# Only allow -, +, integer for input
while [[ ! $NUM =~ ^[+-]?[0-9]*$ ]]
do
  echo "Please enter a valid integer: "
  read NUM
done

#Ensure number is between 50 and 100
if [ $NUM -ge 50 ]&& [ $NUM -le 100 ]
then 
  echo "Success! Your number is in the range 50-100."
else
  echo "Your number is not within the range 50-100"
fi

