#!/bin/bash

#Validating by passing 2 arguments and printing out disk-usage for the selected directory

if [ "$#" -eq 2 ] && [ "$1" == "d" ] && [ -d $2 ]
then
	echo "Disk usage in a selected dir"
	sudo du -h --max-depth=1 "$2" | sort -rh | head
fi

# Note
# The du commands means disk usage -h means readable format
# --max-depth=1 option is used with du command to limit the depth of the directory tree as shown on the output
# sort -rh, the sort command is used to sort lines of text files, the -r option reverses the order of the sort (ascending-decending)
# -h used for human numeric sorting or form

#The above solutions sort the selected directory and list its files and dir by disk usage 


# output disk-use for  n


if [ "$#" -eq 2 ] && [ "$1" == "-n" ]
then
	n=8
	selected_directory="$2"
	echo "The top $n directories and files by disk used:"
	sudo du -h --max-depth=1 "$selected_directory" | sort -rh | head -n "$n"

#$2 is mentioned then $1 $2 $3

# Note
# the 2 arguments is called without the value assigned for n
# Given n as default to be 8, when ./diskscript.sh/ -n /var is called by the user, without the user entering the appropriate value 
# it out the top 8 entries by default.

#else if
# it acceept 3 arguments by the user then the 3 arguments must pass the 3 if validation with elif statement
# the n=$2 must be greater than 0 else it script does not run
# the 3 arguments must pass the 3 validation, using the && OPERATORS

elif [ "$#" -eq 3 ] && [ "$1" == "-n" ] && [ "$2" -gt 0 ]
then

	n="$2"
	selected_directory="$3"
	echo  "The top $n directories and files by disk used:"
	sudo du -h --max-depth=1 "$selected_directory" | sort -rh | head -n "$n"
fi

# disk usage is finally run and scripts output the right command



