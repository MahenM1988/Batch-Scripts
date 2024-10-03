# File Search and Backup Script README

## Overview

This script is a Windows Batch file that allows users to search for files containing a specific word within a specified directory (defaulting to the Documents folder) and backs them up to a designated destination using the `robocopy` command. It automates the process of locating relevant files and creating a backup, making file management easier.

## How to Use the Script

1. **Download the Script:**
   Save the script to a `.bat` file on your Windows machine. For example, you can name it `search_backup_script.bat`.

2. **Run the Script:**
   - Open Command Prompt.
   - Navigate to the directory where the `.bat` file is saved.
   - Execute the script by typing its name and pressing Enter:
     ```bash
     search_backup_script.bat
     ```

3. **Input Parameters:**
   - **Source Path:** When prompted, enter the path to the directory you want to search. Press Enter to use the default path (Documents).
   - **Search Word:** Enter the word you want to search for in the filenames.

4. **Monitor the Output:**
   The script will search for files containing the specified word in their names within the provided directory. If any files are found, their paths will be displayed, and a backup of those files will be created in the specified destination. If no files are found, a message will indicate this.

## Script Details

- **robocopy**: The script uses `robocopy` (Robust File Copy), a command-line utility for copying files and directories. The options used in this script are:
  - `/E`: Copies all subdirectories, including empty ones.
  - `/Z`: Enables restartable mode, allowing the copy to resume after interruptions.
  - `/R:3`: Specifies the number of retries on failed copies (3 times).
  - `/W:5`: Sets the wait time between retries to 5 seconds.

## Responsible Usage

When using this script, please keep the following points in mind:

1. **Data Privacy:**
   Ensure that you have permission to access and back up all files found during the search, especially if they contain sensitive or personal information.

2. **Backup Destination:**
   Verify that the destination directory has sufficient space to accommodate the backups. Avoid using network drives unless you are certain of their reliability and security.

3. **Regular Backups:**
   Consider scheduling the script to run at regular intervals (e.g., weekly) to ensure important files are regularly backed up.

4. **Test Backups:**
   Periodically check the integrity of your backups to ensure they can be restored when needed.

5. **Script Modifications:**
   If you modify the script, ensure you understand the changes and test the script with non-critical data before relying on it for important backups.

## Conclusion

This script simplifies the process of searching for files by name and backing them up on Windows machines. By customizing the source path and search word, you can efficiently manage your files and protect important data.
