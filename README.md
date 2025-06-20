
# Submission Reminder App

This is a simple shell script project that helps you keep track of which students haven’t submitted a specific assignment. It’s designed to be lightweight and easy to use in a terminal environment.

## How It Works

After setting up the environment, the app will read from a list of students and check their submission status based on the assignment you specify. If a student hasn’t submitted, the app reminds you.

## Project Structure

Once the setup script runs, it creates the following structure:

```
submission_reminder_{YourName}/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
└── startup.sh
```

## Getting Started

1. Run the setup script:
   ```bash
   bash create_environment.sh
   ```

   You’ll be asked to enter your name. A folder named `submission_reminder_{YourName}` will be created with all necessary files.

2. Move into that folder:
   ```bash
   cd submission_reminder_{YourName}
   ```

3. Start the app:
   ```bash
   ./startup.sh
   ```

## Changing the Assignment

To check reminders for a different assignment:

```bash
bash copilot_shell_script.sh
```

Then enter the name of the assignment you want to check.

## Example Student Record Format

The `submissions.txt` file looks like this:

```
student,assignment,status
Chinemerem,Shell Navigation,not submitted
Divine,Shell Navigation,not submitted
Scovia,Git,not submitted
```

The script uses this file to decide who gets a reminder.

## Git Branches

This project follows a simple Git workflow:

- `feature/setup`: All the initial work and changes happen here.
- `main`: Final cleaned-up version with only these files:
  - `create_environment.sh`
  - `copilot_shell_script.sh`
  - `README.md`

## Author

Created by Boaz. You can find me on GitHub: [boaz](https://github.com/boaz)

## License

This project is meant for learning and demonstration purposes.

