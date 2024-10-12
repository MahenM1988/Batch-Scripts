@echo off
setlocal enabledelayedexpansion

:: Create destination directory if it doesn't exist
set "DESTINATION=%~d0\Backup\Path"
if not exist "%DESTINATION%" mkdir "%DESTINATION%"

:: Array of folders to back up
set FOLDERS=Desktop Documents Downloads Pictures Videos

:: Loop through each folder and back them up
for %%F in (%FOLDERS%) do (
    set "SOURCE=%USERPROFILE%\%%F"
    
    :: Check if the source directory exists before trying to back it up
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

:end
pause
