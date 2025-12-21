@echo off
setlocal enabledelayedexpansion
title Simple Notepad PRO + AutoSave

:: Color Definitions (ANSI)
set "green=[92m"
set "red=[91m"
set "yellow=[93m"
set "blue=[94m"
set "reset=[0m"
set "targetDir=%USERPROFILE%\.polsoft\psCLI\Notepad"

:: 1. Create directory if it doesn't exist
if not exist "%targetDir%" mkdir "%targetDir%" 2>nul

:menu
cls
echo %blue%================================%reset%
echo           Notepad CLI
echo %blue%================================%reset%
echo [1] %green%New Note (Auto-Save)%reset%
echo [2] %blue%Browse Notes (W/S/O)%reset%
echo [3] %yellow%About Author%reset%
echo [4] %red%Exit%reset%
echo %blue%================================%reset%
choice /c 1234 /n /m "Selection: "

if errorlevel 4 goto end
if errorlevel 3 goto about
if errorlevel 2 goto browse
if errorlevel 1 goto new_auto
goto menu

:new_auto
cls
echo %green%Type your note content.%reset%
echo %yellow%(Press CTRL+Z then ENTER to save and finish)%reset%
echo --------------------------------
copy con temp_note.txt >nul

if not exist temp_note.txt (
    echo %red%[!] Cancelled or empty.%reset%
    pause
    goto menu
)

:: 2. Timestamp Generation
set "ts=%DATE:/=-%_%TIME::=-%"
set "ts=%ts:.=-%"
set "ts=%ts: =%"
set "fileName=Note_!ts!.txt"

:: 3. AUTO-SAVE
move temp_note.txt "%targetDir%\!fileName!" >nul
echo.
echo %green%[OK] Saved automatically as: !fileName!%reset%
timeout /t 2 >nul
goto menu

:browse
set "selected=0"

:view_loop
set "index=0"
:: Refresh file list
for /f "delims=" %%f in ('dir "%targetDir%\*.txt" /b /o-d 2^>nul') do (
    set "file[!index!]=%%f"
    set /a index+=1
)

set /a maxIndex=index-1

if %index% equ 0 (
    cls
    echo %red%[!] No notes found.%reset%
    pause
    goto menu
)

cls
echo %blue%--- NOTE LIST (W/S - Select, O - Open, Q - Back) ---%reset%
echo.
for /l %%i in (0,1,%maxIndex%) do (
    if %%i equ %selected% (
        echo  %green%^> !file[%%i]! %reset%
    ) else (
        echo    !file[%%i]!
    )
)
echo.

choice /c wsoq /n >nul

if errorlevel 4 goto menu
if errorlevel 3 goto open_note
if errorlevel 2 (
    if %selected% lss %maxIndex% (set /a selected+=1)
    goto view_loop
)
if errorlevel 1 (
    if %selected% gtr 0 (set /a selected-=1)
    goto view_loop
)
goto view_loop

:open_note
cls
for %%i in (!selected!) do set "currentFile=!file[%%i]!"

if exist "%targetDir%\!currentFile!" (
    echo %yellow%File: !currentFile!%reset%
    echo %blue%--------------------------------%reset%
    type "%targetDir%\!currentFile!"
    echo.
    echo %blue%--------------------------------%reset%
    echo Press any key to return to list...
    pause >nul
    goto view_loop
) else (
    echo %red%[!] Error: File not found.%reset%
    pause
    goto view_loop
)

:about
cls
echo %blue%===================================%reset%
echo           ABOUT AUTHOR
echo %blue%===================================%reset%
echo.
echo %green%Author:%reset% Sebastian Januchowski
echo %green%Email:%reset%  polsoft.its@fastservice.com
echo %green%GitHub:%reset% https://github.com/seb07uk
echo.
echo %blue%===================================%reset%
echo.
echo Press any key to return to menu...
pause >nul
goto menu

:end
if exist temp_note.txt del temp_note.txt
echo %yellow%Closing...%reset%
timeout /t 1 >nul
exit