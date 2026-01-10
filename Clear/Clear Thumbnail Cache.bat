:: Sebastian Januchowski
:: polsotf.ITS London
@echo off
TITLE Clear Thumbnail Cache
echo    [3m[2mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com 
echo.[0m
echo.
echo                        Delete Thumbnail Cache
echo.
taskkill /f /im explorer.exe
timeout 2 /nobreak>nul
echo.
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db
timeout 2 /nobreak>nul
start explorer.exe