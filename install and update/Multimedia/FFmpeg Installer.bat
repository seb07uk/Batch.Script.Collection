:: Created by Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title FFmpeg Installer via WinGet
	echo    [3;2mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com[0m
echo. 
echo [32m*** Downloading and installing FFmpeg ***[0m
echo.
winget install Gyan.FFmpeg
echo.
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Installation FFmpeg complete!', 'polsoft.ITS London', [System.Windows.Forms.ToolTipIcon]::None)}"
echo GitHub: https://github.com/seb07uk
timeout /t 4 >nul
exit