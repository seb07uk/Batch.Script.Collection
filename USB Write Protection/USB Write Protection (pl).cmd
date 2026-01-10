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
echo   [1] Wlacz blokade zapisu USB
echo   [2] Wylacz blokade zapisu USB
echo   [3] Sprawdz aktualny stan
echo   [4] iNfO
echo   [0] Wyjdz
echo.
echo Wybierz opcje (bez Enter):

choice /c 12340 /n

if errorlevel 5 exit /b
if errorlevel 4 goto ABOUT
if errorlevel 3 goto STAN
if errorlevel 2 goto WYLACZ
if errorlevel 1 goto WLACZ

goto MENU

:WLACZ
cls
echo Wlaczanie blokady zapisu USB...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" ^
 /v WriteProtect /t REG_DWORD /d 1 /f >nul
color 0A
echo [OK] Blokada zapisu zostala WLACZONA.
pause
goto MENU

:WYLACZ
cls
echo Wylaczanie blokady zapisu USB...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" ^
 /v WriteProtect /t REG_DWORD /d 0 /f >nul
color 0A
echo [OK] Blokada zapisu zostala WYLACZONA.
pause
goto MENU

:STAN
cls
echo Sprawdzanie aktualnego stanu...
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" /v WriteProtect
echo.
echo 0 = blokada wylaczona
echo 1 = blokada wlaczona
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
echo                Wersja: 1.0
echo.
echo  author:  Sebastian Januchowski
echo  email:   polsoft.its@fastservice.com
echo  github:  https://github.com/seb07uk
echo.
pause
goto MENU