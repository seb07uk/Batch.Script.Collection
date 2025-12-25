:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title Simple CMD Menu
color 0A

:menu
cls
echo ==============================
echo        SIMPLE CMD MENU
echo ==============================
echo 1. Show date and time
echo 2. List files in folder
echo 3. Open Notepad
echo 4. Exit
echo ==============================
set /p choice=Enter your option number: 

if "%choice%"=="1" goto option1
if "%choice%"=="2" goto option2
if "%choice%"=="3" goto option3
if "%choice%"=="4" goto end

echo Invalid choice!
pause
goto menu

:option1
cls
echo Current date and time:
echo %date% %time%
pause
goto menu

:option2
cls
echo Files in current folder:
dir
pause
goto menu

:option3
cls
echo Opening Notepad...
start notepad
pause
goto menu

:end
cls
echo Goodbye!
exit