@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "length=40"
set "pos=1"
set "dir=1"

for /l %%i in (1,1,200) do (
    set "bar="
    for /l %%j in (1,1,!length!) do (
        if %%j==!pos! (
            set "bar=!bar!█"
        ) else (
            set "bar=!bar! "
        )
    )

    cls
    echo Loading...
    echo !bar!

    set /a pos+=dir
    if !pos! GEQ !length! set "dir=-1"
    if !pos! LEQ 1 set "dir=1"

    ping -n 1 127.0.0.1 >nul
)