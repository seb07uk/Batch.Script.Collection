:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
title Calculator Pro v1.8
setlocal enabledelayedexpansion

rem =========================
rem Path Configuration
rem =========================
set "HIST_DIR=%userprofile%\.polsoft\psCli\Calculator"
set "HIST_FILE=%HIST_DIR%\history.txt"
if not exist "%HIST_DIR%" mkdir "%HIST_DIR%"

rem =========================
rem ANSI color definitions
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
echo         [36;3;1mCalculator Pro v1.8[0m 
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
echo.
echo [h][36m View History[0m
echo [?][36m Help / Manual[0m
echo [e][31m Exit[0m 
echo.
set /p option="Choose operation: "

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
rem Helper: Save to History
rem =========================
:save_history
echo [%date% %time%] %~1 = %~2 >> "%HIST_FILE%"
exit /b

rem =========================
rem Help Module
rem =========================
:show_help
cls
echo %CLR_CYAN%=== CALCULATOR PRO HELP ===%CLR_RESET%
echo %CLR_GRAY%===========================================%CLR_RESET%
echo.
echo %CLR_YELLOW%OPERATIONS:%CLR_RESET%
echo   - Standard math: +, -, *, /
echo   - Advanced: Power (x^y), Square root
echo   - Trig: Sine, Cosine, Tangent (enter degrees)
echo.
echo %CLR_YELLOW%INPUT FORMAT:%CLR_RESET%
echo   - The app automatically converts commas to dots.
echo   - Precision: Handled by .NET [double] via PowerShell.
echo.
echo %CLR_YELLOW%HISTORY:%CLR_RESET%
echo   - All results are saved automatically to:
echo     %CLR_GRAY%%HIST_FILE%%CLR_RESET%
echo.
echo %CLR_YELLOW%AUTHOR:%CLR_RESET%
echo   Sebastian Januchowski (polsoft.its)
echo %CLR_GRAY%===========================================%CLR_RESET%
pause
goto menu

rem =========================
rem Operations (Same as before)
rem =========================

:addition
cls
echo %CLR_BLUE%=== Addition ===%CLR_RESET%
set /p a="Enter first number: "
set "a=%a:,=.%"
set /p b="Enter second number: "
set "b=%b:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { [double]::Parse(\"%a%\") + [double]::Parse(\"%b%\") } catch { 'ERR' }"`) do set "result=%%i"
if "%result%"=="ERR" (
    echo %CLR_RED%Error: invalid data!%CLR_RESET%
) else (
    echo %CLR_GREEN%Result = :[32;1m%result%[0m %CLR_RESET%
    call :save_history "%a% + %b%" "%result%"
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
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { [double]::Parse(\"%a%\") - [double]::Parse(\"%b%\") } catch { 'ERR' }"`) do set "result=%%i"
if "%result%"=="ERR" (
    echo %CLR_RED%Error: invalid data!%CLR_RESET%
) else (
    echo %CLR_GREEN%Result = :[32;1m%result%[0m %CLR_RESET%
    call :save_history "%a% - %b%" "%result%"
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
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { [double]::Parse(\"%a%\") * [double]::Parse(\"%b%\") } catch { 'ERR' }"`) do set "result=%%i"
if "%result%"=="ERR" (
    echo %CLR_RED%Error: invalid data!%CLR_RESET%
) else (
    echo %CLR_GREEN%Result = :[32;1m%result%[0m %CLR_RESET%
    call :save_history "%a% * %b%" "%result%"
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
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { $den=[double]::Parse(\"%b%\"); if ($den -eq 0) { 'DIV0' } else { [double]::Parse(\"%a%\") / $den } } catch { 'ERR' }"`) do set "result=%%i"
if "%result%"=="ERR" (
    echo %CLR_RED%Error: invalid data!%CLR_RESET%
) else if "%result%"=="DIV0" (
    echo %CLR_RED%Error: division by zero!%CLR_RESET%
) else (
    echo %CLR_GREEN%Result = :[32;1m%result%[0m %CLR_RESET%
    call :save_history "%a% / %b%" "%result%"
)
pause
goto menu

:power
cls
echo %CLR_BLUE%=== Power ===%CLR_RESET%
set /p a="Enter base number: "
set /p b="Enter exponent: "
for /f %%i in ('powershell -command "[math]::Pow(%a%,%b%)"') do set result=%%i
echo %CLR_GREEN%Result = :[32;1m%result%[0m %CLR_RESET%
call :save_history "%a% ^ %b%" "%result%"
pause
goto menu

:sqrt
cls
echo %CLR_BLUE%=== Square root ===%CLR_RESET%
set /p a="Enter number: "
set "a=%a:,=.%"
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "try { $val=[double]::Parse(\"%a%\"); if ($val -lt 0) { 'NEG' } else { [math]::Sqrt($val) } } catch { 'ERR' }"`) do set "result=%%i"
if "%result%"=="ERR" (
    echo %CLR_RED%Error: invalid number!%CLR_RESET%
) else if "%result%"=="NEG" (
    echo %CLR_RED%Error: square root of negative number!%CLR_RESET%
) else (
    echo %CLR_GREEN%Result = :[32;1m%result%[0m %CLR_RESET%
    call :save_history "sqrt(%a%)" "%result%"
)
pause
goto menu

:sine
cls
echo %CLR_BLUE%=== Sine ===%CLR_RESET%
set /p a="Enter angle in degrees: "
for /f %%i in ('powershell -command "[math]::Sin(%a% * [math]::PI / 180)"') do set result=%%i
echo %CLR_GREEN%sin(%a%) = :[32;1m%result%[0m %CLR_RESET%
call :save_history "sin(%a%)" "%result%"
pause
goto menu

:cosine
cls
echo %CLR_BLUE%=== Cosine ===%CLR_RESET%
set /p a="Enter angle in degrees: "
for /f %%i in ('powershell -command "[math]::Cos(%a% * [math]::PI / 180)"') do set result=%%i
echo %CLR_GREEN%cos(%a%) = :[32;1m%result%[0m %CLR_RESET%
call :save_history "cos(%a%)" "%result%"
pause
goto menu

:tangent
cls
echo %CLR_BLUE%=== Tangent ===%CLR_RESET%
set /p a="Enter angle in degrees: "
for /f %%i in ('powershell -command "[math]::Tan(%a% * [math]::PI / 180)"') do set result=%%i
echo %CLR_GREEN%tan(%a%) = :[32;1m%result%[0m %CLR_RESET%
call :save_history "tan(%a%)" "%result%"
pause
goto menu

:show_history
cls
echo %CLR_BLUE%=== Calculator History ===%CLR_RESET%
echo Log File: %HIST_FILE%
echo -------------------------------------------
if exist "%HIST_FILE%" (
    type "%HIST_FILE%"
) else (
    echo No history records found.
)
echo -------------------------------------------
pause
goto menu

:end
cls
echo Goodbye, [1;3;32m%username%[0m^!