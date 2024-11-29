#!/bin/bash  
  
#FILENAME="/home/master/ashutosh/new_all_tobe_installed"  
FILENAME="/home/master/ashutosh/only_pkgs"

echo " FILENAME  == $FILENAME "

# Check if the file exists  
if [ ! -f "$FILENAME" ]; then  
    echo "File not found: $FILENAME"  
    exit 1  
fi 

# Initialize an empty array to hold the lines
lines_array=()

# Read the file line by line
while IFS= read -r line; do
    # Append the line to the array
    lines_array+=("$line")
done < "$FILENAME"

COUNTER=0
# Now you can access the list of lines from the array
# For example, print all lines
for value  in "${lines_array[@]}"; do
    echo "$value "
    ((COUNTER++))

    echo " [SCRIPT] Next package to be processed = [ $value ] "
    echo
    if ! sudo apt install "$value" ; then
        echo " [SCRIPT] An error occurred in installing $value "
    fi
    echo
    
    if [ $((COUNTER % 5)) -eq 0 ]; then
         echo " [SCRIPT] Its 5 packages since we checked the libs hence checking the same "
         echo " [SCRIPT]  libs after this : "
         if ! ls -al /opt/rocm-6.4.0/lib ; then
            echo " [SCRIPT]  An error occurred in reading libs after  $line "
         fi
         echo
    fi

    echo " [SCRIPT]  Does the libs containt amdpython ? : "
    if ! ls -al /opt/rocm-6.4.0/lib | grep amdpython ; then
        echo " [SCRIPT]  The respons is negative so NO amdpython after  $line "
    fi
    echo
    echo " [SCRIPT]  proceed next "

    # Clear the input buffer  
    while read -r -t 0; do read -r; done  
  
    # Now you can safely read input without old buffered data interfering  
    read -p " [SCRIPT] Enter your response (or 'q' to quit): " response
    # Check if the user wants to quit  
    if [[ "$response" == "q" ]]; then  
        echo " [SCRIPT]  Exiting..."  
        break  
    fi 
    echo " [SCRIPT] your response == $response" 

done

