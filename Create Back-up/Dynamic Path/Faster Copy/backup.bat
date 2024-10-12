@echo off
setlocal enabledelayedexpansion

:: List of processes to suspend (modify as needed)
set "PROCESSES=notepad.exe chrome.exe"

:: Create destination directory if it doesn't exist
set "DESTINATION=%~d0\Backup\Path"
if not exist "%DESTINATION%" mkdir "%DESTINATION%"

:: Suspend specified processes
for %%P in (%PROCESSES%) do (
    echo Suspending %%P...
    powershell -command "Get-Process %%P -ErrorAction SilentlyContinue | Suspend-Process"
)

:: Array of folders to back up
set FOLDERS=Desktop Documents Downloads Pictures Videos

:: Loop through each folder and back them up
for %%F in (%FOLDERS%) do (
    set "SOURCE=%USERPROFILE%\%%F"
    
    if exist "!SOURCE!" (
        robocopy "!SOURCE!" "!DESTINATION!\%%F" /E /Z /R:3 /W:5
        if !ERRORLEVEL! neq 0 (
            echo Backup of %%F failed!
        ) else (
            echo Backup of %%F completed successfully!
        )
    ) else (
        echo Source directory "!SOURCE!" does not exist!
    )
)

:: Resume suspended processes
for %%P in (%PROCESSES%) do (
    echo Resuming %%P...
    powershell -command "Get-Process %%P -ErrorAction SilentlyContinue | Resume-Process"
)

:end
pause
