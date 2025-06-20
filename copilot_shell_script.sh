#!/bin/bash
#check if the directory exists before executing
if [ ! -d "submission_reminder_boaz" ]; then
echo "First run the create_environment.sh script"
exit 1
fi

cd submission_reminder_boaz/
#Prompt the user for the assignment the want to check
echo "Enter the assignment you want to check"

read checkassignment

#Checking if the assignment is not null
if [ -z "$checkassignment" ]; then
echo "The assignment can not be empty"
exit 1
fi

#Checking if the config.env was created
if [ ! -f config/config.env ]; then
echo "The config.env does not exist"
echo "Make sure you run the create_environment.sh first"
exit 1
fi

#Checking if the assignment is correct
if ! grep -q "$checkassignment" assets/submissions.txt; then
    echo "$checkassignment is not in the assignments, check your input"
    exit 1
fi

#Updating the config.env
sed -i "2s/^ASSIGNMENT=.*/ASSIGNMENT=\"$checkassignment\"/" config/config.env

echo "The assignment is updated to $checkassignment"

#Checking if the startup.sh was created
if [ ! -f startup.sh ]; then
echo "First run the create_environment.sh"
exit 1
fi

./startup.sh
