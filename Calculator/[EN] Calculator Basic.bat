:: Sebastian Januchowski
:: polsotf.ITS London
:: polsoft.its@fastservice.com
@echo off
chcp 65001 >nul
title Calculator
:start
echo [3m[2mWritten by
echo         Sebastian Januchowski
echo.[0m
echo         [44mCalculator Basic[0m
echo.
set /p eq= » 
set /a ans=%eq%
echo = %ans%
echo.
echo [6mpress any key to reset . . .[0m
pause >nul
cls
goto start
