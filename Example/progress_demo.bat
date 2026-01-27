@echo off
title Przykladowe paski postepu

echo ================================
echo   DEMO PASKOW POSTEPU CMD
echo ================================
echo.

echo 1) Prosty pasek postepu:
for /l %%i in (1,1,20) do (
    set /p "="="=" <nul
    ping -n 1 127.0.0.1 >nul
)
echo.
echo Gotowe!
echo.

echo 2) Pasek procentowy:
setlocal enabledelayedexpansion
for /l %%i in (1,1,100) do (
    cls
    echo Postep: %%i%%
    echo.
    set "bar="
    for /l %%j in (1,1,%%i) do set "bar=!bar!#"
    echo !bar!
    ping -n 1 127.0.0.1 >nul
)
endlocal
echo.
echo Zakonczono pasek procentowy.
echo.

echo 3) Animowany pasek (spinner):
set chars=\|/- 
for /l %%i in (1,1,30) do (
    for %%c in (%chars%) do (
        <nul set /p="Pracuje... %%c"
        ping -n 1 127.0.0.1 >nul
        <nul set /p="`r"
    )
)
echo.
echo Animacja zakonczona.
echo.

echo Wszystkie przyklady wykonane.
pause
