:: Created by Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title Python 3.9 Installer
echo   [2;3mCreated by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com[0m
echo.
echo [34m--- Python 3.9 ---[0m
echo.[33m
winget install Python.Python.3.9
echo.
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Installation Python 3.9 complete!', 'polsoft.ITS London', [System.Windows.Forms.ToolTipIcon]::None)}"
echo GitHub: https://github.com/seb07uk
timeout /t 4 >nul
exit