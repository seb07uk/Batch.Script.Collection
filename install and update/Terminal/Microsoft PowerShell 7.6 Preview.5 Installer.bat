:: Created by Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title Microsoft PowerShell 7.6 Preview.5 Installer via WinGet
openfiles >nul 2>&1
if %errorlevel% neq 0 (
	echo   [3;2mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com[0m
echo.
	echo.
    echo                                      [1;3;31mThis script requires administrator privileges.[0m
    echo                                          [3;1;31mPlease run Script as an administrator.[0m
	echo.
	echo                                                [5mPress any key to continue.[0m
	pause >nul
    exit
)
setlocal EnableExtensions DisableDelayedExpansion
	echo    [3;2mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com[0m
echo. 
echo [32m*** Downloading and installing Microsoft PowerShell 7.6 Preview.5 ***[0m
echo.
winget install --id Microsoft.PowerShell.Preview --source winget
echo.
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Installation Microsoft PowerShell 7.6 Preview.5 complete!', 'polsoft.ITS London', [System.Windows.Forms.ToolTipIcon]::None)}"
echo GitHub: https://github.com/seb07uk
timeout /t 4 >nul
exit