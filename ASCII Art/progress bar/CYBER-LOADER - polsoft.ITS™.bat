@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

for /f "delims==" %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

set "len=50"

:loop
set "bar="
for /l %%i in (1,1,%len%) do (
    set /a r=!random! %% 4
    if !r! EQU 0 (
        set "bar=!bar!!ESC![95m█"
    ) else if !r! EQU 1 (
        set "bar=!bar!!ESC![35m▓"
    ) else if !r! EQU 2 (
        set "bar=!bar!!ESC![90m░"
    ) else (
        set "bar=!bar!!ESC![97m·"
    )
)

cls
echo !ESC![96m[CYBER-LOADER] polsoft.ITS™
echo !bar!

ping -n 1 127.0.0.1 >nul
goto loop