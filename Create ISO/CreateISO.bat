@echo off
setlocal

:: Find the USB drive dynamically
set "USB_DRIVE="
for /f "tokens=1 delims=" %%i in ('wmic logicaldisk where "drivetype=2" get deviceid ^| findstr /r "^[A-Z]"') do (
    set "USB_DRIVE=%%i"
)

:: Check if a USB drive was found
if not defined USB_DRIVE (
    echo No USB drive found!
    pause
    exit /b
)

:: Set source and destination paths
set SOURCE=C:\
set DESTINATION=%USB_DRIVE%\Backup\backup.iso  ; Path to the ISO file in the "Backup" folder on the USB drive

:: Create the Backup directory if it doesn't exist
mkdir "%USB_DRIVE%\Backup"

:: Create a temporary directory for the files
set TEMP_DIR=%TEMP%\ISO_Temp
mkdir "%TEMP_DIR%"

:: Calculate the size of the source directory
set SIZE=0
for /f "usebackq" %%A in (`dir /s /-c "%SOURCE%" ^| find "File(s)"`) do (
    set SIZE=%%A
)

:: Remove commas for numerical comparison
set SIZE=%SIZE:,=%

:: Get the free space on the USB drive
for /f "tokens=3" %%A in ('wmic logicaldisk where "DeviceID='%USB_DRIVE%'" get FreeSpace /format:value ^| find "="') do (
    set FREE=%%A
)

:: Check if there's enough space
if %FREE% LSS %SIZE% (
    echo Not enough disk space on the USB drive.
    echo Required: %SIZE% bytes, Available: %FREE% bytes.
    goto cleanup
)

:: Copy files to the temporary directory
robocopy "%SOURCE%" "%TEMP_DIR%" /E /Z /R:3 /W:5

:: Load the PowerShell function from the USB drive
powershell -Command "& { . '%USB_DRIVE%\ISOFunction.ps1'; New-IsoFile -Path '%DESTINATION%' -Source '%TEMP_DIR%' }"

:cleanup
:: Clean up temporary directory
rmdir /S /Q "%TEMP_DIR%"

echo ISO creation completed successfully!
pause
