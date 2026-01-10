:: Sebastian Januchowski
:: polsotf.ITS London
@echo off
TITLE Clear Temp
echo    [2m[3mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com[0m 
echo.
echo The Clearing Process Has Started...
echo.
del /q /f /s %temp%\*
rd /s /q %temp%
echo.
echo Temporary files cleared....
ping localhost -n 3 >nul