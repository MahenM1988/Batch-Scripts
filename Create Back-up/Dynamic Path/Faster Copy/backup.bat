@echo off
setlocal enabledelayedexpansion

:: Define log file path
set "LOGFILE=%~d0\Backup\backup_log.txt"

:: Create or clear the log file
echo Backup Log - %date% %time% > "%LOGFILE%"
echo ========================================= >> "%LOGFILE%"

:: List of processes to suspend (modify as needed)
set "PROCESSES=notepad.exe chrome.exe"

:: Create destination directory if it doesn't exist
set "DESTINATION=%~d0\Backup\Path"
if not exist "%DESTINATION%" mkdir "%DESTINATION%"

:: Suspend specified processes
for %%P in (%PROCESSES%) do (
    echo Suspending %%P... >> "%LOGFILE%"
    powershell -command "Get-Process %%P -ErrorAction SilentlyContinue | Suspend-Process"
)

:: Array of folders to back up
set FOLDERS=Desktop Documents Downloads Pictures Videos

:: Loop through each folder and back them up
for %%F in (%FOLDERS%) do (
    set "SOURCE=%USERPROFILE%\%%F"
    
    if exist "!SOURCE!" (
        echo Attempting to back up %%F... >> "%LOGFILE%"
        robocopy "!SOURCE!" "!DESTINATION!\%%F" /E /Z /R:3 /W:5 >> "%LOGFILE%" 2>&1
        if !ERRORLEVEL! neq 0 (
            echo Backup of %%F failed or access denied! >> "%LOGFILE%"
        ) else (
            echo Backup of %%F completed successfully! >> "%LOGFILE%"
        )
    ) else (
        echo Source directory "!SOURCE!" does not exist! >> "%LOGFILE%"
    )
)

:: Resume suspended processes
for %%P in (%PROCESSES%) do (
    echo Resuming %%P... >> "%LOGFILE%"
    powershell -command "Get-Process %%P -ErrorAction SilentlyContinue | Resume-Process"
)

echo ========================================= >> "%LOGFILE%"
echo Backup process completed. >> "%LOGFILE%"

:end
pause
