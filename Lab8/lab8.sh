#! /bin/bash
# This program gathers each field from a .csv file
# and puts them into variables using bash pattern 
# substitution.

INFO="FirstName","LastName","Company","Address","City","County","State","Zip","Phone","FAX","Email","Web"
# displays last line only in addresses.csv
# tail -n 1 /var/share/CS225/addresses.csv

INFO=$(tail -1 /var/share/CS225/addresses.csv)
  FNAME=${INFO%%,\"*}   #Strip all from end (right) to left until the last ,"
  FNAME=${FNAME//\"/""} #Strip quotation marks  
  INFO=${INFO#*\",}     #Strip 1x from beginning (left) so now it is at LastName
  LNAME=${INFO%%,\"*}
  LNAME=${LNAME//\"/""}
  INFO=${INFO#*\",}
  COMPANY=${INFO%%,\"*}
  COMPANY=${COMPANY//\"/""}
  INFO=${INFO#*\",}
  STREET=${INFO%%,\"*}
  STREET=${STREET//\"/""}
  INFO=${INFO#*\",}
  CITY=${INFO%%,\"*}
  CITY=${CITY//\"/""}
  INFO=${INFO#*\",}
  STATE=${INFO%%,\"*}
  STATE=${STATE//\"/""}
  INFO=${INFO#*\",}
  STATEABR=${INFO%%,\"*}
  STATEABR=${STATEABR//\"/""}
  INFO=${INFO#*\",}
  ZIP=${INFO%%,\"*}
  ZIP=${ZIP//\"/""}
  INFO=${INFO#*\",}
  HPHONE=${INFO%%,\"*}
  HPHONE=${HPHONE//\"/""}
  INFO=${INFO#*\",}
  WPHONE=${INFO%%,\"*}
  WPHONE=${WPHONE//\"/""}
  INFO=${INFO#*\",}
  EMAIL=${INFO%%,\"*}
  EMAIL=${EMAIL//\"/""}
  INFO=${INFO#*\",}
  WEBURL=${INFO%%,\"*}
  WEBURL=${WEBURL//\"/""}
  INFO=${INFO#*\",}

  echo "FNAME: ${FNAME,,}"   # ,, makes all lowercase
  echo "LNAME: ${LNAME,,}"   
  echo "COMPANY: ${COMPANY,,}"
  echo "STREET: ${STREET,,}"
  echo "CITY: ${CITY,,}"
  echo "STATE: ${STATE,,}"        
  echo "STATEABR: ${STATEABR,,}" 
  echo "ZIP: ${ZIP,,}"
  echo "HPHONE: ${HPHONE,,}"    
  echo "WPHONE: ${WPHONE,,}"    
  echo "EMAIL: ${EMAIL,,}"
  echo "WEBURL: ${WEBURL,,}"

