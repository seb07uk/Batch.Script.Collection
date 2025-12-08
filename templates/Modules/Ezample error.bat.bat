@echo off
REM ============================================
REM   Module:  Example error.bat
REM   Author:  Sebastian Januchowski
REM   Purpose: Error handling and logging
REM ============================================

:: Usage: call error.bat <message>

setlocal
set MSG=%~1
echo [ERROR] %MSG%
echo [%date% %time%] ERROR: %MSG% >> error.log
endlocal
exit /b 1