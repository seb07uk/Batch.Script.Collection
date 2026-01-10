@echo off
chcp 65001 >nul
setlocal ENABLEDELAYEDEXPANSION

:: ============================================
::  KOLORY ANSI
:: ============================================
set green=[92m
set yellow=[93m
set red=[91m
set blue=[94m
set cyan=[96m
set reset=[0m

:: ============================================
::  LOGOWANIE
:: ============================================
set "LOG=%userprofile%\.polsoft\psCLI\Log\List.log"

if not exist "%userprofile%\.polsoft\psCLI\Log" (
    mkdir "%userprofile%\.polsoft\psCLI\Log"
)

echo [%date% %time%] Uruchomiono program >> "%LOG%"

:: ============================================
::  DOMYŚLNA LOKALIZACJA ZAPISU
:: ============================================
set "OUTPUT=%userprofile%\Desktop\list.txt"

:: ============================================
::  WYBÓR KATALOGU ŹRÓDŁOWEGO
:: ============================================
set "SRC=%cd%"

:choose_dir
cls
echo %cyan%============================================%reset%
echo %green%           GENERATOR LISTY PLIKÓW%reset%
echo %cyan%============================================%reset%
echo.
echo Bieżący katalog źródłowy:
echo   %yellow%%SRC%%reset%
echo.
echo   [Z] Zmień katalog
echo   [D] Kontynuuj
echo   [L] Lokalizacja zapisu
echo   [A] Informacje
echo.
echo ► Wybierz opcję (bez Enter)...

choice /c zdla /n >nul

if errorlevel 4 goto about
if errorlevel 3 goto choose_output
if errorlevel 2 goto menu
if errorlevel 1 goto change_dir

goto choose_dir

:change_dir
echo.
set /p SRC=► Podaj nowy katalog: 
if not exist "%SRC%" (
    echo %red%✖ Katalog nie istnieje.%reset%
    pause
    goto choose_dir
)
echo [%date% %time%] Zmieniono katalog na "%SRC%" >> "%LOG%"
goto choose_dir

:: ============================================
::  MENU LOKALIZACJI ZAPISU
:: ============================================
:choose_output
cls
echo %cyan%============================================%reset%
echo %green%          LOKALIZACJA ZAPISU PLIKU%reset%
echo %cyan%============================================%reset%
echo.
echo   [D] Pulpit
echo   [S] Taki jak katalog źródłowy
echo   [C] Własna ścieżka
echo.
echo ► Wybierz opcję (bez Enter)...

choice /c dsc /n >nul

if errorlevel 3 goto output_custom
if errorlevel 2 goto output_src
if errorlevel 1 goto output_desktop

goto choose_output

:output_desktop
set "OUTPUT=%userprofile%\Desktop\list.txt"
echo [%date% %time%] Zapis ustawiono na Pulpit >> "%LOG%"
call :done "Zapis ustawiono na Pulpit."
goto choose_dir

:output_src
set "OUTPUT=%SRC%\list.txt"
echo [%date% %time%] Zapis ustawiono na katalog źródłowy >> "%LOG%"
call :done "Zapis ustawiono na katalog źródłowy."
goto choose_dir

:output_custom
echo.
set /p OUTPUT=► Podaj pełną ścieżkę zapisu (z nazwą pliku): 
echo [%date% %time%] Zapis ustawiono na: %OUTPUT% >> "%LOG%"
call :done "Zapis ustawiono na własną ścieżkę."
goto choose_dir

:: ============================================
::  INFORMACJE
:: ============================================
:about
cls
echo %blue%============================================%reset%
echo %green%                 INFORMACJE%reset%
echo %blue%============================================%reset%
echo.
echo   %yellow%Autor:%reset%  Sebastian Januchowski
echo   %yellow%Email:%reset%  polsoft.its@fastservice.com
echo   %yellow%GitHub:%reset% https://github.com/seb07uk
echo.
echo Naciśnij dowolny klawisz, aby wrócić...
pause >nul
goto choose_dir

:: ============================================
::  MENU GŁÓWNE
:: ============================================
:menu
cls
echo %blue%============================================%reset%
echo %green%      GENERATOR LISTY PLIKÓW — MENU%reset%
echo %blue%============================================%reset%
echo.
echo   %yellow%[1]%reset% Nazwy plików i folderów
echo   %yellow%[2]%reset% Tylko pliki (bez folderów)
echo   %yellow%[3]%reset% Pliki ukryte/systemowe
echo   %yellow%[4]%reset% Filtruj po rozszerzeniu
echo   %yellow%[0]%reset% Wyjście
echo.
echo Bieżący plik wyjściowy:
echo   %yellow%%OUTPUT%%reset%
echo.
echo ► Wybierz opcję (bez Enter)...

choice /c 12340 /n >nul

if errorlevel 5 goto end
if errorlevel 4 goto option4
if errorlevel 3 goto option3
if errorlevel 2 goto option2
if errorlevel 1 goto option1

goto menu

:: ============================================
::  OPCJE
:: ============================================

:option1
dir /b "%SRC%" > "%OUTPUT%"
echo [%date% %time%] Opcja 1 — nazwy plików i folderów >> "%LOG%"
call :show_list "Zapisano: nazwy plików i folderów."
goto menu

:option2
dir /b /a:-d "%SRC%" > "%OUTPUT%"
echo [%date% %time%] Opcja 2 — tylko pliki >> "%LOG%"
call :show_list "Zapisano: tylko pliki."
goto menu

:option3
dir /b /a:-d-h-s "%SRC%" > "%OUTPUT%"
echo [%date% %time%] Opcja 3 — pliki ukryte/systemowe >> "%LOG%"
call :show_list "Zapisano: pliki ukryte/systemowe."
goto menu

:option4
echo.
set /p ext=► Podaj rozszerzenie (np. txt): 
dir /b /a:-d "%SRC%\*.%ext%" > "%OUTPUT%"
echo [%date% %time%] Opcja 4 — filtr *.%ext% >> "%LOG%"
call :show_list "Zapisano: pliki o rozszerzeniu *.%ext%."
goto menu

:: ============================================
::  FUNKCJA: POKAŻ LISTĘ
:: ============================================
:show_list
echo.
echo %green%✔ %~1%reset%
echo.
echo %cyan%============================================%reset%
echo %yellow% PODGLĄD LISTY (%OUTPUT%)%reset%
echo %cyan%============================================%reset%
echo.
type "%OUTPUT%"
echo.
pause
goto :eof

:: ============================================
::  WYJŚCIE
:: ============================================
:end
echo [%date% %time%] Zakończono program >> "%LOG%"
echo.
echo Naciśnij dowolny klawisz, aby zamknąć...
pause >nul
exit