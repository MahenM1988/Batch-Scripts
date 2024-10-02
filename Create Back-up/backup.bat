@echo off
setlocal

set "SOURCE=C:\Users\Mahen Mahindaratne\OneDrive\Desktop\Source"
set "DESTINATION=%~d0\Backup\Path"

:: Perform the backup
robocopy "%SOURCE%" "%DESTINATION%" /E /Z /R:3 /W:5

echo Backup completed successfully!

:end
pause
