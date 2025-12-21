:: Created by Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk

@echo off
setlocal enabledelayedexpansion
title Kamien Papier Nozyce - Batch Game
color 0B

:: Menu wyboru języka
:langmenu
cls
echo    [2m2025 Sebastian Januchowski[0m
echo [1;3;36m==============================[0m
echo    [1;3;36mKAMIEN - PAPIER - NOZYCE
echo [1;3;36m==============================[0m
echo        [2mpolsoft.ITS London[0m
echo.
echo.
echo [33m[1] Polski
echo [2] English[0m
echo.
echo.
echo Twoj wybor/Your choice (Nacisnij klawisz):
:: /C definiuje klawisze, /N ukrywa domyslny monit [1,2]
choice /c 12 /n
if errorlevel 2 goto menuEN
if errorlevel 1 goto menuPL

:: =======================
:: POLSKA WERSJA
:: =======================
:menuPL
cls
echo    [2m2025 Sebastian Januchowski[0m
echo [1;3;36m==============================[0m
echo    [1;3;36mKAMIEN - PAPIER - NOZYCE
echo [1;3;36m==============================[0m
echo        [2mpolsoft.ITS London[0m
echo.
echo.
echo [1;3;36mWybierz ruch (Nacisnij klawisz):[0m
echo.
echo [33m[1] Kamien
echo [2] Papier
echo [3] Nozyce
echo [4] Zakoncz[0m
echo.

choice /c 1234 /n
set "sel=%errorlevel%"

if "%sel%"=="4" exit
if "%sel%"=="1" set "player=Kamien"
if "%sel%"=="2" set "player=Papier"
if "%sel%"=="3" set "player=Nozyce"

set /a comp=%random% %% 3 + 1
if "%comp%"=="1" set "computer=Kamien"
if "%comp%"=="2" set "computer=Papier"
if "%comp%"=="3" set "computer=Nozyce"

cls
echo    [2m2025 Sebastian Januchowski[0m
echo [1;3;36m==============================[0m
echo    [1;3;36mKAMIEN - PAPIER - NOZYCE
echo [1;3;36m==============================[0m
echo        [2mpolsoft.ITS London[0m
echo.
echo.
echo [33mTy:[0m        %player%
echo [33mKomputer:[0m %computer%
echo.

if "%player%"=="%computer%" (
    echo [1;5;35mRemis![0m
) else (
    if "%player%"=="Kamien" if "%computer%"=="Nozyce" (
        echo [1;5;32mWygrales![0m
    ) else if "%player%"=="Papier" if "%computer%"=="Kamien" (
        echo [1;5;32mWygrales![0m
    ) else if "%player%"=="Nozyce" if "%computer%"=="Papier" (
        echo [1;5;32mWygrales![0m
    ) else (
        echo [1;5;31mPrzegrales![0m
    )
)

echo.
echo Nacisnij dowolny klawisz, aby kontynuowac...
pause >nul
goto menuPL

:: =======================
:: ENGLISH VERSION
:: =======================
:menuEN
cls
echo    [2m2025 Sebastian Januchowski[0m
echo [1;3;36m==============================[0m
echo    [1;3;36mROCK - PAPER - SCISSORS
echo [1;3;36m==============================[0m
echo        [2mpolsoft.ITS London[0m
echo.
echo.
echo [1;3;36mChoose your move (Press key):[0m
echo.
echo [33m[1] Rock
echo [2] Paper
echo [3] Scissors
echo [4] Exit[0m
echo.

choice /c 1234 /n
set "sel=%errorlevel%"

if "%sel%"=="4" exit
if "%sel%"=="1" set "player=Rock"
if "%sel%"=="2" set "player=Paper"
if "%sel%"=="3" set "player=Scissors"

set /a comp=%random% %% 3 + 1
if "%comp%"=="1" set "computer=Rock"
if "%comp%"=="2" set "computer=Paper"
if "%comp%"=="3" set "computer=Scissors"

cls
echo    [2m2025 Sebastian Januchowski[0m
echo [1;3;36m==============================[0m
echo    [1;3;36mROCK - PAPER - SCISSORS
echo [1;3;36m==============================[0m
echo        [2mpolsoft.ITS London[0m
echo.
echo.
echo [33mYou:[0m        %player%
echo [33mComputer:[0m %computer%
echo.

if "%player%"=="%computer%" (
    echo [1;5;35mDraw![0m
) else (
    if "%player%"=="Rock" if "%computer%"=="Scissors" (
        echo [1;5;32mYou win![0m
    ) else if "%player%"=="Paper" if "%computer%"=="Rock" (
        echo [1;5;32mYou win![0m
    ) else if "%player%"=="Scissors" if "%computer%"=="Paper" (
        echo [1;5;32mYou win![0m
    ) else (
        echo [1;5;31mYou lose![0m
    )
)

echo.
echo Press any key to continue...
pause >nul
goto menuEN