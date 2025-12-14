:: Created by Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title PyInstaller via pip
	echo    [3;2mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com[0m
echo. 
echo [32m*** Downloading and installing PyInstaller ***[0m
echo.
pip install pyinstaller
echo.
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Installation PyInstaller complete!', 'polsoft.ITS London', [System.Windows.Forms.ToolTipIcon]::None)}"
echo GitHub: https://github.com/seb07uk
timeout /t 4 >nul
exit