@echo off
:: ============================================
:: Przykładowy skrypt testowy
:: Autor: polsoft.ITS™
:: Data: 2026-01-27
:: Opis: Demonstracja możliwości dbbatch
:: ============================================

setlocal EnableDelayedExpansion

:: Konfiguracja
set "SCRIPT_NAME=test_script"
set "VERSION=1.0.0"

:: Powitanie
echo ================================================
echo         polsoft.ITS - Skrypt Testowy
echo ================================================
echo.

:: Informacje o systemie
echo [INFO] Wersja: %VERSION%
echo [INFO] Data: %DATE% %TIME%
echo [INFO] System: %OS%
echo.

:: Sprawdzanie katalogów
echo [CHECK] Sprawdzanie katalogow...
if exist "C:\Windows" (
    echo [OK] Katalog Windows istnieje
) else (
    echo [ERROR] Brak katalogu Windows
)

:: Zmienne środowiskowe
echo.
echo [INFO] Zmienne srodowiskowe:
echo - USERNAME: %USERNAME%
echo - COMPUTERNAME: %COMPUTERNAME%
echo - PATH zdefiniowane: OK

:: Test pętli
echo.
echo [PROCESS] Test petli FOR:
for /L %%i in (1,1,5) do (
    echo   Iteracja %%i
)

:: Zakończenie
echo.
echo ================================================
echo [SUCCESS] Skrypt zakonczony pomyslnie
echo ================================================
pause

endlocal
exit /b 0
