:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title CMD Calculator

:menu
cls
echo  [2;3m2025(c) Sebastian Januchowski[0m
echo [42m===============================[0m
echo [42m=[0m    [36;3;1mSimple CMD Calculator[0m    [42m=[0m
echo [42m===============================[0m
echo.
echo [1] Addition
echo [2] Subtraction
echo [3] Multiplication
echo [4] Division
echo [e] Exit
echo.
set /p option="Choose operation: "

if "%option%"=="1" goto addition
if "%option%"=="2" goto subtraction
if "%option%"=="3" goto multiplication
if "%option%"=="4" goto division
if "%option%"=="e" goto end
goto menu

:addition
cls
set /p a="Enter first number: "
set /p b="Enter second number: "
set /a result=a+b
echo Result = [1;32m%result%[0m
pause
goto menu

:subtraction
cls
set /p a="Enter first number: "
set /p b="Enter second number: "
set /a result=a-b
echo Result = [1;32m%result%[0m
pause
goto menu

:multiplication
cls
set /p a="Enter first number: "
set /p b="Enter second number: "
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

:end
cls
echo See you [1;3;32m%username%[0m^!
timeout /t 3 >nul