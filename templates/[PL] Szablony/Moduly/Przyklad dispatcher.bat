@echo off
REM ============================================
REM   Dispatcher: Przyklad dispatcher.bat
REM   Autor:      Sebastian Januchowski
REM   Cel:        Centralne wywoływanie modułów
REM ============================================

setlocal

:: Przykładowe użycie
call colors.bat 0A
call debug.bat "Dispatcher uruchomiony"
call deploy.bat "Produkcja"

if %errorlevel% neq 0 (
    call error.bat "Dispatcher napotkał błąd"
    exit /b %errorlevel%
)

call debug.bat "Dispatcher zakończył działanie pomyślnie"
endlocal
exit /b 0