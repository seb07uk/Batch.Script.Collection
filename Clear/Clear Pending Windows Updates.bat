:: Sebastian Januchowski
:: polsotf.ITS London
@echo off
:: Sprawdzenie, czy skrypt działa jako administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

@echo off
TITLE Delete Pending Windows Updates
echo    [3m[2mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com 
echo.[0m
echo.
echo The cleaning process has started...
echo.
net stop wuauserv
cd /d %SystemRoot%\SoftwareDistribution
del /s /q /f Download
net start wuauserv
echo.
echo The cleaning process has been completed...
ping localhost -n 3 >nul