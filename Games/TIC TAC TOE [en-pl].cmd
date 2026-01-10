:: Created by Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title Tic Tac Toe - Batch Game
setlocal enabledelayedexpansion

:: ==============================
:: Language selection menu (EN/PL)
:: ==============================
:langMenu
cls
echo  [2m2025(c) Sebastian Januchowski[0m
echo [46m===============================[0m
echo [46m    TIC TAC TOE - LANGUAGE     [0m
echo [46m===============================[0m
echo       [2mpolsoft.ITS London[0m
echo.
echo [1;34mChoose language / Wybierz jezyk[0m
echo.
echo   [33m1 ^) English[0m
echo   [33m2 ^) Polski[0m
echo.[1;34m
set /p "choice=Your choice / Twoj wybor (1-2):[0m "

if "%choice%"=="1" (
    set "lang=EN"
    goto reset
) else if "%choice%"=="2" (
    set "lang=PL"
    goto reset
) else (
    echo [31mInvalid choice / Nieprawidlowy wybor[0m
    pause >nul
    goto langMenu
)

:reset
:: Inicjalizacja planszy
set "cell1=1" & set "cell2=2" & set "cell3=3"
set "cell4=4" & set "cell5=5" & set "cell6=6"
set "cell7=7" & set "cell8=8" & set "cell9=9"

set "player=X"
set "winner="
set "draw="

:game
cls
echo [2m2025 Sebastian Januchowski[0m
echo [46m==========================[0m
echo [46m       TIC TAC TOE        [0m
echo [46m==========================[0m
echo     [2mpolsoft.ITS London[0m 
echo.
echo.
echo   !cell1! ^| !cell2! ^| !cell3!
echo  ---+---+---
echo   !cell4! ^| !cell5! ^| !cell6!
echo  ---+---+---
echo   !cell7! ^| !cell8! ^| !cell9!
echo.

if "!lang!"=="PL" (
    echo [1;3;34mTeraz ruch:[0m !player!
    set /p "move=[1;3;34mPodaj numer pola (1-9):[0m "
) else (
    echo [1;3;34mNow it's turn:[0m !player!
    set /p "move=[1;3;34mEnter cell number (1-9):[0m "
)

:: Sprawdzenie poprawności ruchu
if "!cell%move%!"=="X" goto invalid
if "!cell%move%!"=="O" goto invalid
if "%move%"=="" goto invalid
if %move% LSS 1 goto invalid
if %move% GTR 9 goto invalid

set "cell%move%=!player!"

:: Sprawdzenie wygranej lub remisu
call :checkWin
if "!winner!" NEQ "" goto end
if "!draw!"=="1" goto end

:: Zmiana gracza
if "!player!"=="X" (set "player=O") else (set "player=X")
goto game

:invalid
if "!lang!"=="PL" (
    echo [5;31mNieprawidlowy ruch, sprobuj ponownie...[0m
) else (
    echo [5;31mInvalid move, try again...[0m
)
pause >nul
goto game

:checkWin
set "winner="
set "draw="

:: Sprawdzenie wierszy
if "!cell1!"=="!cell2!" if "!cell1!"=="!cell3!" set "winner=!cell1!"
if "!cell4!"=="!cell5!" if "!cell4!"=="!cell6!" set "winner=!cell4!"
if "!cell7!"=="!cell8!" if "!cell7!"=="!cell9!" set "winner=!cell7!"

:: Sprawdzenie kolumn
if "!cell1!"=="!cell4!" if "!cell1!"=="!cell7!" set "winner=!cell1!"
if "!cell2!"=="!cell5!" if "!cell2!"=="!cell8!" set "winner=!cell2!"
if "!cell3!"=="!cell6!" if "!cell3!"=="!cell9!" set "winner=!cell3!"

:: Sprawdzenie przekątnych
if "!cell1!"=="!cell5!" if "!cell1!"=="!cell9!" set "winner=!cell1!"
if "!cell3!"=="!cell5!" if "!cell3!"=="!cell7!" set "winner=!cell3!"

:: Sprawdzenie remisu
if "!winner!"=="" (
    if not "!cell1!"=="1" if not "!cell2!"=="2" if not "!cell3!"=="3" if not "!cell4!"=="4" if not "!cell5!"=="5" if not "!cell6!"=="6" if not "!cell7!"=="7" if not "!cell8!"=="8" if not "!cell9!"=="9" (
        set "draw=1"
    )
)

exit /b

:end
cls
echo [2m2025 Sebastian Januchowski[0m
echo [46m==========================[0m
echo [46m       TIC TAC TOE        [0m
echo [46m==========================[0m
echo     [2mpolsoft.ITS London[0m
echo.
echo.
echo   !cell1! ^| !cell2! ^| !cell3!
echo  ---+---+---
echo   !cell4! ^| !cell5! ^| !cell6!
echo  ---+---+---
echo   !cell7! ^| !cell8! ^| !cell9!
echo.

if "!winner!" NEQ "" (
    if "!lang!"=="PL" (
        echo [1;3;32m*** Wygrywa: !winner! ***[0m
    ) else (
        echo [1;3;32m*** Winner: !winner! ***[0m
    )
) else (
    if "!lang!"=="PL" (
        echo [1;3;32m*** REMIS! ***[0m
    ) else (
        echo [1;3;32m*** DRAW! ***[0m
    )
)
echo.

if "!lang!"=="PL" (
    set /p "again=[33mCzy chcesz zagrac ponownie? (T/N):[0m "
    if /I "!again!"=="T" goto reset
    echo [32mDziekujemy za gre![0m
) else (
    set /p "again=[33mDo you want to play again? (Y/N):[0m "
    if /I "!again!"=="Y" goto reset
    echo [32mThanks for playing![0m
)

pause >nul