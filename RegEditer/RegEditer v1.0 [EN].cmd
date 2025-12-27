@echo off
title CMD Cli RegEditer v1.0 - ADMIN MODE
color 0A
chcp 852 >nul

:: --- ADMIN PRIVILEGE ENFORCEMENT SECTION ---
:check_permissions
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :menu
) else (
    echo [i] Requesting administrator privileges...
    powershell -Command "Start-Process '%0' -Verb RunAs"
    exit /b
)
:: -------------------------------------------
:: --- INITIALIZE LOG FILE ---
set "log=%userprofile%\.polsoft\psCLI\Log\RegEditer_data.log"
if not exist "%userprofile%\.polsoft\psCLI\Log" (
    mkdir "%userprofile%\.polsoft\psCLI\Log"
)
echo [%date% %time%] Program started. >> "%log%"
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
if /i "%choice%"=="5" start regedit.exe & goto menu
if /i "%choice%"=="6" goto about
if /i "%choice%"=="h" goto help
if /i "%choice%"=="q" exit
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
if "%name%"=="" (reg delete "%key%" /f) else (reg delete "%key%" /v "%name%" /f)
pause
goto menu

:export
cls
echo.
echo  [ EXPORTING ]
set /p key="KEY TO EXPORT: "
set /p file="FILE NAME (e.g. backup.reg): "
reg export "%key%" "%file%"
pause
goto menu

:query
cls
echo.
echo  [ REGISTRY VIEW ]
set /p key="ENTER KEY: "
reg query "%key%"
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
echo  [92m-----------------------------[ OPTIONS ]-------------------------[0m
echo.
echo  [96m[1] ADD NEW ENTRY (REG_SZ)[0m
echo      [97mAdds a REG_SZ value to the specified key.[0m
echo      [97mRequired data:[0m
echo        - key path
echo        - value name
echo        - content (data)
echo      [93mCommand:[0m
echo        [93mreg add "KEY" /v "NAME" /t REG_SZ /d "DATA" /f[0m
echo.
echo  [96m[2] DELETE KEY OR VALUE[0m
echo      [97mDeletes an entire registry branch or a specific value.[0m
echo      [97mIf the value name is empty — the entire key is deleted.[0m
echo      [93mCommands:[0m
echo        [93mreg delete "KEY" /f[0m
echo        [93mreg delete "KEY" /v "NAME" /f[0m
echo.
echo  [96m[3] EXPORT TO .REG FILE[0m
echo      [97mCreates a backup of the specified registry key.[0m
echo      [93mCommand:[0m
echo        [93mreg export "KEY" "file.reg"[0m
echo.
echo  [96m[4] BROWSE KEY (QUERY)[0m
echo      [97mDisplays values, types, and data inside a key.[0m
echo      [93mCommand:[0m
echo        [93mreg query "KEY"[0m
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
echo  [92m------------------------[ ADDITIONAL NOTES ]----------------------[0m
echo.
echo  [1;33m- The program automatically checks for administrator rights.
echo  - If privileges are missing, it restarts itself with "RunAs".
echo  - REG_SZ values are added using the /f (force) parameter.
echo  - Registry paths must be provided in full form:
echo      HKLM\Software\...\...
echo      HKCU\Software\...\...[0m
echo.
echo  [92m==================================================================[0m
echo.
pause
goto menu
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