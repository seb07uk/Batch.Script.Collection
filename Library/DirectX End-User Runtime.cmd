:: Created by Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
:: Sprawdzanie uprawnień administratora
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo %yellow%Uruchamianie jako Administrator...%white%
    powershell -Command "Start-Process -FilePath '%0' -Verb RunAs"
    exit /b
)
setlocal EnableExtensions DisableDelayedExpansion
	echo    [3;2mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com[0m
echo. 
echo [32m*** Downloading and installing DirectX ***[0m
echo.
winget install Microsoft.DirectX
echo.
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Installation DirectX complete!', 'polsoft.ITS London', [System.Windows.Forms.ToolTipIcon]::None)}"
echo GitHub: https://github.com/seb07uk
timeout /t 5 >nul
exit