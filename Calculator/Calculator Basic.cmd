:: Sebastian Januchowski
:: polsotf.ITS London
:: polsoft.its@fastservice.com
@echo off
chcp 65001 >nul
title Calculator

:start
cls
echo [3m[2mWritten by
echo           Sebastian Januchowski
echo.[0m
echo           [44mCalculator Basic[0m
echo.

set "eq="
set /p eq= » 

:: Zabezpieczenie przed pustym wejściem
if "%eq%"=="" goto start

:: Obliczenia
set /a ans=%eq% 2>nul

echo = %ans%
echo.
echo [6mpress any key to reset . . .[0m
pause >nul
goto start