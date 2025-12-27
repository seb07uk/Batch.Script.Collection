@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title CMD CLI FILE MANAGER PRO
mode con: cols=100 lines=50
color 0F

:: Generowanie znaku ESC dla kolorów ANSI
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

set "G=%ESC%[92m"
set "R=%ESC%[91m"
set "Y=%ESC%[93m"
set "B=%ESC%[94m"
set "RESET=%ESC%[0m"

:menu
cls
echo.
echo  %Y%DIRECTORY CONTENT:%RESET%  %B%[%cd%]%RESET%
echo %B% ┌──────────────────────────────────────────────────────────────────────────────────────────────┐%RESET%
set "has_dirs=0"
for /f "delims=" %%D in ('dir /ad /b /on 2^>nul') do (
    set "line=  %G%[DIR]%RESET%  %%D                                                                                    "
    echo %B% │%RESET% !line:~0,92!          %B%│%RESET%
    set "has_dirs=1"
)
if "!has_dirs!"=="1" echo %B% ├──────────────────────────────────────────────────────────────────────────────────────────────┤%RESET%
for /f "delims=" %%F in ('dir /a-d /b /on 2^>nul') do (
    set "line=         %%F                                                                                    "
    echo %B% │%RESET% !line:~0,92! %B%│%RESET%
)
echo %B% └──────────────────────────────────────────────────────────────────────────────────────────────┘%RESET%
echo.
echo %B%╔═══════════════════════════════════════════════════════════════════════════════════════════════╗%RESET%
echo %B%║                                   CMD CLI FILE MANAGER PRO                                    ║%RESET%
echo %B%╠═══════════════════════════════════════════════════════════════════════════════════════════════╣%RESET%
echo %B%║%RESET%  [1]  REFRESH          [2]  ENTER (CD)       [3]  UP (..)          [4]  DISK INFO             %B%║%RESET%
echo %B%║%RESET%  [5]  NEW FILE         [6]  NEW FOLDER       [7]  DELETE FILE      [8]  DELETE FOLDER         %B%║%RESET%
echo %B%║%RESET%  [9]  RENAME           [10] COPY (ROBO)      [11] MOVE (ROBO)      [12] SAVE LIST             %B%║%RESET%
echo %B%║%RESET%  [13] BACKUP (MIRR)    [14] SEARCH           [15] OPEN SAVES       [16] HELP                  %B%║%RESET%
echo %B%║%RESET%  [17] ABOUT            [18] EXIT                                                              %B%║%RESET%
echo %B%╚═══════════════════════════════════════════════════════════════════════════════════════════════╝%RESET%
echo.
if defined msg echo %msg% & set "msg="
set "opcja="
set /p "opcja=%B% CMD CLI > %RESET%Select option: "

if "%opcja%"=="1" goto menu
if "%opcja%"=="2" goto enter_dir
if "%opcja%"=="3" goto up_dir
if "%opcja%"=="4" goto info
if "%opcja%"=="5" goto mkfile
if "%opcja%"=="6" goto mkdir
if "%opcja%"=="7" goto delete_file
if "%opcja%"=="8" goto delete_folder
if "%opcja%"=="9" goto rename
if "%opcja%"=="10" goto copy_robo
if "%opcja%"=="11" goto move_robo
if "%opcja%"=="12" goto save_list
if "%opcja%"=="13" goto backup
if "%opcja%"=="14" goto search
if "%opcja%"=="15" goto open_saves
if "%opcja%"=="16" goto help
if "%opcja%"=="17" goto about
if "%opcja%"=="18" exit

set "msg=%R% [!] Invalid selection!%RESET%"
goto menu

:open_saves
set "target_dir=C:\Users\%USERNAME%\.polsoft\psCLI\FileList"
if not exist "%target_dir%" mkdir "%target_dir%" 2>nul
start explorer "%target_dir%"
set "msg=%G% [+] Opening save folder...%RESET%"
goto menu

:info
cls
echo.
echo %B%  ═══ DIRECTORY AND DISK STATISTICS ═══%RESET%
echo.
echo  %Y%  [ DISK USAGE ]%RESET%
powershell -NoProfile -Command "Get-PSDrive %cd:~0,1% | Select-Object @{n='Drive';e={$_.Name}}, @{n='Used_GB';e={'{0:N2}' -f ($_.Used/1GB)}}, @{n='Free_GB';e={'{0:N2}' -f ($_.Free/1GB)}} | Format-Table -AutoSize"
echo  %Y%  [ FILE ATTRIBUTES ]%RESET%
powershell -NoProfile -Command "Get-ChildItem -File | Select-Object Name, @{n='Attributes';e={$_.Attributes}} | Format-Table -AutoSize"
echo  %Y%  [ CONTENT SUMMARY ]%RESET%
powershell -NoProfile -Command "$files = Get-ChildItem -File; $dirs = Get-ChildItem -Directory; $size = ($files | Measure-Object -Property Length -Sum).Sum / 1MB; Write-Host '  > Total Folders: ' $dirs.Count; Write-Host '  > Total Files:   ' $files.Count; Write-Host ('  > Total Size:    {0:N2} MB' -f $size)"
echo.
pause
goto menu

:save_list
set "target_dir=C:\Users\%USERNAME%\.polsoft\psCLI\FileList"
if not exist "%target_dir%" mkdir "%target_dir%" 2>nul
for %%I in ("%cd%") do set "folder_name=%%~nxI"
if "%folder_name%"=="" set "folder_name=DRIVE_%cd:~0,1%"
set "t_date=%date%"
set "timestamp=%t_date:~-4%-%t_date:~3,2%-%t_date:~0,2%"
set "filename=%target_dir%\%folder_name%_%timestamp%.txt"
(echo FILE LIST - %date% %time% & echo LOCATION: %cd% & dir /on) > "%filename%" 2>nul
if exist "%filename%" (set "msg=%G% [+] SUCCESS: List saved!%RESET%") else (set "msg=%R% [!] ERROR: Save failed%RESET%")
goto menu

:search
echo.
set /p "query= [?] Search query (e.g., *.png): "
echo.
echo  %Y%SEARCH RESULTS:%RESET%
echo %B% ┌──────────────────────────────────────────────────────────────────────────────────────────────┐%RESET%
for /f "delims=" %%S in ('dir /s /b "%query%" 2^>nul ^| findstr /v /i "FileList"') do (
    set "sline= %%S                                                                                                   "
    echo %B% │%RESET% !sline:~0,92! %B%│%RESET%
)
echo %B% └──────────────────────────────────────────────────────────────────────────────────────────────┘%RESET%
echo.
pause
goto menu

:enter_dir
set /p "folder= [?] Enter folder: "
if not exist "%folder%" (set "msg=%R% [!] ERROR: Not found!%RESET%" & goto menu)
cd /d "%folder%" 2>nul || (set "msg=%R% [!] ERROR: Access Denied!%RESET%")
goto menu

:up_dir
cd ..
goto menu

:help
cls
echo %B%╔══════════════════════════════════════════════════════════════════════════════╗%RESET%
echo %B%║                         CMD CLI FILE MANAGER PRO – HELP                      ║%RESET%
echo %B%╠══════════════════════════════════════════════════════════════════════════════╣%RESET%
echo.

echo  %Y%[1] REFRESH%RESET%        – Refreshes the current directory view.
echo  %Y%[2] ENTER (CD)%RESET%     – Enter a folder by name or full path.
echo  %Y%[3] UP (..)%RESET%        – Move one directory level up.
echo  %Y%[4] DISK INFO%RESET%      – Disk usage, file attributes, folder/file count.
echo.
echo  %Y%[5] NEW FILE%RESET%       – Create a new empty file.
echo  %Y%[6] NEW FOLDER%RESET%     – Create a new folder.
echo  %Y%[7] DELETE FILE%RESET%    – Delete a file (no confirmation).
echo  %Y%[8] DELETE FOLDER%RESET%  – Delete a folder recursively.
echo.
echo  %Y%[9] RENAME%RESET%         – Rename a file or folder.
echo  %Y%[10] COPY (ROBO)%RESET%   – Copy using ROBOCOPY (/e /r:1 /w:1).
echo  %Y%[11] MOVE (ROBO)%RESET%   – Move files/folders using ROBOCOPY.
echo  %Y%[12] SAVE LIST%RESET%     – Save directory listing to FileList folder.
echo.
echo  %Y%[13] BACKUP (MIRR)%RESET% – Mirror backup using ROBOCOPY /mir.
echo  %Y%[14] SEARCH%RESET%        – Recursive wildcard search.
echo  %Y%[15] OPEN SAVES%RESET%    – Open folder with saved lists.
echo  %Y%[16] HELP%RESET%          – Display help screen.
echo  %Y%[17] ABOUT%RESET%         – Author information.
echo  %Y%[18] EXIT%RESET%          – Exit the program.
echo.

echo %B%╠══════════════════════════════════════════════════════════════════════════════╣%RESET%
echo %B%║                               TECHNICAL NOTES                                ║%RESET%
echo %B%╠══════════════════════════════════════════════════════════════════════════════╣%RESET%
echo.
echo  • UTF‑8 enabled (chcp 65001)
echo  • ANSI color support via ESC sequence
echo  • Directory listings formatted in ASCII frames
echo  • PowerShell used for disk statistics
echo  • Status colors: %G%[+] success%RESET%, %R%[!] error%RESET%
echo  • Saves stored in: C:\Users\%%USERNAME%%\.polsoft\psCLI\FileList
echo.
echo %B%╠══════════════════════════════════════════════════════════════════════════════╣%RESET%
echo.
pause
goto menu

:mkfile
set /p "n_file= [+] New file: "
type nul > "%n_file%" 2>nul && (set "msg=%G% [+] Success%RESET%")
goto menu

:mkdir
set /p "n_f= [+] New folder: "
mkdir "%n_f%" 2>nul && (set "msg=%G% [+] Success%RESET%")
goto menu

:delete_file
set /p "p_u= [!] File to delete: "
del /f /q "%p_u%" 2>nul && (set "msg=%G% [+] Deleted%RESET%")
goto menu

:delete_folder
set /p "f_u= [!] Folder to delete: "
rd /s /q "%f_u%" 2>nul && (set "msg=%G% [+] Removed%RESET%")
goto menu

:rename
set /p "old_name= [!] Current name: "
set /p "new_name= [!] New name: "
ren "%old_name%" "%new_name%" 2>nul && (set "msg=%G% [+] Renamed%RESET%")
goto menu

:copy_robo
set /p "src= [?] Source: "
set /p "dst= [?] Destination: "
robocopy "%src%" "%dst%" /e /r:1 /w:1
set "msg=%G% [+] Copy finished.%RESET%"
goto menu

:move_robo
set /p "src= [?] Source: "
set /p "dst= [?] Destination: "
if exist "%src%\" (robocopy "%src%" "%dst%" /e /move) else (for %%F in ("%src%") do robocopy "%%~dpF." "%dst%" "%%~nxF" /move)
set "msg=%G% [+] Move finished.%RESET%"
goto menu

:backup
set /p "b_src= [?] Source: "
set /p "b_dst= [?] Destination: "
robocopy "%b_src%" "%b_dst%" /mir /mt:8
set "msg=%G% [+] Mirror Backup completed.%RESET%"
goto menu

:about
cls
echo %B%╔══════════════════════════════════════════════════════════════════════════╗%RESET%
echo %B%║                                 ABOUT                                    ║%RESET%
echo %B%╠══════════════════════════════════════════════════════════════════════════╣%RESET%
echo.
echo                        [1;42mCMD CLI File Manager Pro v1.5[0m
echo.
echo                     [2;3mAuthor:[0m Sebastian Januchowski
echo                     [2;3mEmail:[0m  polsoft.its@fastservice.com
echo                     [2;3mGitHub:[0m https://github.com/seb07uk
echo.
echo                             Freeware License
echo.
echo                  Copyright (c) 2025 Sebastian Januchowski
echo.
echo   This software is provided free of charge for personal and commercial use.
echo         You may install, run, and use this software without any fees.
echo.
echo   You are not allowed to modify, decompile, reverse engineer, or create
echo              derivative works based on this software.
echo.
echo   You may not redistribute, sell, rent, or bundle this software with other
echo         products without explicit written permission from the author.
echo.
echo   This software is provided "as is", without warranty of any kind, express
echo         or implied. The author is not liable for any damages arising from
echo                          the use of this software.
echo.
echo        By using this software, you agree to the terms of this license.
echo.
echo %B%╚══════════════════════════════════════════════════════════════════════════╝%RESET%
echo.
pause
goto menu