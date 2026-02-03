@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

for /f "delims==" %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

set "length=40"
set "pos=1"
set "dir=1"

for /l %%i in (1,1,300) do (
    set "bar="

    for /l %%j in (1,1,!length!) do (
        if %%j==!pos! (
            rem zielony neon
            set "bar=!bar!!ESC![92m█"
        ) else (
            rem ciemny szary tło
            set "bar=!bar!!ESC![90m·"
        )
    )

    <nul set /p="!ESC![2J!ESC![H!ESC![97m polsoft.ITS™ TUI Engine v1.0 !ESC![0m

!bar!"

    set /a pos+=dir

    if !pos! GEQ !length! set "dir=-1"
    if !pos! LEQ 1 set "dir=1"

    ping -n 1 127.0.0.1 >nul
)

echo.
echo Animation finished.
endlocal