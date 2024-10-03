# Backup Script README

## Overview

This script is a Windows Batch file that automates the process of backing up files from a specified source directory to a designated backup destination using the `robocopy` command. It is designed to ensure that all files, including subdirectories, are copied efficiently and reliably.

## How to Use the Script

1. **Download the Script:**
   Save the script to a `.bat` file on your Windows machine. For example, you can name it `backup_script.bat`.

2. **Edit the Script:**
   Open the script in a text editor (e.g., Notepad) and customize the following parameters as needed:
   - **SOURCE:** Change `set "SOURCE=C:\"` to the directory you want to back up. For example, if you want to back up `D:\Documents`, update it to:
     ```batch
     set "SOURCE=D:\Documents"
     ```
   - **DESTINATION:** Modify `set "DESTINATION=%~d0\Backup\Path"` to specify where you want the backup to be saved. This currently sets the destination to a subfolder `Backup\Path` on the drive where the script is executed. You can change it to any valid path, e.g.:
     ```batch
     set "DESTINATION=D:\Backups\Documents"
     ```

3. **Run the Script:**
   - Open Command Prompt.
   - Navigate to the directory where the `.bat` file is saved.
   - Execute the script by typing its name and pressing Enter:
     ```bash
     backup_script.bat
     ```

4. **Monitor the Output:**
   The script will run `robocopy`, which will copy files from the specified source to the destination. A message will be displayed once the backup is completed successfully.

## Script Details

- **robocopy**: The script uses `robocopy` (Robust File Copy), a command-line utility for copying files and directories. The options used in this script are:
  - `/E`: Copies all subdirectories, including empty ones.
  - `/Z`: Enables restartable mode, allowing the copy to resume after interruptions.
  - `/R:3`: Specifies the number of retries on failed copies (3 times).
  - `/W:5`: Sets the wait time between retries to 5 seconds.

## Responsible Usage

When using this script, please keep the following points in mind:

1. **Data Privacy:**
   Ensure that you have permission to copy all files included in the backup, especially if the source directory contains sensitive or personal information.

2. **Backup Destination:**
   Verify that the destination directory has sufficient space to accommodate the backup. Avoid using network drives unless you are certain of their reliability and security.

3. **Regular Backups:**
   Consider scheduling the script to run at regular intervals (e.g., daily, weekly) using Windows Task Scheduler to maintain updated backups.

4. **Test Backups:**
   Periodically check the integrity of your backups to ensure that they can be restored when needed.

5. **Script Modifications:**
   If you modify the script, ensure you understand the changes and test the script with non-critical data before relying on it for important backups.

## Conclusion

This script simplifies the backup process on Windows machines, providing an efficient way to protect your files. By customizing the source and destination paths and using it responsibly, you can help ensure your data remains safe and secure.
