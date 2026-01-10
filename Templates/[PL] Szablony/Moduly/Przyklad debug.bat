@echo off
REM ============================================
REM   Moduł:   Przyklad debug.bat
REM   Autor:   Sebastian Januchowski
REM   Cel:     Logowanie debugowe
REM ============================================

:: Użycie: call debug.bat <wiadomość>

setlocal
set MSG=%~1
echo [DEBUG] %MSG%
echo [%date% %time%] DEBUG: %MSG% >> debug.log
endlocal
exit /b 0