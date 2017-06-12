#!/bin/bash
# This program creates a script with a pseudo multi-dimensional array.

#Trap
trap "echo 'Halting process with Ctrl-C ' ; exit" SIGINT SIGTERM

OLDIFS=$IFS
IFS="
"

declare -a FNAME
declare -a LNAME
declare -a COMPANY
declare -a STREET
declare -a CITY
declare -a COUNTY

count=0  

filelines=( $(cat "/var/share/CS225/addresses.csv" ))
while [[ $count -lt ${#filelines[@]} ]]
do
	line=${filelines[$count]//,,/,\"\",}
	#echo "Line $count: $line" 
        
	FNAME[$count]=${line%%,\"*}   #Strip all from end (right) to left until the last ,"
	FNAME[$count]=${FNAME[$count]//\"/""} #Strip quotation marks
	#echo "FNAME[${count}] = ${FNAME[$count]}"     #Ignore-used for debugging purposes
	line=${line#*\",}     #Strip 1x from beginning (left) so now it is at LastName
	LNAME[$count]=${line%%,\"*}
 	LNAME[$count]=${LNAME[$count]//\"/""}
  	line=${line#*\",}
  	COMPANY[$count]=${line%%,\"*}
  	COMPANY[$count]=${COMPANY[$count]//\"/""}
  	line=${line#*\",}
  	STREET[$count]=${line%%,\"*}
  	STREET[$count]=${STREET[$count]//\"/""}
 	line=${line#*\",}
  	CITY[$count]=${line%%,\"*}
  	CITY[$count]=${CITY[$count]//\"/""}
  	line=${line#*\",}	
	COUNTY[$count]=${line%%,\"*}
	COUNTY[$count]=${COUNTY[$count]//\"/""}
	line=${line#*\",}

	count=$[ $count + 1 ]    #count through lines of data


done


#echo "SizeofFNAME = ${#FNAME[@]}"  #print the number of elements in entire  array

# print out arrays "look exactly like catting"
for i in $(seq 0 $(( ${#FNAME[@]} - 1 )) ); do
	echo "\"${FNAME[$i]}\",\"${LNAME[$i]}\",\"${COMPANY[$i]}\",\"${STREET[$i]}\",\"${CITY[$i]}\",\"${COUNTY[$i]}\""
done

#echo "${FNAME[$i]},${LNAME[$i]}"	#no quotes on output example

#echo "${contact[0]}"  #IGNORE-Used for debugging
#echo "${contact[@]}  #print the number of elements in entire  array
                                   
IFS=$OLDIFS
