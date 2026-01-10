@echo off
title USB Write Protection
color 0A
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:MENU
cls
echo ================================================
echo               USB WRITE PROTECTION
echo ================================================
echo.
echo   [1] Enable USB write protection
echo   [2] Disable USB write protection
echo   [3] Check current status
echo   [4] iNfO
echo   [0] Exit
echo.
echo Choose an option (no Enter needed):

choice /c 12340 /n

if errorlevel 5 exit /b
if errorlevel 4 goto ABOUT
if errorlevel 3 goto STATUS
if errorlevel 2 goto DISABLE
if errorlevel 1 goto ENABLE

goto MENU

:ENABLE
cls
echo Enabling USB write protection...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" ^
 /v WriteProtect /t REG_DWORD /d 1 /f >nul
color 0A
echo [OK] USB write protection ENABLED.
pause
goto MENU

:DISABLE
cls
echo Disabling USB write protection...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" ^
 /v WriteProtect /t REG_DWORD /d 0 /f >nul
color 0A
echo [OK] USB write protection DISABLED.
pause
goto MENU

:STATUS
cls
echo Checking current status...
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" /v WriteProtect
echo.
echo 0 = write protection disabled
echo 1 = write protection enabled
pause
goto MENU

:ABOUT
cls
color 0B
echo ================================================
echo                  ABOUT
echo ================================================
echo.
echo            USB Write Protection
echo                Version: 1.0
echo.
echo  author:  Sebastian Januchowski
echo  email:   polsoft.its@fastservice.com
echo  github:  https://github.com/seb07uk
echo.
pause
goto MENU