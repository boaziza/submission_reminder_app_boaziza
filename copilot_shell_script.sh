#!/bin/bash

cd submission_reminder_boaz/
#Prompting the user to the assignment the want to check
echo "Enter the assignment you want to check"

read checkassignment

#Checking if the assignment is no null
if [ -z $checkassignment ]; then
echo "The assignment can not be empty"
exit 1
fi

#Updating the config.env
sed -i "2s/^ASSIGNMENT=.*/ASSIGNMENT=\"$checkassignment\"/" config/config.env

echo "The assignment is updated to $checkassignment"

./startup.sh
