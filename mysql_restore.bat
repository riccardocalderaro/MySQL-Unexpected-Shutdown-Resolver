@echo off
setlocal EnableDelayedExpansion

REM Prompt user about database backup
set /p backup_prompt=Did you make a backup of your database before running this script? (Y/N): 
if /i "%backup_prompt%"=="N" (
    echo WARNING: You have chosen not to make a backup of your database.
    echo The author will not be responsible for any data loss.
)

REM Prompt user to proceed
set /p proceed_prompt=Are you sure you want to proceed? (Y/N): 
if /i "%proceed_prompt%"=="N" (
    echo Exiting the script.
    pause
    exit /b 1
)

REM Step 1: Rename folder C:\xampp\mysql\data to C:\xampp\mysql\data_old (if exists, delete it first)
if exist "C:\xampp\mysql\data_old" rd /s /q "C:\xampp\mysql\data_old"
move "C:\xampp\mysql\data" "C:\xampp\mysql\data_old"

REM Check for errors during Step 1
if %errorlevel% neq 0 (
    echo ERROR: An error occurred during Step 1. Exiting the script.
    echo Move operation failed.
    pause
    exit
)

REM Step 2: Make a copy of C:\xampp\mysql\backup and rename the copy as C:\xampp\mysql\data
xcopy /E /I "C:\xampp\mysql\backup" "C:\xampp\mysql\data"

REM Check for errors during Step 2
if %errorlevel% neq 0 (
    echo ERROR: An error occurred during Step 2. Exiting the script.
    echo Xcopy operation failed.
    pause
    exit
)

REM Step 3: Copy the file ibdata1 and all database folders from data_old to the new data folder (excluding specified folders)
copy "C:\xampp\mysql\data_old\ibdata1" "C:\xampp\mysql\data\" /Y

REM Check for errors during Step 3
if %errorlevel% neq 0 (
    echo ERROR: An error occurred during Step 3. Exiting the script.
    echo Copy operation failed.
    pause
    exit
)

REM Copy all database folders from data_old to the new data folder (excluding specified folders)
for /D %%F in ("C:\xampp\mysql\data_old\*") do (
    set "folder_name=%%~nxF"
    if not "!folder_name!"=="mysql" if not "!folder_name!"=="performance_schema" if not "!folder_name!"=="phpmyadmin" if not "!folder_name!"=="test" (
        xcopy /E /I "%%F" "C:\xampp\mysql\data\!folder_name!"
        
        REM Check for errors during folder copy
        if %errorlevel% neq 0 (
            echo ERROR: An error occurred while copying folder !folder_name!. Exiting the script.
            echo Xcopy operation failed.
            pause
            exit
        )
    )
)

endlocal
