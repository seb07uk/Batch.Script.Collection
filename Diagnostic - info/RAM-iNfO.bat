:: Sebastian Januchowski
:: polsotf.ITS London
:: polsoft.its@fastservice.com
@echo off
TITLE RAM iNfO
echo [3m[2mWritten by
echo         Sebastian Januchowski
echo.[0m
ECHO.
echo               [7m[3mRAM iNfO[0m
echo.[33m
systeminfo | findstr /C:"Total Physical Memory" /C:"Available Physical Memory"
ECHO.[0m
pause