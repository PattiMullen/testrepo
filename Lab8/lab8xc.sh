#! /bin/bash
# This program takes in two arguments. If the first argument
# does not exist, it will output a complaint to the screen and 
# exit. If the first exists but the second does not exist, 
# it will output the value of the first argument and set 
# the value of the second argument to 10.

echo "${1:?No parameter found.}"
echo "${2:-10}"
