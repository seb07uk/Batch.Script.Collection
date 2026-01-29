@echo off
setlocal enabledelayedexpansion

mode con cols=40 lines=5
color 07

set "length=30"
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
    echo.
    echo   TESTING MEMORY...
    echo   !bar!

    set /a pos+=dir

    if !pos! GEQ !length! set "dir=-1"
    if !pos! LEQ 1 set "dir=1"

    ping -n 1 127.0.0.1 >nul
)

echo.
echo Completed.
endlocal