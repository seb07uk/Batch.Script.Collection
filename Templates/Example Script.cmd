@echo off
REM ============================================
REM   Name:    ExampleScript.bat
REM   Author:  Sebastian Januchowski
REM   Purpose: Batch script template
REM   Date:    %date% %time%
REM ============================================

:: Configuration section
setlocal enabledelayedexpansion
set LOGFILE=script.log

:: Logging function
:log
echo [%date% %time%] %~1 >> %LOGFILE%
goto :eof

:: Main logic
echo Starting script...
call :log "Script has started"

:: Example loop
for %%i in (1 2 3) do (
    echo Iteration %%i
    call :log "Iteration %%i completed"
)

:: Error handling
if %errorlevel% neq 0 (
    echo An error occurred: %errorlevel%
    call :log "Error: %errorlevel%"
    exit /b %errorlevel%
)

:: Finish
echo Script finished successfully.
call :log "Script finished successfully"
endlocal
exit /b 0