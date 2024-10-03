@echo off
setlocal

:: Get the current user's Documents folder path
for %%D in ("%USERPROFILE%\Documents") do set "SOURCE=%%~D"

:: Set the destination path
set "DESTINATION=%~d0\Backup\Path"

:: Perform the backup
robocopy "%SOURCE%" "%DESTINATION%" /E /Z /R:3 /W:5

echo Backup completed successfully!

:end
pause
