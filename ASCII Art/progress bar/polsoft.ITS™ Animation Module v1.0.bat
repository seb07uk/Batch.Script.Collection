@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

for /f "delims==" %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

set "length=35"
set "pos=1"
set "dir=1"

:header
cls
echo !ESC![96m┌──────────────────────────────────────────────┐
echo │    polsoft.ITS™ Animation Module v1.0        │
echo └──────────────────────────────────────────────┘!ESC![0m
echo.

for /l %%i in (1,1,250) do (
    set "bar="

    for /l %%j in (1,1,!length!) do (
        if %%j==!pos! (
            set "bar=!bar!!ESC![93m█"
        ) else (
            set "bar=!bar!!ESC![90m·"
        )
    )

    <nul set /p="!ESC![H!ESC![8;1H!ESC![0m!bar!"

    set /a pos+=dir

    if !pos! GEQ !length! set "dir=-1"
    if !pos! LEQ 1 set "dir=1"

    ping -n 1 127.0.0.1 >nul
)

echo.
echo !ESC![92m[OK] Module finished.!ESC![0m
endlocal