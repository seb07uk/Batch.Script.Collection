@echo off
REM ============================================
REM   Module:  Example debug.bat
REM   Author:  Sebastian Januchowski
REM   Purpose: Debug logging
REM ============================================

:: Usage: call debug.bat <message>

setlocal
set MSG=%~1
echo [DEBUG] %MSG%
echo [%date% %time%] DEBUG: %MSG% >> debug.log
endlocal
exit /b 0