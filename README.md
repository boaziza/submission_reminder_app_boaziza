# Submission Reminder App

This will consist of two shell scripts that when the are run they will
check who has not submitted and remind them.

#Shell scripts

-create_environment.sh
It creates the submission_reminder_name and places each content in its 
respectful place 

By running ./create_environment.sh

The structure will look like this

submission_reminder_name/
├── app/
│   └── reminder.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
├── modules/
│   └── functions.sh
├── startup.sh
Source:Canvas


-copilot_shell_script.sh

When run it reminds the user which assignment has not been submitted 

It also handles error like entering an assignment which is not assignmet,
when the submission_reminder_name have not been created, and check if the
files has not been created


#Files

-config.env: Contains the assignment that is going to be checked
-submissions.txt: Contains the students name, assignment and submission 
status
-reminder.sh: Loads the config.env and call the functions.sh
-functions.sh: Reads each line in submission file and reminds the user
of the unsubmitted assignments

