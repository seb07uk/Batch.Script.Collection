@echo off
chcp 65001 >nul
setlocal

:: Sprawdzenie, czy podano argument
if "%~1"=="" (
    echo Uzycie: %~n0 [komenda] [argumenty...]
    echo.
    echo Dostepne komendy:
    echo   hello     - Wyswietla powitanie.
    echo   info      - Wyswietla informacje o systemie.
    echo   help      - Wyswietla ta pomoc.
    goto :eof
)

:: Ustawienie pierwszego argumentu jako komendy, a reszty jako argumentow
set "COMMAND=%~1"
shift

:: Przejscie do odpowiedniej sekcji (label) na podstawie komendy
call :%COMMAND%

:: Sprawdzenie, czy komenda zostala znaleziona
if errorlevel 1 (
    echo Blad: Nieznana komenda "%COMMAND%".
    echo Wpisz "%~n0 help" po pomoc.
)

goto :eof

:: --- Sekcje Komend ---

:hello
    echo Czesc! Jestem prosty dispatcher.
    echo Podales nastepujace argumenty: %*
    goto :eof

:info
    echo Informacje o systemie:
    systeminfo | findstr /B /C:"Nazwa systemu operacyjnego" /C:"Wersja" /C:"Nazwa hosta" /C:"Pamiec fizyczna"
    goto :eof

:help
    echo To jest prosta pomoc dla skryptu %~n0.
    echo.
    echo Skrypt wywoluje odpowiednia funkcje (label) na podstawie pierwszego argumentu.
    echo.
    echo Skladnia: %~n0 [komenda] [argumenty...]
    echo.
    echo Dostepne komendy:
    echo   hello     - Wyswietla powitanie.
    echo   info      - Wyswietla informacje o systemie (OS, pamiec).
    echo   help      - Wyswietla ta pomoc.
    goto :eof

:: --- Koniec Skryptu ---