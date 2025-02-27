@echo off
REM Define the source directory
set "source_dir="F:\User_Backup\Old users\Developers""

REM Loop through each subfolder in the source directory
for /d %%F in ("%source_dir%\*") do (
    REM Get the folder name
    set "folder_name=%%~nF"
    
    REM Compress the folder into a .rar file in the same directory
    "%ProgramFiles%\WinRAR\WinRAR.exe" a -r -ep1 "%%F.rar" "%%F\*"
    
    REM Check if compression was successful
    if %ERRORLEVEL%==0 (
        echo Compression successful for "%%F". Deleting the folder...
        rmdir /s /q "%%F"
    ) else (
        echo Compression failed for "%%F". Folder will not be deleted.
    )
)

echo All folders processed. Check above for any errors.
pause
