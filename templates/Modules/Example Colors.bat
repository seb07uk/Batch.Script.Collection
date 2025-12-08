@echo off
REM ============================================
REM   Module:  Ezample colors.bat
REM   Author:  Sebastian Januchowski
REM   Purpose: Centralized color handling
REM ============================================

:: Usage: call colors.bat <colorCode>
:: Example: call colors.bat 0A

if "%~1"=="" (
    echo [ERROR] No color code provided.
    exit /b 1
)

color %~1
exit /b 0