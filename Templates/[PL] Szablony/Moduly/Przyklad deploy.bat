@echo off
REM ============================================
REM   Moduł:   Przyklad deploy.bat
REM   Autor:   Sebastian Januchowski
REM   Cel:     Logika wdrożeniowa
REM ============================================

:: Użycie: call deploy.bat <cel>

setlocal
set TARGET=%~1
if "%TARGET%"=="" (
    call error.bat "Nie podano celu wdrożenia"
    exit /b 1
)

echo Wdrażanie do %TARGET%...
call debug.bat "Rozpoczęto wdrożenie dla %TARGET%"
:: [Tutaj kroki wdrożeniowe]
call debug.bat "Zakończono wdrożenie dla %TARGET%"
endlocal
exit /b 0