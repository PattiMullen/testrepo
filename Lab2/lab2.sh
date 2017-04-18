#!/bin/bash
# Prompt the user for a number, ensure its a number and
# check to see if it's and EVEN number.

read -p "Please enter a number: " NUM

# Only allow -, +, integer for input
while [[ ! $NUM =~ ^[+-]?[0-9]*$ ]]
do
  echo "Please enter a valid integer"
  read NUM
done


REMAINDER=$(( NUM % 2 ))
if [[ $REMAINDER -eq 0 ]]
then
  echo "Your number is even"
else
  echo "Your number is odd"
fi

