# Backup Script

This batch script automates the backup of specific user folders (Desktop, Documents, Downloads, Pictures, and Videos) to a designated backup path on the same drive.

## Features

- Backs up specified folders from the user's profile directory.
- Creates the backup directory if it does not exist.
- Uses `robocopy` for robust file copying.
- Provides success or error messages for each folder backup attempt.

## Requirements

- Windows operating system (the script is designed for Windows batch processing).
- User must have permissions to access the specified folders and create the backup directory.

## Usage

1. **Download the Script**: Save the script to a `.bat` file, for example, `backup_script.bat`.

2. **Modify Destination Path** (if necessary):
   - Open the script in a text editor.
   - Change the `DESTINATION` variable in the script to your preferred backup location, if needed.

3. **Run the Script**:
   - Double-click the `.bat` file or run it from a Command Prompt window.
   - The script will back up the specified folders and display messages indicating the status of each backup.

## How It Works

- The script starts by defining the destination path for backups.
- It checks for the existence of each specified folder.
- For each folder, it uses `robocopy` to copy all files and subdirectories, preserving their structure.
- It checks for errors during the copying process and provides feedback.

## Notes

- The backup directory will be created in the same drive as the script if it does not exist.
- Be careful when modifying the script, especially if changing the `robocopy` parameters, as this could lead to data loss (e.g., using the `/MIR` option).

## Example Output

When you run the script, you will see output similar to the following:

