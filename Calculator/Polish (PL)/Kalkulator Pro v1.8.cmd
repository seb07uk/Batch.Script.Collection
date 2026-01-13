:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
chcp 65001 >nul
title Kalkulator Pro v1.8
setlocal enabledelayedexpansion

rem =========================
rem Konfiguracja ścieżek
rem =========================
set "HIST_DIR=%userprofile%\.polsoft\psCli\Calculator"
set "HIST_FILE=%HIST_DIR%\history.txt"
if not exist "%HIST_DIR%" mkdir "%HIST_DIR%"

rem =========================
rem Definicje kolorów ANSI
rem =========================
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"
set "CLR_RESET=%ESC%[0m"
set "CLR_RED=%ESC%[31m"
set "CLR_GREEN=%ESC%[32m"
set "CLR_YELLOW=%ESC%[33m"
set "CLR_BLUE=%ESC%[34m"
set "CLR_CYAN=%ESC%[36m"
set "CLR_GRAY=%ESC%[90m"

:menu
cls
echo  [2;3m2026(c) Sebastian Januchowski[0m 
echo [32m===============================[0m 
echo         [36;3;1mKalkulator Pro v1.8[0m 
echo [32m===============================[0m 
echo.
echo [1][33m Dodawanie[0m 
echo [2][33m Odejmowanie[0m 
echo [3][33m Mnożenie[0m 
echo [4][33m Dzielenie[0m 
echo [5][33m Potęgowanie[0m 
echo [6][33m Pierwiastkowanie[0m 
echo [7][33m Sinus[0m 
echo [8][33m Cosinus[0m 
echo [9][33m Tangens[0m 
echo.
echo [h][36m Historia operacji[0m
echo [?][36m Pomoc / Instrukcja[0m
echo [e][31m Wyjście[0m 
echo.
set /p option="Wybierz operację: "

if "%option%"=="1" goto addition
if "%option%"=="2" goto subtraction
if "%option%"=="3" goto multiplication
if "%option%"=="4" goto division
if "%option%"=="5" goto power
if "%option%"=="6" goto sqrt
if "%option%"=="7" goto sine
if "%option%"=="8" goto cosine
if "%option%"=="9" goto tangent
if /i "%option%"=="h" goto show_history
if /i "%option%"=="?" goto show_help
if /i "%option%"=="e" goto end
goto menu

rem =========================
rem Pomocnik: Zapis do historii
rem =========================
:save_history
echo [%date% %time%] %~1 = %~2 >> "%HIST_FILE%"
exit /b

rem =========================
rem Moduł Pomocy
rem =========================
:show_help
cls
echo %CLR_CYAN%=== POMOC KALKULATORA PRO ===%CLR_RESET%
echo %CLR_GRAY%===========================================%CLR_RESET%
echo.
echo %CLR_YELLOW%OPERACJE:%CLR_RESET%
echo   - Standardowe: +, -, *, /
echo   - Zaawansowane: Potęgowanie (x^y), Pierwiastek kw.
echo   - Trygonometria: Sin, Cos, Tan (kąty w stopniach)
echo.
echo %CLR_YELLOW%FORMAT DANYCH:%CLR_RESET%
echo   - Aplikacja automatycznie zamienia przecinki na kropki.
echo   - Precyzja: Obsługiwana przez .NET [double] via PowerShell.
echo.
echo %CLR_YELLOW%HISTORIA:%CLR_RESET%
echo   - Wszystkie wyniki są zapisywane automatycznie w:
echo     %CLR_GRAY%%HIST_FILE%%CLR_RESET%
echo.
echo %CLR_YELLOW%AUTOR:%CLR_RESET%
echo   Sebastian Januchowski (polsoft.its)
echo %CLR_GRAY%===========================================%CLR_RESET%
pause
goto menu

rem =========================
rem Operacje Matematyczne
rem =========================

:addition
cls
echo %CLR_BLUE%=== Dodawanie ===%CLR_RESET%
set /p a="Podaj pierwszą liczbę: "
set "a=%a:,=.%"
set /p b="Podaj drugą liczbę: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { [double]::Parse(\"%a%\") + [double]::Parse(\"%b%\") } catch { 'ERR' }"`) do set "result=%%i"
if "%result%"=="ERR" (
    echo %CLR_RED%Błąd: nieprawidłowe dane!%CLR_RESET%
) else (
    echo %CLR_GREEN%Wynik = :[32;1m%result%[0m %CLR_RESET%
    call :save_history "%a% + %b%" "%result%"
)
pause
goto menu

:subtraction
cls
echo %CLR_BLUE%=== Odejmowanie ===%CLR_RESET%
set /p a="Podaj pierwszą liczbę: "
set "a=%a:,=.%"
set /p b="Podaj drugą liczbę: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { [double]::Parse(\"%a%\") - [double]::Parse(\"%b%\") } catch { 'ERR' }"`) do set "result=%%i"
if "%result%"=="ERR" (
    echo %CLR_RED%Błąd: nieprawidłowe dane!%CLR_RESET%
) else (
    echo %CLR_GREEN%Wynik = :[32;1m%result%[0m %CLR_RESET%
    call :save_history "%a% - %b%" "%result%"
)
pause
goto menu

:multiplication
cls
echo %CLR_BLUE%=== Mnożenie ===%CLR_RESET%
set /p a="Podaj pierwszą liczbę: "
set "a=%a:,=.%"
set /p b="Podaj drugą liczbę: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { [double]::Parse(\"%a%\") * [double]::Parse(\"%b%\") } catch { 'ERR' }"`) do set "result=%%i"
if "%result%"=="ERR" (
    echo %CLR_RED%Błąd: nieprawidłowe dane!%CLR_RESET%
) else (
    echo %CLR_GREEN%Wynik = :[32;1m%result%[0m %CLR_RESET%
    call :save_history "%a% * %b%" "%result%"
)
pause
goto menu

:division
cls
echo %CLR_BLUE%=== Dzielenie ===%CLR_RESET%
set /p a="Podaj licznik: "
set "a=%a:,=.%"
set /p b="Podaj mianownik: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { $den=[double]::Parse(\"%b%\"); if ($den -eq 0) { 'DIV0' } else { [double]::Parse(\"%a%\") / $den } } catch { 'ERR' }"`) do set "result=%%i"
if "%result%"=="ERR" (
    echo %CLR_RED%Błąd: nieprawidłowe dane!%CLR_RESET%
) else if "%result%"=="DIV0" (
    echo %CLR_RED%Błąd: dzielenie przez zero!%CLR_RESET%
) else (
    echo %CLR_GREEN%Wynik = :[32;1m%result%[0m %CLR_RESET%
    call :save_history "%a% / %b%" "%result%"
)
pause
goto menu

:power
cls
echo %CLR_BLUE%=== Potęgowanie ===%CLR_RESET%
set /p a="Podaj podstawę: "
set /p b="Podaj wykładnik: "
for /f %%i in ('powershell -command "[math]::Pow(%a%,%b%)"') do set result=%%i
echo %CLR_GREEN%Wynik = :[32;1m%result%[0m %CLR_RESET%
call :save_history "%a% ^ %b%" "%result%"
pause
goto menu

:sqrt
cls
echo %CLR_BLUE%=== Pierwiastkowanie ===%CLR_RESET%
set /p a="Podaj liczbę: "
set "a=%a:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { $val=[double]::Parse(\"%a%\"); if ($val -lt 0) { 'NEG' } else { [math]::Sqrt($val) } } catch { 'ERR' }"`) do set "result=%%i"
if "%result%"=="ERR" (
    echo %CLR_RED%Błąd: nieprawidłowa liczba!%CLR_RESET%
) else if "%result%"=="NEG" (
    echo %CLR_RED%Błąd: pierwiastek z liczby ujemnej!%CLR_RESET%
) else (
    echo %CLR_GREEN%Wynik = :[32;1m%result%[0m %CLR_RESET%
    call :save_history "sqrt(%a%)" "%result%"
)
pause
goto menu

:sine
cls
echo %CLR_BLUE%=== Sinus ===%CLR_RESET%
set /p a="Podaj kąt w stopniach: "
for /f %%i in ('powershell -command "[math]::Sin(%a% * [math]::PI / 180)"') do set result=%%i
echo %CLR_GREEN%sin(%a%) = :[32;1m%result%[0m %CLR_RESET%
call :save_history "sin(%a%)" "%result%"
pause
goto menu

:cosine
cls
echo %CLR_BLUE%=== Cosinus ===%CLR_RESET%
set /p a="Podaj kąt w stopniach: "
for /f %%i in ('powershell -command "[math]::Cos(%a% * [math]::PI / 180)"') do set result=%%i
echo %CLR_GREEN%cos(%a%) = :[32;1m%result%[0m %CLR_RESET%
call :save_history "cos(%a%)" "%result%"
pause
goto menu

:tangent
cls
echo %CLR_BLUE%=== Tangens ===%CLR_RESET%
set /p a="Podaj kąt w stopniach: "
for /f %%i in ('powershell -command "[math]::Tan(%a% * [math]::PI / 180)"') do set result=%%i
echo %CLR_GREEN%tan(%a%) = :[32;1m%result%[0m %CLR_RESET%
call :save_history "tan(%a%)" "%result%"
pause
goto menu

:show_history
cls
echo %CLR_BLUE%=== Historia Kalkulatora ===%CLR_RESET%
echo Plik logu: %HIST_FILE%
echo -------------------------------------------
if exist "%HIST_FILE%" (
    type "%HIST_FILE%"
) else (
    echo Brak zapisanych rekordów historii.
)
echo -------------------------------------------
pause
goto menu

:end
cls
echo Do widzenia, [1;3;32m%username%[0m^!