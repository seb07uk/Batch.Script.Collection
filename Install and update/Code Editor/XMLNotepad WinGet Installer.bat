:: Created by Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title XMLNotepad WinGet Installer
echo   [2;3mCreated by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com[0m
echo.
echo [34m--- XMLNotepad WinGet Installer ---[0m
echo.[33m
winget install --id=Microsoft.XMLNotepad  -e 
echo.[0m
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'XMLNotepad installation complete!', 'polsoft.ITS London', [System.Windows.Forms.ToolTipIcon]::None)}"
echo [32m--- XMLNotepad installation complete! ---[0m
timeout /t 5 >nul