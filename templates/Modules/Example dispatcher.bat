@echo off
REM ============================================
REM   Dispatcher: Example dispatcher.bat
REM   Author:     Sebastian Januchowski
REM   Purpose:    Centralized module dispatcher
REM ============================================

setlocal

:: Example usage
call colors.bat 0A
call debug.bat "Dispatcher started"
call deploy.bat "Production"

if %errorlevel% neq 0 (
    call error.bat "Dispatcher encountered an error"
    exit /b %errorlevel%
)

call debug.bat "Dispatcher finished successfully"
endlocal
exit /b 0