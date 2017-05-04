#! /bin/bash
# This program takes one argument and duplicates the functionality
# of the basename command exactly using pattern matching.

name=`basename $0`
echo $name $1
echo $(basename $1)

