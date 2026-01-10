@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
title Prosty Notatnik PRO + AutoZapis

:: Definicje kolorów (ANSI)
set "green=[92m"
set "red=[91m"
set "yellow=[93m"
set "blue=[94m"
set "reset=[0m"
set "targetDir=%USERPROFILE%\.polsoft\psCLI\Notepad"

:: 1. Utwórz katalog, jeśli nie istnieje
if not exist "%targetDir%" mkdir "%targetDir%" 2>nul

:menu
cls
echo %blue%================================%reset%
echo           Notatnik CLI
echo %blue%================================%reset%
echo [1] %green%Nowa notatka (Auto-Zapis)%reset%
echo [2] %blue%Przeglądaj notatki (W/S/O)%reset%
echo [3] %yellow%O autorze%reset%
echo [4] %red%Wyjście%reset%
echo %blue%================================%reset%
choice /c 1234 /n /m "Wybór: "

if errorlevel 4 goto end
if errorlevel 3 goto about
if errorlevel 2 goto browse
if errorlevel 1 goto new_auto
goto menu

:new_auto
cls
echo %green%Wpisz treść notatki.%reset%
echo %yellow%(Wciśnij CTRL+Z, a następnie ENTER, aby zapisać i zakończyć)%reset%
echo --------------------------------
copy con temp_note.txt >nul

if not exist temp_note.txt (
    echo %red%[!] Anulowano lub brak treści.%reset%
    pause
    goto menu
)

:: 2. Generowanie znacznika czasu
set "ts=%DATE:/=-%_%TIME::=-%"
set "ts=%ts:.=-%"
set "ts=%ts: =%"
set "fileName=Notatka_!ts!.txt"

:: 3. AUTO-ZAPIS
move temp_note.txt "%targetDir%\!fileName!" >nul
echo.
echo %green%[OK] Zapisano automatycznie jako: !fileName!%reset%
timeout /t 2 >nul
goto menu

:browse
set "selected=0"

:view_loop
set "index=0"
:: Odśwież listę plików
for /f "delims=" %%f in ('dir "%targetDir%\*.txt" /b /o-d 2^>nul') do (
    set "file[!index!]=%%f"
    set /a index+=1
)

set /a maxIndex=index-1

if %index% equ 0 (
    cls
    echo %red%[!] Brak zapisanych notatek.%reset%
    pause
    goto menu
)

cls
echo %blue%--- LISTA NOTATEK (W/S - wybór, O - otwórz, Q - powrót) ---%reset%
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
    echo %yellow%Plik: !currentFile!%reset%
    echo %blue%--------------------------------%reset%
    type "%targetDir%\!currentFile!"
    echo.
    echo %blue%--------------------------------%reset%
    echo Naciśnij dowolny klawisz, aby wrócić do listy...
    pause >nul
    goto view_loop
) else (
    echo %red%[!] Błąd: Nie znaleziono pliku.%reset%
    pause
    goto view_loop
)

:about
cls
echo %blue%====================================%reset%
echo             O AUTORZE
echo %blue%====================================%reset%
echo.
echo %green%Autor:%reset%  Sebastian Januchowski
echo %green%Email:%reset%  polsoft.its@fastservice.com
echo %green%GitHub:%reset% https://github.com/seb07uk
echo.
echo %blue%====================================%reset%
echo.
echo Naciśnij dowolny klawisz, aby wrócić do menu...
pause >nul
goto menu

:end
if exist temp_note.txt del temp_note.txt
echo %yellow%Zamykanie...%reset%
timeout /t 1 >nul
exit