@echo off
REM ============================================
REM   Module:  Example deploy.bat
REM   Author:  Sebastian Januchowski
REM   Purpose: Deployment logic
REM ============================================

:: Usage: call deploy.bat <target>

setlocal
set TARGET=%~1
if "%TARGET%"=="" (
    call error.bat "No deployment target specified"
    exit /b 1
)

echo Deploying to %TARGET%...
call debug.bat "Deployment started for %TARGET%"
:: [Insert deployment steps here]
call debug.bat "Deployment finished for %TARGET%"
endlocal
exit /b 0