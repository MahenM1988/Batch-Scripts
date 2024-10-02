@echo off
setlocal

set SOURCE=C:\Users\Mahen Mahindaratne\OneDrive\Desktop\Source
set DESTINATION=%~d0\Backup\Path

:: Calculate the size of the source directory
set SIZE=0
for /f "usebackq" %%A in (`dir /s /-c "%SOURCE%" ^| find "File(s)"`) do (
    set SIZE=%%A
)

:: Remove commas for numerical comparison
set SIZE=%SIZE:,=%

:: Get the free space on the destination drive
for /f "tokens=3" %%A in ('wmic logicaldisk where "DeviceID='%~d0'" get FreeSpace /format:value ^| find "="') do (
    set FREE=%%A
)

:: Check if there's enough space
if %FREE% LSS %SIZE% (
    echo Not enough disk space on the destination drive.
    echo Required: %SIZE% bytes, Available: %FREE% bytes.
    goto end
)

:: Perform the backup
robocopy "%SOURCE%" "%DESTINATION%" /E /Z /R:3 /W:5

echo Backup completed successfully!

:end
pause
