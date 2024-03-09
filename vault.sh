#!/bin/bash

#check to make sure the user has entered the appropriate 2 arguments

if [ $# -ne 2 ]
then 
	echo "Two arguments needed to be passed into: vault.sh <Originated_dir> <Target_dir>"
	echo "Enter the two arguments"
	exit 1
fi

# The exit 1 code occurs here and termiante the script if the condition is not met

#checking to validate if resync is installed
if ! command -v rsync > /dev/null 2>&1
then
	echo "validatating if rsync is installed"
	echo "Please use your distribution package manager to install then run the script again"
	exit 2
fi
# The exit 2 code terminates once the command rsync can't be found on the linux os


# Capture time-stamp and store it in this  format as YYYY-MM-DD_H-M-S which is Year_Month_Date_Hour_Min_Secs" 

recentDate=$(date +%Y-%m-%d_%H-%M-%S)

backupOption="-avb --backup-dir $2/$recentDate --delete "

# Takes in 2 arguments $1<source> $2<destination>
$(which rsync) $backupOption $1 $2 >> backup_$recentDate.log

# backup_$recentDate.log output into the file with a time format which can easily be cated to see what has been backed up

# Archieving the backup files in tar.gz format  
tar -czvf "$2/backup_$recentDate.tar.gz" -C "$1" .

# rsync is widely used command-loine utility for efficiently copyinhg and synchronzing files and directories between 2 locations
# a =archieve mode for maintaing metadata, preserves permissions, ownership and etc
# v = verbose shows what going to be outputed, showing more detailed output
# b= stannds for backup, it creates backups of files that are been updated or deleted during sync process
# -- backup-dir also function same as b
# --delete; delete extraneous files from the destination directory.
