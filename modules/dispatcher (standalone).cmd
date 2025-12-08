:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
chcp 65001 >nul
setlocal

:: Check if an argument was provided
if "%~1"=="" (
    echo Usage: %~n0 [command] [arguments...]
    echo.
    echo Available commands:
    echo   hello     - Displays a greeting.
    echo   info      - Displays system information.
    echo   help      - Displays this help.
    goto :eof
)

:: Set the first argument as the command, and the rest as arguments
set "COMMAND=%~1"
shift

:: Jump to the appropriate section (label) based on the command
call :%COMMAND%

:: Check if the command was found
if errorlevel 1 (
    echo Error: Unknown command "%COMMAND%".
    echo Type "%~n0 help" for help.
)

goto :eof

:: --- Command Sections ---

:hello
    echo Hello! I am a simple dispatcher.
    echo You provided the following arguments: %*
    goto :eof

:info
    echo System information:
    systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"Host Name" /C:"Total Physical Memory"
    goto :eof

:help
    echo This is simple help for the script %~n0.
    echo.
    echo The script calls the appropriate function (label) based on the first argument.
    echo.
    echo Syntax: %~n0 [command] [arguments...]
    echo.
    echo Available commands:
    echo   hello     - Displays a greeting.
    echo   info      - Displays system information (OS, memory).
    echo   help      - Displays this help.
    goto :eof

:: --- End of Script ---