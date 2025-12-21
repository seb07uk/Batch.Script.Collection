:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title Calculator CMD

:menu
cls
echo  [2;3m2025(c) Sebastian Januchowski[0m
echo [42m===============================[0m
echo [42m=[0m       [36;3;1mCalculator CMD[0m        [42m=[0m
echo [42m===============================[0m
echo.
echo [1] Addition
echo [2] Subtraction
echo [3] Multiplication
echo [4] Division
echo [5] Power
echo [6] Square root
echo [e] Exit
echo.
set /p opcja="Choose operation: "

if "%opcja%"=="1" goto addition
if "%opcja%"=="2" goto subtraction
if "%opcja%"=="3" goto multiplication
if "%opcja%"=="4" goto division
if "%opcja%"=="5" goto power
if "%opcja%"=="6" goto sqrt
if "%opcja%"=="e" goto end
goto menu

:addition
cls
set /p a="Enter the first number: "
set /p b="Enter the second number: "
set /a result=a+b
echo Result = [1;32m%result%[0m
pause
goto menu

:subtraction
cls
set /p a="Enter the first number: "
set /p b="Enter the second number: "
set /a result=a-b
echo Result = [1;32m%result%[0m
pause
goto menu

:multiplication
cls
set /p a="Enter the first number: "
set /p b="Enter the second number: "
set /a result=a*b
echo Result = [1;32m%result%[0m
pause
goto menu

:division
cls
set /p a="Enter numerator: "
set /p b="Enter denominator: "
if "%b%"=="0" (
    echo %CLR_RED%Error: division by zero!%CLR_RESET%
) else (
    for /f %%i in ('powershell -command "%a% / %b%"') do set result=%%i
    echo %CLR_GREEN%Result = [1;32m%result%[0m%CLR_RESET%
)
pause
goto menu

:power
cls
set /p a="Enter the base number: "
set /p b="Enter the exponent: "
set /a result=a**b
echo Result = [1;32m%result%[0m
pause
goto menu

:sqrt
cls
set /p a="Enter the number: "
:: CMD has no built-in sqrt, so we use PowerShell
for /f %%i in ('powershell -command "[math]::Sqrt(%a%)"') do set result=%%i
echo Result = [1;32m%result%[0m
pause
goto menu

:end
cls
echo See you next time [1;3;32m%username%[0m^!
timeout /t 3 >nul