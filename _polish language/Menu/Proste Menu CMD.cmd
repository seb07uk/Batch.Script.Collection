:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title Proste Menu CMD
color 0A

:menu
cls
echo ==============================
echo        PROSTE MENU CMD
echo ==============================
echo 1. Pokaz date i czas
echo 2. Lista plikow w folderze
echo 3. Uruchom notatnik
echo 4. Wyjdz
echo ==============================
set /p wybor=Podaj numer opcji: 

if "%wybor%"=="1" goto opcja1
if "%wybor%"=="2" goto opcja2
if "%wybor%"=="3" goto opcja3
if "%wybor%"=="4" goto koniec

echo Niepoprawny wybor!
pause
goto menu

:opcja1
cls
echo Aktualna data i czas:
echo %date% %time%
pause
goto menu

:opcja2
cls
echo Lista plikow w bieżącym folderze:
dir
pause
goto menu

:opcja3
cls
echo Uruchamiam Notatnik...
start notepad
pause
goto menu

:koniec
cls
echo Do zobaczenia!
pause