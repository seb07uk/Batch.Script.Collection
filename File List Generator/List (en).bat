@echo off
chcp 65001 >nul
setlocal ENABLEDELAYEDEXPANSION

:: ============================================
::  ANSI COLORS
:: ============================================
set green=[92m
set yellow=[93m
set red=[91m
set blue=[94m
set cyan=[96m
set reset=[0m

:: ============================================
::  LOGGING
:: ============================================
set "LOG=%userprofile%\.polsoft\psCLI\Log\List.log"

if not exist "%userprofile%\.polsoft\psCLI\Log" (
    mkdir "%userprofile%\.polsoft\psCLI\Log"
)

echo [%date% %time%] Program started >> "%LOG%"

:: ============================================
::  DEFAULT SAVE LOCATION
:: ============================================
set "OUTPUT=%userprofile%\Desktop\list.txt"

:: ============================================
::  SOURCE DIRECTORY SELECTION
:: ============================================
set "SRC=%cd%"

:choose_dir
cls
echo %cyan%============================================%reset%
echo %green%            FILE LIST GENERATOR%reset%
echo %cyan%============================================%reset%
echo.
echo Current source directory:
echo   %yellow%%SRC%%reset%
echo.
echo   [Z] Change directory
echo   [D] Continue
echo   [L] Save location
echo   [A] About
echo.
echo ► Choose an option (no Enter)...

choice /c zdla /n >nul

if errorlevel 4 goto about
if errorlevel 3 goto choose_output
if errorlevel 2 goto menu
if errorlevel 1 goto change_dir

goto choose_dir

:change_dir
echo.
set /p SRC=► Enter new directory: 
if not exist "%SRC%" (
    echo %red%✖ Directory does not exist.%reset%
    pause
    goto choose_dir
)
echo [%date% %time%] Directory changed to "%SRC%" >> "%LOG%"
goto choose_dir

:: ============================================
::  SAVE LOCATION MENU
:: ============================================
:choose_output
cls
echo %cyan%============================================%reset%
echo %green%          FILE SAVE LOCATION%reset%
echo %cyan%============================================%reset%
echo.
echo   [D] Desktop
echo   [S] Same as source directory
echo   [C] Custom path
echo.
echo ► Choose an option (no Enter)...

choice /c dsc /n >nul

if errorlevel 3 goto output_custom
if errorlevel 2 goto output_src
if errorlevel 1 goto output_desktop

goto choose_output

:output_desktop
set "OUTPUT=%userprofile%\Desktop\list.txt"
echo [%date% %time%] Save location set to Desktop >> "%LOG%"
call :done "Save location set to Desktop."
goto choose_dir

:output_src
set "OUTPUT=%SRC%\list.txt"
echo [%date% %time%] Save location set to source directory >> "%LOG%"
call :done "Save location set to source directory."
goto choose_dir

:output_custom
echo.
set /p OUTPUT=► Enter full save path (with filename): 
echo [%date% %time%] Save location set to: %OUTPUT% >> "%LOG%"
call :done "Save location set to custom path."
goto choose_dir

:: ============================================
::  ABOUT
:: ============================================
:about
cls
echo %blue%============================================%reset%
echo %green%                 ABOUT%reset%
echo %blue%============================================%reset%
echo.
echo   %yellow%Author:%reset%  Sebastian Januchowski
echo   %yellow%Email:%reset%  polsoft.its@fastservice.com
echo   %yellow%GitHub:%reset% https://github.com/seb07uk
echo.
echo Press any key to return...
pause >nul
goto choose_dir

:: ============================================
::  MAIN MENU
:: ============================================
:menu
cls
echo %blue%============================================%reset%
echo %green%      FILE LIST GENERATOR — MENU%reset%
echo %blue%============================================%reset%
echo.
echo   %yellow%[1]%reset% File and folder names
echo   %yellow%[2]%reset% Files only (no folders)
echo   %yellow%[3]%reset% Hidden/system files
echo   %yellow%[4]%reset% Filter by extension
echo   %yellow%[0]%reset% Exit
echo.
echo Current output file:
echo   %yellow%%OUTPUT%%reset%
echo.
echo ► Choose an option (no Enter)...

choice /c 12340 /n >nul

if errorlevel 5 goto end
if errorlevel 4 goto option4
if errorlevel 3 goto option3
if errorlevel 2 goto option2
if errorlevel 1 goto option1

goto menu

:: ============================================
::  OPTIONS
:: ============================================

:option1
dir /b "%SRC%" > "%OUTPUT%"
echo [%date% %time%] Option 1 — file and folder names >> "%LOG%"
call :show_list "Saved: file and folder names."
goto menu

:option2
dir /b /a:-d "%SRC%" > "%OUTPUT%"
echo [%date% %time%] Option 2 — files only >> "%LOG%"
call :show_list "Saved: files only."
goto menu

:option3
dir /b /a:-d-h-s "%SRC%" > "%OUTPUT%"
echo [%date% %time%] Option 3 — hidden/system files >> "%LOG%"
call :show_list "Saved: hidden/system files."
goto menu

:option4
echo.
set /p ext=► Enter extension (e.g. txt): 
dir /b /a:-d "%SRC%\*.%ext%" > "%OUTPUT%"
echo [%date% %time%] Option 4 — filter *.%ext% >> "%LOG%"
call :show_list "Saved: files with extension *.%ext%."
goto menu

:: ============================================
::  FUNCTION: SHOW LIST
:: ============================================
:show_list
echo.
echo %green%✔ %~1%reset%
echo.
echo %cyan%============================================%reset%
echo %yellow% LIST PREVIEW (%OUTPUT%)%reset%
echo %cyan%============================================%reset%
echo.
type "%OUTPUT%"
echo.
pause
goto :eof

:: ============================================
::  EXIT
:: ============================================
:end
echo [%date% %time%] Program ended >> "%LOG%"
echo.
echo Press any key to close...
pause >nul
exit