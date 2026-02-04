@echo off
 ============================================
 Example test script
 Author polsoft.ITS™
 Date 2026-01-27
 Description Demonstration of dbbatch capabilities
 ============================================

setlocal EnableDelayedExpansion

 Configuration
set SCRIPT_NAME=test_script
set VERSION=1.0.0

 Welcome
echo ================================================
echo         polsoft.ITS - Test Script
echo ================================================
echo.

 System information
echo [INFO] Version %VERSION%
echo [INFO] Date %DATE% %TIME%
echo [INFO] System %OS%
echo.

 Checking directories
echo [CHECK] Checking directories...
if exist CWindows (
    echo [OK] Windows directory exists
) else (
    echo [ERROR] Windows directory missing
)

 Environment variables
echo.
echo [INFO] Environment variables
echo - USERNAME %USERNAME%
echo - COMPUTERNAME %COMPUTERNAME%
echo - PATH defined OK

 Loop test
echo.
echo [PROCESS] FOR loop test
for L %%i in (1,1,5) do (
    echo   Iteration %%i
)

 Finish
echo.
echo ================================================
echo [SUCCESS] Script finished successfully
echo ================================================
pause

endlocal
exit b 0