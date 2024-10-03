@echo off
setlocal

:: Get the source path from the user
set /p "SOURCE=Enter the path to search (default is Documents): "
if "%SOURCE%"=="" set "SOURCE=%USERPROFILE%\Documents"

:: Set the destination path
set "DESTINATION=%~d0\Backup\Path"

:: Get the search word from the user
set /p "SEARCH_WORD=Enter the search word: "

:: Create a temporary file to store matched files
set "TEMP_FILE=%TEMP%\matched_files.txt"
if exist "%TEMP_FILE%" del "%TEMP_FILE%"

:: Search for files containing the search word
echo Searching for files...
for /r "%SOURCE%" %%F in (*%SEARCH_WORD%*) do (
    echo %%F >> "%TEMP_FILE%"
)

:: Check if any files were found
if exist "%TEMP_FILE%" (
    echo Files found:
    type "%TEMP_FILE%"
    
    :: Perform the backup for found files
    for /f "usebackq delims=" %%F in ("%TEMP_FILE%") do (
        robocopy "%%~dpF" "%DESTINATION%" "%%~nxF" /E /Z /R:3 /W:5
    )
    
    echo Backup of found files completed successfully!
) else (
    echo No files found containing "%SEARCH_WORD%".
)

:: Clean up
del "%TEMP_FILE%"

:end
pause
