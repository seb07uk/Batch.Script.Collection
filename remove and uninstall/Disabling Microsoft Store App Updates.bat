:: Created by Sebastian Januchowski
:: polsoft.ITS London
:: polsoft.its@fastservice.com
@echo off
Title Disabling Microsoft Store App Updates
openfiles >nul 2>&1
if %errorlevel% neq 0 (
	echo    [3;2mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com 
echo. [0m
	echo                                          [1;3;41mDisabling Microsoft Store App Updates[0m
	echo.
    echo                                      [1;3;31mThis script requires administrator privileges.[0m
    echo                                          [3;1;31mPlease run Script as an administrator.[0m
	echo.
	echo                                                [5mPress any key to continue.[0m
	pause >nul
    exit
)
setlocal EnableExtensions DisableDelayedExpansion
	echo   [3;2mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com 
echo. [0m
echo [31m--- Running SFC ---[0m
sfc /scannow
echo.
echo [31m--- Running DISM ---[0m
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo [31m--- Disabling Microsoft Store App Updates ---[0m
echo.
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /t REG_DWORD /d 2 /f
pause
endlocal
taskkill /f /im explorer.exe & start explorer & exit /b 0