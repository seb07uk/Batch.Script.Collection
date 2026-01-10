@echo off
title CMD Cli RegEditer v1.0 - ADMIN MODE
color 0A
chcp 852 >nul

:: --- INITIALIZE LOG FILE ---
set "log=%userprofile%\.polsoft\psCLI\Log\RegEditer_%date%.log"

if not exist "%userprofile%\.polsoft\psCLI\Log" (
    mkdir "%userprofile%\.polsoft\psCLI\Log"
)

echo [%date% %time%] Program started. >> "%log%"

:: --- ADMIN PRIVILEGE ENFORCEMENT SECTION ---
:check_permissions
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :menu
) else (
    echo [i] Requesting administrator privileges...
    powershell -Command "Start-Process '%0' -Verb RunAs"
    echo [%date% %time%] Relaunching with admin privileges. >> "%log%"
    exit /b
)
:: -------------------------------------------

:menu
cls
echo.
echo  [92m ____________________________________________polsoft.ITS London_[0m
echo  [92m^|                                                               ^|[0m
echo  [92m^|   _____   ______  _____  ______ _____ _____ _______ ______    ^|[0m
echo  [92m^|  ^|_____] ^|______ ^|  __  ^|______   ^|     ^|   ^|______ ^|_____/   ^|[0m
echo  [92m^|  ^|   ^|   ^|______ ^|__^|^|  ^|______ __^|__   ^|   ^|______ ^|    \_   ^|[0m
echo  [92m^|                                                               ^|[0m
echo  [92m^|        CMD Cli RegEditer v1.0                                 ^|[0m
echo  [92m^|                    STATUS: ADMIN PRIVILEGES GRANTED           ^|[0m
echo  [92m^|_______________________________________________________________^|[0m
echo.
echo  [1] ADD NEW ENTRY (REG_SZ)
echo  [2] DELETE KEY OR VALUE
echo  [3] EXPORT TO .REG FILE
echo  [4] BROWSE KEY (QUERY)
echo  [5] OPEN SYSTEM REGEDIT
echo  [6] INFORMATION
echo  [H] HELP
echo  [Q] EXIT
echo.
echo  ---------------------------------------------------------------
set /p choice="Select an option and press ENTER: "

if /i "%choice%"=="1" goto add
if /i "%choice%"=="2" goto delete
if /i "%choice%"=="3" goto export
if /i "%choice%"=="4" goto query
if /i "%choice%"=="5" (
    echo [%date% %time%] OPEN REGEDIT >> "%log%"
    start regedit.exe
    goto menu
)
if /i "%choice%"=="6" goto about
if /i "%choice%"=="h" goto help
if /i "%choice%"=="q" (
    echo [%date% %time%] Program terminated by user. >> "%log%"
    exit
)
goto menu

:add
cls
echo.
echo  [ ADD MODE ]
echo  Example: HKLM\Software\MyCompany
set /p key="PATH: "
set /p name="VALUE NAME: "
set /p data="CONTENT (DATA): "
reg add "%key%" /v "%name%" /t REG_SZ /d "%data%" /f

echo [%date% %time%] ADD: Key="%key%" Name="%name%" Data="%data%" >> "%log%"

echo.
echo  OPERATION COMPLETED.
pause
goto menu

:delete
cls
echo.
echo  [ DELETE MODE ]
set /p key="KEY PATH: "
set /p name="VALUE NAME (empty = entire key): "

if "%name%"=="" (
    reg delete "%key%" /f
    echo [%date% %time%] DELETE: Entire key "%key%" >> "%log%"
) else (
    reg delete "%key%" /v "%name%" /f
    echo [%date% %time%] DELETE: Key="%key%" Value="%name%" >> "%log%"
)

pause
goto menu

:export
cls
echo.
echo  [ EXPORTING ]
set /p key="KEY TO EXPORT: "
set /p file="FILE NAME (e.g. backup.reg): "
reg export "%key%" "%file%"

echo [%date% %time%] EXPORT: Key="%key%" File="%file%" >> "%log%"

pause
goto menu

:query
cls
echo.
echo  [ REGISTRY VIEW ]
set /p key="ENTER KEY: "
reg query "%key%"

echo [%date% %time%] QUERY: Key="%key%" >> "%log%"

echo.
pause
goto menu

:help
cls
echo.
echo  [92m===========================[ HELP ]=============================[0m
echo.
echo  [97mThis tool allows you to perform basic operations on the[0m
echo  [97mWindows Registry directly from the command line (CMD).[0m
echo  [97mAdministrator privileges are required.[0m
echo.
echo  [92m-----------------------------[ OPTIONS ]------------------------[0m
echo.
echo  [96m[1] ADD NEW ENTRY (REG_SZ)[0m
echo      [97mAdds a REG_SZ value to the specified key.[0m
echo.
echo  [96m[2] DELETE KEY OR VALUE[0m
echo      [97mDeletes an entire registry branch or a specific value.[0m
echo.
echo  [96m[3] EXPORT TO .REG FILE[0m
echo      [97mCreates a backup of the specified registry key.[0m
echo.
echo  [96m[4] BROWSE KEY (QUERY)[0m
echo      [97mDisplays values, types, and data inside a key.[0m
echo.
echo  [96m[5] OPEN SYSTEM REGEDIT[0m
echo      [97mOpens the graphical Windows Registry Editor.[0m
echo.
echo  [96m[6] ABOUT / INFORMATION[0m
echo      [97mInformation about the author and tool version.[0m
echo.
echo  [96m[Q] EXIT[0m
echo      [97mCloses the program.[0m
echo.
echo  [92m------------------------[ ADDITIONAL NOTES ]--------------------[0m
echo.
echo  [1;33m- The program automatically checks for administrator rights.[0m
echo  [1;33m- If privileges are missing, it restarts itself with "RunAs".[0m
echo  [1;33m- All operations are logged to:[0m
echo      [1;33m%userprofile%\.polsoft\psCLI\Log\RegEditer_data.log[0m
echo.
echo  [92m================================================================[0m
echo.
pause
goto menu

:about
cls
echo.
echo  =====================[ ABOUT / INFORMATION ]=====================
echo.
echo              [1;3;32mCMD Cli RegEditer v1.0[0m
echo.
echo    [2;3mAuthor :[0;3m  Sebastian Januchowski
echo    [2;3mEmail  :[0;3m  polsoft.its@fastservice.com
echo    [2;3mGitHub :[0;3m  https://github.com/seb07uk
echo.
echo    [1;33mCMD Cli RegEditer v1.0
echo    A tool for working with the Windows Registry in text mode.[0m
echo.
echo  =================================================================
echo.
pause
goto menu