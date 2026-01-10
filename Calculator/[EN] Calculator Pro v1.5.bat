:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title Calculator Pro v1.5
setlocal enabledelayedexpansion

rem =========================
rem ANSI color definitions
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
echo       [36;3;1mCalculator Pro v1.5[0m 
echo [32m===============================[0m 
echo.
echo [1][33m Addition[0m 
echo [2][33m Subtraction[0m 
echo [3][33m Multiplication[0m 
echo [4][33m Division[0m 
echo [5][33m Power[0m 
echo [6][33m Square root[0m 
echo [7][33m Sine[0m 
echo [8][33m Cosine[0m 
echo [9][33m Tangent[0m 
echo [e][31m Exit[0m 
echo.
set /p opcja="Choose operation: "

if "%opcja%"=="1" goto addition
if "%opcja%"=="2" goto subtraction
if "%opcja%"=="3" goto multiplication
if "%opcja%"=="4" goto division
if "%opcja%"=="5" goto power
if "%opcja%"=="6" goto sqrt
if "%opcja%"=="7" goto sine
if "%opcja%"=="8" goto cosine
if "%opcja%"=="9" goto tangent
if "%opcja%"=="e" goto end
goto menu

rem =========================
rem Operations
rem =========================

:addition
cls
echo %CLR_BLUE%=== Addition ===%CLR_RESET%
set /p a="Enter first number: "
set "a=%a:,=.%"
set /p b="Enter second number: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { [double]::Parse(\"%a%\") + [double]::Parse(\"%b%\") } catch { 'ERR' }"`) do set "wynik=%%i"
if ":[32;1m%wynik%[0m "=="ERR" (
    echo %CLR_RED%Error: invalid data!%CLR_RESET%
) else (
    echo %CLR_GREEN%Result = :[32;1m%wynik%[0m %CLR_RESET%
)
pause
goto menu

:subtraction
cls
echo %CLR_BLUE%=== Subtraction ===%CLR_RESET%
set /p a="Enter first number: "
set "a=%a:,=.%"
set /p b="Enter second number: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { [double]::Parse(\"%a%\") - [double]::Parse(\"%b%\") } catch { 'ERR' }"`) do set "wynik=%%i"
if ":[32;1m%wynik%[0m "=="ERR" (
    echo %CLR_RED%Error: invalid data!%CLR_RESET%
) else (
    echo %CLR_GREEN%Result = :[32;1m%wynik%[0m %CLR_RESET%
)
pause
goto menu

:multiplication
cls
echo %CLR_BLUE%=== Multiplication ===%CLR_RESET%
set /p a="Enter first number: "
set "a=%a:,=.%"
set /p b="Enter second number: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { [double]::Parse(\"%a%\") * [double]::Parse(\"%b%\") } catch { 'ERR' }"`) do set "wynik=%%i"
if ":[32;1m%wynik%[0m "=="ERR" (
    echo %CLR_RED%Error: invalid data!%CLR_RESET%
) else (
    echo %CLR_GREEN%Result = :[32;1m%wynik%[0m %CLR_RESET%
)
pause
goto menu

:division
cls
echo %CLR_BLUE%=== Division ===%CLR_RESET%
set /p a="Enter numerator: "
set "a=%a:,=.%"
set /p b="Enter denominator: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { $den=[double]::Parse(\"%b%\"); if ($den -eq 0) { 'DIV0' } else { [double]::Parse(\"%a%\") / $den } } catch { 'ERR' }"`) do set "wynik=%%i"
if ":[32;1m%wynik%[0m "=="ERR" (
    echo %CLR_RED%Error: invalid data!%CLR_RESET%
) else if ":[32;1m%wynik%[0m "=="DIV0" (
    echo %CLR_RED%Error: division by zero!%CLR_RESET%
) else (
    echo %CLR_GREEN%Result = :[32;1m%wynik%[0m %CLR_RESET%
)
pause
goto menu

:power
cls
set /p a="Enter number: "
set /p b="Enter exponent: "
for /f %%i in ('powershell -command "[math]::Pow(%a%,%b%)"') do set wynik=%%i
echo %CLR_GREEN%Result = :[32;1m%wynik%[0m %CLR_RESET%
pause
goto menu

:sqrt
cls
echo %CLR_BLUE%=== Square root ===%CLR_RESET%
set /p a="Enter number: "
set "a=%a:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { $val=[double]::Parse(\"%a%\"); if ($val -lt 0) { 'NEG' } else { [math]::Sqrt($val) } } catch { 'ERR' }"`) do set "wynik=%%i"
if ":[32;1m%wynik%[0m "=="ERR" (
    echo %CLR_RED%Error: invalid number!%CLR_RESET%
) else if ":[32;1m%wynik%[0m "=="NEG" (
    echo %CLR_RED%Error: square root of negative number!%CLR_RESET%
) else (
    echo %CLR_GREEN%Result = :[32;1m%wynik%[0m %CLR_RESET%
)
pause
goto menu

:sine
cls
set /p a="Enter angle in degrees: "
for /f %%i in ('powershell -command "[math]::Sin(%a% * [math]::PI / 180)"') do set wynik=%%i
echo %CLR_GREEN%sin(%a%) = :[32;1m%wynik%[0m %CLR_RESET%
pause
goto menu

:cosine
cls
set /p a="Enter angle in degrees: "
for /f %%i in ('powershell -command "[math]::Cos(%a% * [math]::PI / 180)"') do set wynik=%%i
echo %CLR_GREEN%cos(%a%) = :[32;1m%wynik%[0m %CLR_RESET%
pause
goto menu

:tangent
cls
set /p a="Enter angle in degrees: "
for /f %%i in ('powershell -command "[math]::Tan(%a% * [math]::PI / 180)"') do set wynik=%%i
echo %CLR_GREEN%tan(%a%) = :[32;1m%wynik%[0m %CLR_RESET%
pause
goto menu

:end
cls
echo See you [1;3;32m%username%[0m^!
timeout /t 3 >nul