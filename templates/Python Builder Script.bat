:: Created by Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title Python Builder Script
pip install pyinstaller
echo.
echo [1;3;32mStep 1/3 done![0m
echo.
pyinstaller --onefile --windowed main.py
echo.
echo [1;3;32mStep 2/3 done![0m
echo.
pyinstaller --onefile --windowed --icon=icon.ico --version-file=version.txt main.py
echo.
echo [1;3;32mStep 3/3 done!
echo.
echo [1;3;32mAll done![0m
echo.
timeout /t 3 >nul