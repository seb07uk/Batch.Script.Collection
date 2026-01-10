:: Sebastian Januchowski
:: polsotf.ITS London
@echo off
title Clear Cookies
echo.
echo Deleting cookies...
ping localhost -n 3 >nul
del /f /q "%userprofile%\Cookies\*.*"
cls
echo [3m[2mWritten by
echo         Sebastian Januchowski
echo.[0m
echo.
echo Cookies have been successfully deleted. . .
ping localhost -n 3 >nul