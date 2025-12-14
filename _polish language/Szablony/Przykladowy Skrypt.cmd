@echo off
REM ============================================
REM   Nazwa:   ExampleScript.bat
REM   Autor:   Sebastian Januchowski
REM   Cel:     Szablon batch scriptu
REM   Data:    %date% %time%
REM ============================================

:: Sekcja konfiguracji
setlocal enabledelayedexpansion
set LOGFILE=script.log

:: Funkcja logowania
:log
echo [%date% %time%] %~1 >> %LOGFILE%
goto :eof

:: Główna logika
echo Startuję skrypt...
call :log "Skrypt został uruchomiony"

:: Przykład pętli
for %%i in (1 2 3) do (
    echo Iteracja %%i
    call :log "Iteracja %%i wykonana"
)

:: Obsługa błędów
if %errorlevel% neq 0 (
    echo Wystąpił błąd: %errorlevel%
    call :log "Błąd: %errorlevel%"
    exit /b %errorlevel%
)

:: Zakończenie
echo Skrypt zakończony pomyślnie.
call :log "Skrypt zakończony pomyślnie"
endlocal
pause