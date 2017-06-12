# My script functions

check_timestamp()
{
 	TIME=$(stat -c '%y' $1)
	TIME=${TIME%% *}    #will show as 2005-08-09 for example 
	#pattern match to get just month and day and strip to put 
	#them in their own variable for month and day
	
        #YEAR=${TIME%%-*}  #take out -08-09 leaving year
	MONTH=${TIME#*-}   #take out 2005- from beginning
	MONTH=${MONTH%-*}  #take out -09 from end
	DAY=${TIME##*-}    #take out 2005-08-
}


create_directory()
{ 
	#variables month and day (year may be added later)
	mkdir -p $1     # $1 is the path from script that create_directory
		        # makes in ~/$MONTH/$DAY or if YEAR is added 
                        # ~/$YEAR/$MONTH/$DAY
}


check_ip()
{
     local ip=$1
     if  [[ "$ip" =~ ^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$ ]]
     then
         echo "Valid IP Address"
	 return 0
     else
         echo "Error Message = Invalid IP Address"
	 return 1
     fi
}


# Verifies email address is valid. Username allows alphanumeric characters, dot, dash
# plus sign, and underscore. Hostname allows alphanumeric characters, dot, and 
# underscore per page 518 of Linux: Command Line and Shell Scripting 2nd edition.
check_email()
{
     local email=$1
	if [[ "$email" =~ ^([a-zA-Z0-9_\-\.\+]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$ ]]
        then
            echo "Valid email address"
	    return 0
        else
       	    echo "Error message = Invalid email address"
	    return 1
     fi
}


check_pn()
{
    local pn=$1
     #checks for (123) 456-7890, (123)456-7890, 123-456-7890, 123.456.7890, 1234567890
     #currently not working are any numbers with ( ) for area code.
       if [[ "$pn" =~ ^\(?[2-9][0-9]{2}\)?(| |-|\.)?[0-9]{3}( |-|\.)?[0-9]{4}$ ]]
       then
       	   echo "Valid phone number"
	   return 0
       else
           echo "Error message = Invalid phone number"
	   return 1
     fi
}


check_ccn()
{
     local ccn=$1

        if [[ "$ccn" =~ ^"(?:4[0-9]{12}(?:[0-9]{3})?" ]]   
	#for VISA only during troubleshooting. See regex for all cards below.
	# But its not accepting valid cards. All cards entered are being seen as invalid. 
        then
            echo "Valid credit card number"
            return 0
        else
     	    echo "Error message = Invalid credit card nunmber"
            return 1
     fi

}

#Issues wtih getting valid credit card regex to pass. Original code below for all cards.
# if [[ "$ccn" =~ ^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$ ]]
