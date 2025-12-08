@echo off
REM ============================================
REM   Moduł:   Przyklad error.bat
REM   Autor:   Sebastian Januchowski
REM   Cel:     Obsługa błędów i logowanie
REM ============================================

:: Użycie: call error.bat <wiadomość>

setlocal
set MSG=%~1
echo [BŁĄD] %MSG%
echo [%date% %time%] BŁĄD: %MSG% >> error.log
endlocal
exit /b 1