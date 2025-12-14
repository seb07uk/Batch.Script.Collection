:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title Kalkulator Pro v1.5
setlocal enabledelayedexpansion

rem =========================
rem Definicja kolorów ANSI
rem =========================
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"
set "CLR_RESET=%ESC%[0m"
set "CLR_RED=%ESC%[31m"
set "CLR_GREEN=%ESC%[32m"
set "CLR_YELLOW=%ESC%[33m"
set "CLR_BLUE=%ESC%[34m"

:menu
cls
echo  [2;3m2025(c) Sebastian Januchowski[0m 
echo [32m===============================[0m 
echo       [36;3;1mKalkulator Pro v1.5[0m 
echo [32m===============================[0m 
echo.
echo [1][33m Dodawanie[0m 
echo [2][33m Odejmowanie[0m 
echo [3][33m Mnozenie[0m 
echo [4][33m Dzielenie[0m 
echo [5][33m Potega[0m 
echo [6][33m Pierwiastek kwadratowy[0m 
echo [7][33m Sinus[0m 
echo [8][33m Cosinus[0m 
echo [9][33m Tangens[0m 
echo [e][31m Wyjscie[0m 
echo.
set /p opcja="Wybierz operacje: "

if "%opcja%"=="1" goto dodawanie
if "%opcja%"=="2" goto odejmowanie
if "%opcja%"=="3" goto mnozenie
if "%opcja%"=="4" goto dzielenie
if "%opcja%"=="5" goto potega
if "%opcja%"=="6" goto pierwiastek
if "%opcja%"=="7" goto sinus
if "%opcja%"=="8" goto cosinus
if "%opcja%"=="9" goto tangens
if "%opcja%"=="e" goto koniec
goto menu

rem =========================
rem Operacje
rem =========================

:dodawanie
cls
echo %CLR_BLUE%=== Dodawanie ===%CLR_RESET%
set /p a="Podaj pierwsza liczbe: "
set "a=%a:,=.%"
set /p b="Podaj druga liczbe: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { [double]::Parse(\"%a%\") + [double]::Parse(\"%b%\") } catch { 'ERR' }"`) do set "wynik=%%i"
if ":[32;1m%wynik%[0m "=="ERR" (
    echo %CLR_RED%Błąd: niepoprawne dane!%CLR_RESET%
) else (
    echo %CLR_GREEN%Wynik = :[32;1m%wynik%[0m %CLR_RESET%
)
pause
goto menu

:odejmowanie
cls
echo %CLR_BLUE%=== Odejmowanie ===%CLR_RESET%
set /p a="Podaj pierwsza liczbe: "
set "a=%a:,=.%"
set /p b="Podaj druga liczbe: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { [double]::Parse(\"%a%\") - [double]::Parse(\"%b%\") } catch { 'ERR' }"`) do set "wynik=%%i"
if ":[32;1m%wynik%[0m "=="ERR" (
    echo %CLR_RED%Błąd: niepoprawne dane!%CLR_RESET%
) else (
    echo %CLR_GREEN%Wynik = :[32;1m%wynik%[0m %CLR_RESET%
)
pause
goto menu

:mnozenie
cls
echo %CLR_BLUE%=== Mnozenie ===%CLR_RESET%
set /p a="Podaj pierwsza liczbe: "
set "a=%a:,=.%"
set /p b="Podaj druga liczbe: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { [double]::Parse(\"%a%\") * [double]::Parse(\"%b%\") } catch { 'ERR' }"`) do set "wynik=%%i"
if ":[32;1m%wynik%[0m "=="ERR" (
    echo %CLR_RED%Błąd: niepoprawne dane!%CLR_RESET%
) else (
    echo %CLR_GREEN%Wynik = :[32;1m%wynik%[0m %CLR_RESET%
)
pause
goto menu

:dzielenie
cls
echo %CLR_BLUE%=== Dzielenie ===%CLR_RESET%
set /p a="Podaj licznik: "
set "a=%a:,=.%"
set /p b="Podaj mianownik: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { $den=[double]::Parse(\"%b%\"); if ($den -eq 0) { 'DIV0' } else { [double]::Parse(\"%a%\") / $den } } catch { 'ERR' }"`) do set "wynik=%%i"
if ":[32;1m%wynik%[0m "=="ERR" (
    echo %CLR_RED%Błąd: niepoprawne dane!%CLR_RESET%
) else if ":[32;1m%wynik%[0m "=="DIV0" (
    echo %CLR_RED%Błąd: dzielenie przez zero!%CLR_RESET%
) else (
    echo %CLR_GREEN%Wynik = :[32;1m%wynik%[0m %CLR_RESET%
)
pause
goto menu

:potega
cls
set /p a="Podaj liczbe: "
set /p b="Podaj wykladnik: "
for /f %%i in ('powershell -command "[math]::Pow(%a%,%b%)"') do set wynik=%%i
echo %CLR_GREEN%Wynik = :[32;1m%wynik%[0m %CLR_RESET%
pause
goto menu

:pierwiastek
cls
echo %CLR_BLUE%=== Pierwiastek kwadratowy ===%CLR_RESET%
set /p a="Podaj liczbe: "
set "a=%a:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { $val=[double]::Parse(\"%a%\"); if ($val -lt 0) { 'NEG' } else { [math]::Sqrt($val) } } catch { 'ERR' }"`) do set "wynik=%%i"
if ":[32;1m%wynik%[0m "=="ERR" (
    echo %CLR_RED%Błąd: niepoprawna liczba!%CLR_RESET%
) else if ":[32;1m%wynik%[0m "=="NEG" (
    echo %CLR_RED%Błąd: pierwiastek z liczby ujemnej!%CLR_RESET%
) else (
    echo %CLR_GREEN%Wynik = :[32;1m%wynik%[0m %CLR_RESET%
)
pause
goto menu

:sinus
cls
set /p a="Podaj kat w stopniach: "
for /f %%i in ('powershell -command "[math]::Sin(%a% * [math]::PI / 180)"') do set wynik=%%i
echo %CLR_GREEN%sin(%a%) = :[32;1m%wynik%[0m %CLR_RESET%
pause
goto menu

:cosinus
cls
set /p a="Podaj kat w stopniach: "
for /f %%i in ('powershell -command "[math]::Cos(%a% * [math]::PI / 180)"') do set wynik=%%i
echo %CLR_GREEN%cos(%a%) = :[32;1m%wynik%[0m %CLR_RESET%
pause
goto menu

:tangens
cls
set /p a="Podaj kat w stopniach: "
for /f %%i in ('powershell -command "[math]::Tan(%a% * [math]::PI / 180)"') do set wynik=%%i
echo %CLR_GREEN%tan(%a%) = :[32;1m%wynik%[0m %CLR_RESET%
pause
goto menu

:koniec
cls
echo Do zobaczenia [1;3;32m%username%[0m.
timeout /t 3 >nul