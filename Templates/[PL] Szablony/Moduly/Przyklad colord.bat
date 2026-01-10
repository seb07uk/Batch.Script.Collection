@echo off
REM ============================================
REM   Moduł:   Przyklad colors.bat
REM   Autor:   Sebastian Januchowski
REM   Cel:     Centralna obsługa kolorów
REM ============================================

:: Użycie: call colors.bat <kodKoloru>
:: Przykład: call colors.bat 0A

if "%~1"=="" (
    echo [BŁĄD] Nie podano kodu koloru.
    exit /b 1
)

color %~1
exit /b 0 