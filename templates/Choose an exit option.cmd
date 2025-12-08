:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
chcp 65001 >nul

:end
echo   Choose an exit option

echo [1] Stay in the application
echo [2] Exit and return to CMD

choice /c 12 /n /m "Your choice: "

if errorlevel 2 goto exit_to_cmd
if errorlevel 1 goto stay_in_app

:stay_in_app
cls
echo Staying in the application...
goto menu

:exit_to_cmd
echo Closing the application and returning to CMD...
exit