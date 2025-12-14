:: Created by Sebastian Januchowski
:: polsoft.ITS London
:: polsoft.its@fastservice.com
@echo off
Title MS Store App Remover
openfiles >nul 2>&1
if %errorlevel% neq 0 (
	echo    [3;2mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com 
echo. [0m
	echo                                                  [1;3;41mMS Store App Remover[0m
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
echo --- Running SFC ---
sfc /scannow
echo.
echo --- Running DISM ---
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo --- Uninstalling Microsoft Store ---
echo.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage "*Microsoft.WindowsStore*" | Remove-AppxPackage"
timeout /t 7 >nul
endlocal
taskkill /f /im explorer.exe & start explorer & exit /b 0