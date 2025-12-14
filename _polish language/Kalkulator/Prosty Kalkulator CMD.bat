:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title Prosty Kalkulator CMD

:menu
cls
echo  [2;3m2025(c) Sebastian Januchowski[0m
echo [42m===============================[0m
echo [42m=[0m    [36;3;1mProsty Kalkulator CMD[0m    [42m=[0m
echo [42m===============================[0m
echo.
echo [1] Dodawanie
echo [2] Odejmowanie
echo [3] Mnozenie
echo [4] Dzielenie
echo [e] Wyjscie
echo.
set /p opcja="Wybierz operacje: "

if "%opcja%"=="1" goto dodawanie
if "%opcja%"=="2" goto odejmowanie
if "%opcja%"=="3" goto mnozenie
if "%opcja%"=="4" goto dzielenie
if "%opcja%"=="e" goto koniec
goto menu

:dodawanie
cls
set /p a="Podaj pierwsza liczbe: "
set /p b="Podaj druga liczbe: "
set /a wynik=a+b
echo Wynik = [1;32m%wynik%[0m
pause
goto menu

:odejmowanie
cls
set /p a="Podaj pierwsza liczbe: "
set /p b="Podaj druga liczbe: "
set /a wynik=a-b
echo Wynik = [1;32m%wynik%[0m
pause
goto menu

:mnozenie
cls
set /p a="Podaj pierwsza liczbe: "
set /p b="Podaj druga liczbe: "
set /a wynik=a*b
echo Wynik = [1;32m%wynik%[0m
pause
goto menu

:dzielenie
cls
set /p a="Podaj licznik: "
set /p b="Podaj mianownik: "
if "%b%"=="0" (
    echo %CLR_RED%Blad: dzielenie przez zero!%CLR_RESET%
) else (
    for /f %%i in ('powershell -command "%a% / %b%"') do set wynik=%%i
    echo %CLR_GREEN%Wynik = [1;32m%wynik%[0m%CLR_RESET%
)
pause
goto menu

:koniec
cls
echo Do zobaczenia [1;3;32m%username%[0m^!
timeout /t 3 >nul