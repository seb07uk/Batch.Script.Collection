:: Sebastian Januchowski
:: polsotf.ITS London
@echo off
:: Sprawdzenie, czy skrypt działa jako administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title Clear Temporary Internet Files
echo [3m[2mWritten by
echo         Sebastian Januchowski
echo.[0m
echo.
echo Deleting temporary internet files...
ping localhost -n 3 >nul
del /f /q "%userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
cls
echo [3m[2mWritten by
echo         Sebastian Januchowski
echo.[0m
echo.
echo Temporary Internet files were successfully deleted. . .
ping localhost -n 3 >nul