:: Created by Sebastian Januchowski
:: polsoft.its@fastservice.com
@echo off
title Administrator privileges created by Sebastian Januchowski [polsoft I.T.S.]
openfiles >nul 2>&1
if %errorlevel% neq 0 (
echo    Created by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com 
echo.
echo.
echo                                      This script requires administrator privileges
echo                                          Please run Script as an administrator
echo.
echo                                                Press any key to continue
pause >nul
exit
)
setlocal EnableExtensions DisableDelayedExpansion
echo   Created by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com 
echo.
pause