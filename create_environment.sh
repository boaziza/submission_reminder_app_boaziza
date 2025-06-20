#!/bin/bash

#Prompting the user to enter their name
echo "Enter your name"

read name

dir=submission_reminder_$name

#Replacing the name of the directory for error handling
sed -i "3s|^if \[ ! -d.*|if [ ! -d \"$dir\" ]; then|" copilot_shell_script.sh

#Replaces the name of the directory immediately in the copilot_script.sh so it does not corrupt
sed -i "8s|^cd.*|cd "$dir"/|" copilot_shell_script.sh

#Checking if the directory exist or if it was created
if [ ! -d $dir ]; then

        mkdir $dir
else
        echo "The directory $dir already exist"

fi

#Changing the directory to the one that just got created
cd $dir

#Checking if the director app is exists
if [ ! -d app ]; then

        #Create the app directory when it does not exists
        mkdir app

        #Create the shell file and appending content into it
        cat <<'EOF' > app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"
# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

#Making the shell script executable
chmod +x app/reminder.sh

fi

#Checking if the modules already exists
if [ ! -d modules ]; then

        mkdir modules

        cat <<'EOF' > modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

EOF
#Making the functions shell script executable
chmod +x modules/functions.sh

        fi
#Checking if the assets exists
if [ ! -d assets ]; then

        mkdir assets

        cat <<'EOF' > assets/submissions.txt

student,assignment,status
Chinemerem,Shell Navigation,not submitted
Chiagoziem,Git,submitted
Divine,Shell Navigation,not submitted
Anissa,Shell Basics,submitted
Alvin,Shell Navigation,not submitted
Shelia,Git,submitted
Kevin,Shell Basics,submitted
Kelia,Shell Navigation,submitted
Scovia,Git,not submitted
Denia,Shell Basics,not submitted

EOF

fi

#Checking if the config directory exists
if [ ! -d config ]; then

        mkdir config

        cat <<'EOF' > config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2


EOF

fi

cat <<'EOF' > startup.sh
#!/bin/bash

echo "Starting up the reminder app..."

./app/reminder.sh

EOF

#Making the startup shell script executable
chmod +x startup.sh
