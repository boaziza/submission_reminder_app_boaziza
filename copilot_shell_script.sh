#!/bin/bash

cd submission_reminder_boaz/

echo "Enter the assignment you want to check"

read checkassignment

sed -i "2s/^ASSIGNMENT=.*/ASSIGNMENT=$checkassignment/" config/config.env

./startup.sh
