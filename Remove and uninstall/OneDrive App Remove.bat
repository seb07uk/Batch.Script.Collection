:: Created by Sebastian Januchowski
:: polsoft.its@fastservice.com
@echo off
title OneDrive App Remove created by Sebastian Januchowski [polsoft I.T.S.]
openfiles >nul 2>&1
if %errorlevel% neq 0 (
	echo    [3;2mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com 
echo. [0m
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
echo [1;31m--- Killing OneDrive Process ---[0m
taskkill /f /im OneDrive.exe
if exist "%SystemRoot%\System32\OneDriveSetup.exe" (
    echo.
	echo [1;31m--- Uninstalling OneDrive through the installers ---[0m
    "%SystemRoot%\System32\OneDriveSetup.exe" /uninstall
)
if exist "%SystemRoot%\SysWOW64\OneDriveSetup.exe" (
    "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall
)
echo.
echo [1;31m--- Copy OneDrive files to local folders ---[0m
robocopy "%USERPROFILE%\OneDrive" "%USERPROFILE%" /mov /e /xj /ndl /nfl /njh /njs /nc /ns /np
echo.
echo [1;31m--- Remove OneDrive from explorer sidebar ---[0m
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
reg delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
echo.
echo [1;31m--- Removing shortcut entry ---[0m
del "%appdata%\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"
echo.
echo [1;31m--- Removing scheduled task ---[0m
powershell -Command "Get-ScheduledTask -TaskPath '\' -TaskName 'OneDrive*' -ErrorAction SilentlyContinue | Unregister-ScheduledTask -Confirm:$false"
echo.
echo [1;31m--- Removing OneDrive leftovers ---[0m
rd "%UserProfile%\OneDrive" /Q /S
rd "%LocalAppData%\OneDrive" /Q /S
rd "%LocalAppData%\Microsoft\OneDrive" /Q /S
rd "%ProgramData%\Microsoft OneDrive" /Q /S
rd "C:\OneDriveTemp" /Q /S
reg delete "HKEY_CURRENT_USER\Software\Microsoft\OneDrive" /f
echo.
echo [1;31m--- Restore default folders locations ---[0m
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "AppData" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cache" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cookies" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCookies" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Favorites" /t REG_EXPAND_SZ /d "%USERPROFILE%\Favorites" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "History" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Local\Microsoft\Windows\History" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Local" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_EXPAND_SZ /d "%USERPROFILE%\Music" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_EXPAND_SZ /d "%USERPROFILE%\Videos" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "NetHood" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Network Shortcuts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "PrintHood" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Printer Shortcuts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Programs" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Recent" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "SendTo" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\SendTo" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Start Menu" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Startup" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Templates" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Templates" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Downloads" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_EXPAND_SZ /d "%USERPROFILE%\Desktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "%USERPROFILE%\Pictures" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /t REG_EXPAND_SZ /d "%USERPROFILE%\Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{F42EE2D3-909F-4907-8871-4C22FC0BF756}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Pictures" /f
echo.
echo [1;31m--- Killing OneDrive Process ---[0m
taskkill /f /im OneDrive.exe
if exist "%SystemRoot%\System32\OneDriveSetup.exe" (
echo.
    echo [1;31m--- Uninstalling OneDrive through the installers ---[0m
    "%SystemRoot%\System32\OneDriveSetup.exe" /uninstall
)
if exist "%SystemRoot%\SysWOW64\OneDriveSetup.exe" (
    "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall
)
echo.
echo [1;31m--- Copy OneDrive files to local folders ---[0m
robocopy "%USERPROFILE%\OneDrive" "%USERPROFILE%" /mov /e /xj /ndl /nfl /njh /njs /nc /ns /np
echo.
echo [1;31m--- Remove OneDrive from explorer sidebar ---[0m
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
reg delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
echo.
echo [1;31m--- Removing shortcut entry ---[0m
del "%appdata%\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"
echo.
echo [1;31m--- Removing scheduled task ---[0m
powershell -Command "Get-ScheduledTask -TaskPath '\' -TaskName 'OneDrive*' -ErrorAction SilentlyContinue | Unregister-ScheduledTask -Confirm:$false"
echo.
echo [1;31m--- Removing OneDrive leftovers ---[0m
rd "%UserProfile%\OneDrive" /Q /S
rd "%LocalAppData%\OneDrive" /Q /S
rd "%LocalAppData%\Microsoft\OneDrive" /Q /S
rd "%ProgramData%\Microsoft OneDrive" /Q /S
rd "C:\OneDriveTemp" /Q /S
reg delete "HKEY_CURRENT_USER\Software\Microsoft\OneDrive" /f
echo.
echo [1;31m--- Restore default folders locations ---[0m
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "AppData" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cache" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cookies" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCookies" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Favorites" /t REG_EXPAND_SZ /d "%USERPROFILE%\Favorites" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "History" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Local\Microsoft\Windows\History" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Local" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_EXPAND_SZ /d "%USERPROFILE%\Music" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_EXPAND_SZ /d "%USERPROFILE%\Videos" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "NetHood" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Network Shortcuts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "PrintHood" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Printer Shortcuts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Programs" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Recent" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "SendTo" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\SendTo" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Start Menu" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Startup" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Templates" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Templates" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Downloads" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_EXPAND_SZ /d "%USERPROFILE%\Desktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "%USERPROFILE%\Pictures" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /t REG_EXPAND_SZ /d "%USERPROFILE%\Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{F42EE2D3-909F-4907-8871-4C22FC0BF756}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Pictures" /f
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('OneDrive app has been removed.', 'polsoft I.T.S.', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
endlocal
taskkill /f /im explorer.exe & start explorer & exit /b 0