:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
chcp 65001 >nul
title CMD CLI FILE MANAGER PRO
mode con: cols=95 lines=35
color 0F

:: ANSI Color Definitions (Requires Windows 10/11)
set "ESC= "
set "G=%ESC%[92m"
set "R=%ESC%[91m"
set "Y=%ESC%[93m"
set "B=%ESC%[94m"
set "RESET=%ESC%[0m"

:menu
cls
echo %B%╔═══════════════════════════════════════════════════════════════════════════════════════════╗%RESET%
echo %B%║                                   Simple File Manager                                     ║%RESET%
echo %B%╠═══════════════════════════════════════════════════════════════════════════════════════════╣%RESET%
echo    LOCATION: %Y%%cd%%RESET%
echo %B%╠═══════════════════════════════════════════════════════════════════════════════════════════╣%RESET%
echo    [1] REFRESH         [2] ENTER (CD)        [3] UP (..)           [4] NEW FOLDER
echo    [5] DELETE FILE     [6] RENAME            [7] COPY (ROBO)       [8] DISK INFO
echo    [9] EXIT
echo %B%╚═══════════════════════════════════════════════════════════════════════════════════════════╝%RESET%
echo.
echo %Y% DIRECTORY CONTENT:%RESET%
echo  ─────────────────────────────────────────────────────────────────────────────────────────────
dir /w /o:g /q
echo  ─────────────────────────────────────────────────────────────────────────────────────────────
echo.
if defined msg echo %msg% & set "msg="
set /p "opcja=CMD CLI > Select option: "

if "%opcja%"=="1" goto menu
if "%opcja%"=="2" goto wejdz
if "%opcja%"=="3" goto gora
if "%opcja%"=="4" goto mkdir
if "%opcja%"=="5" goto usun
if "%opcja%"=="6" goto ren
if "%opcja%"=="7" goto kopiuj
if "%opcja%"=="8" goto info
if "%opcja%"=="9" exit
set "msg=%R%[!] Invalid selection!%RESET%"
goto menu

:wejdz
set /p "folder= [?] Enter folder: "
if not exist "%folder%" (set "msg=%R%[!] ERROR: Folder '%folder%' does not exist!%RESET%" & goto menu)
cd /d "%folder%"
goto menu

:gora
cd ..
goto menu

:mkdir
set /p "n_f= [+] New folder name: "
mkdir "%n_f%" 2>nul && (set "msg=%G%[+] Success: Folder '%n_f%' created%RESET%") || (set "msg=%R%[!] ERROR: Could not create folder!%RESET%")
goto menu

:usun
set /p "p_u= [!] File to delete: "
if not exist "%p_u%" (set "msg=%R%[!] ERROR: File '%p_u%' does not exist!%RESET%" & goto menu)
del /q "%p_u%" 2>nul && (set "msg=%G%[+] Success: Deleted '%p_u%'%RESET%") || (set "msg=%R%[!] ERROR: Permission denied or file in use!%RESET%")
goto menu

:ren
set /p "stara= [!] Current name: "
set /p "nowa= [!] New name: "
if not exist "%stara%" (set "msg=%R%[!] ERROR: Object '%stara%' does not exist!%RESET%" & goto menu)
ren "%stara%" "%nowa%" 2>nul && (set "msg=%G%[+] Success: Renamed to '%nowa%'%RESET%") || (set "msg=%R%[!] ERROR: Name taken or permission denied!%RESET%")
goto menu

:kopiuj
set /p "src= [?] Source: "
set /p "dst= [?] Destination: "
robocopy "%src%" "%dst%" /e
if %ERRORLEVEL% GEQ 8 (set "msg=%R%[!] ERROR: Copying failed!%RESET%") else (set "msg=%G%[+] Copying completed.%RESET%")
goto menu

:info
cls
echo.
echo %B%═══ FILE SYSTEM INFORMATION ═══%RESET%
vol
echo.
echo %B%═══ FREE SPACE ═══%RESET%
:: Using 'free' as a keyword for the English version of Windows
dir | find "free"
if %ERRORLEVEL% NEQ 0 dir | find "bytes"
echo.
pause
goto menu