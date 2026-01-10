:: Sebastian Januchowski
:: polsotf.ITS London
@echo off
chcp 65001
title dotNET Runtime Installer and Updater v1.0.1 by Sebastian Januchowski
CLS
:menu
echo    [1;2;3mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com[0m 
echo.
echo                                              [33m............................[0m
echo                                              [33m:[0m [36;1;6m     dotNET Runtime[0m [33m     :[0m                   
echo            [1;3;32mA[b]out[0m                           [33m:[0m  [36;1;6mInstaller and Updater  [0m [33m:[0m                              [1;3;31mE[x]it[0m
echo                                              [33m:[0m        [36;1;6mver.1.0.1 [0m        [33m:[0m
echo                                              [33m:..........................:[0m
echo.
echo      [3;1m(1) .NET 3.1 Runtime                     (5) .NET 5.0 Runtime                     (9) .NET 6.0 Runtime
echo      (2) .NET 3.1 SDK                         (6) .NET 5.0 SDK                         (q) .NET 6.0 SDK
echo      (3) .NET 3.1 Desktop Runtime             (7) .NET 5.0 Desktop Runtime             (w) .NET 6.0 Desktop Runtime
echo      (4)  ASP.NET 3.1 Core Runtime            (8)  ASP.NET 5.0 Core Runtime            (e)  ASP.NET 6.0 Core Runtime
echo.
echo.
echo      (r) .NET 7.0 Runtime                     (i) .NET 8.0 Runtime                     (s) .NET 9.0 Runtime
echo      (t) .NET 7.0 SDK                         (o) .NET 8.0 SDK                         (d) .NET 9.0 SDK
echo      (y) .NET 7.0 Desktop Runtime             (p) .NET 8.0 Desktop Runtime             (f) .NET 9.0 Desktop Runtime
echo      (u)  ASP.NET 7.0 Core Runtime            (a)  ASP.NET 8.0 Core Runtime            (g)  ASP.NET 9.0 Core Runtime[0m
echo.
echo                             [33m........................[0m                       [33m........................[0m
echo                             [33m:[0m [36;1;6mThird-Party Packages[0m [33m:[0m                       [33m:[0m [36;1;6m.NET Install scripts[0m [33m:[0m
echo                             [33m:[0m       [36;1;6mPreview[0m        [33m:[0m                       [33m:......................:[0m      
echo                             [33m:......................:[0m                           
echo                                                                                [3;1m(z) PowerShell 
echo                        (h) .NET 10.0 Runtime Preview                           (m) Bash
echo.                       (j) .NET 10.0 SDK Preview                               
echo                        (k) .NET 10.0 Desktop Runtime Preview                         
echo                        (l)  ASP.NET 10.0 Core Runtime Preview             web site (c) Microsoft .NET[0m 
echo.
::
set /p op=">>> "
if %op%==1 goto 1
if %op%==2 goto 2
if %op%==3 goto 3
if %op%==4 goto 4
if %op%==5 goto 5
if %op%==6 goto 6
if %op%==7 goto 7
if %op%==8 goto 8
if %op%==9 goto 9
if %op%==q goto q
if %op%==w goto w
if %op%==e goto e
if %op%==r goto r
if %op%==t goto t
if %op%==y goto y
if %op%==u goto u
if %op%==i goto i
if %op%==o goto o
if %op%==p goto p
if %op%==a goto a
if %op%==s goto s
if %op%==d goto d
if %op%==f goto f
if %op%==g goto g
if %op%==h goto h
if %op%==j goto j
if %op%==k goto k
if %op%==l goto l
if %op%==z goto z
if %op%==m goto m
if %op%==c goto c
if %op%==b goto b
if %op%==x goto x
::
:b
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('dotNET Runtime Installer and Updater v1.0.1 [Sep 2025]','polsoft I.T.S. iNfO', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
cls
goto menu
:x
exit
:c
CLS
start https://dotnet.microsoft.com/en-us/
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:z
CLS
start https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.ps1
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:m
CLS
start https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:h
CLS
winget install Microsoft.DotNet.Runtime.Preview
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:j
CLS
winget install Microsoft.DotNet.SDK.Preview 
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:k
CLS
winget install Microsoft.DotNet.DesktopRuntime.Preview
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:l
CLS
winget install Microsoft.DotNet.AspNetCore.Preview
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:s
CLS
winget install Microsoft.DotNet.Runtime.9
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:d
CLS
winget install Microsoft.DotNet.SDK.9 
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:f
CLS
winget install Microsoft.DotNet.DesktopRuntime.9
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:g
CLS
winget install Microsoft.DotNet.AspNetCore.9
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:i
CLS
winget install Microsoft.DotNet.Runtime.8
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:o
CLS
winget install Microsoft.DotNet.SDK.8 
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:p
CLS
winget install Microsoft.DotNet.DesktopRuntime.8
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:a
CLS
winget install Microsoft.DotNet.AspNetCore.8
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:r
CLS
winget install Microsoft.DotNet.Runtime.7
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:t
CLS
winget install Microsoft.DotNet.SDK.7 
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:y
CLS
winget install Microsoft.DotNet.DesktopRuntime.7
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:u
CLS
winget install Microsoft.DotNet.AspNetCore.7
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:9
CLS
winget install Microsoft.DotNet.Runtime.6
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:q
CLS
winget install Microsoft.DotNet.SDK.6 
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:w
CLS
winget install Microsoft.DotNet.DesktopRuntime.6
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:e
CLS
winget install Microsoft.DotNet.AspNetCore.6
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:5
CLS
winget install Microsoft.DotNet.Runtime.5
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:6
CLS
winget install Microsoft.DotNet.SDK.5 
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:7
CLS
winget install Microsoft.DotNet.DesktopRuntime.5
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:8
CLS
winget install Microsoft.DotNet.AspNetCore.5
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:1
CLS
winget install Microsoft.DotNet.Runtime.3_1
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:2
CLS
winget install Microsoft.DotNet.SDK.3_1
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:3
CLS
winget install Microsoft.DotNet.DesktopRuntime.3_1
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU
:4
CLS
winget install Microsoft.DotNet.AspNetCore.3_1
echo.
echo.
timeout 3 /nobreak>nul
cls
GOTO MENU