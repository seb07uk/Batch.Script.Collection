@echo off
title CMD Cli RegEditer v1.0 - ADMIN MODE
color 0A
chcp 852 >nul
:: --- INITIALIZE LOG FILE ---
set "log=%userprofile%\.polsoft\psCLI\Log\RegEditer_%date%.log"

if not exist "%userprofile%\.polsoft\psCLI\Log" (
    mkdir "%userprofile%\.polsoft\psCLI\Log"
)

echo [%date% %time%] Program started. >> "%log%"
:: --- SEKCJA WYMUSZANIA ADMINISTRATORA ---
:check_permissions
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :menu
) else (
    echo [i] Prosze o uprawnienia administratora...
    powershell -Command "Start-Process '%0' -Verb RunAs"
    exit /b
)
:: -----------------------------------------
:: --- INITIALIZE LOG FILE ---
set "log=%userprofile%\.polsoft\psCLI\Log\RegEditer_data.log"
if not exist "%userprofile%\.polsoft\psCLI\Log" (
    mkdir "%userprofile%\.polsoft\psCLI\Log"
)
echo [%date% %time%] Program started. >> "%log%"

:menu
cls
echo.
echo  [92m ____________________________________________polsoft.ITS London_[0m
echo  [92m^|                                                               ^|[0m
echo  [92m^|   _____   ______  _____  ______ _____ _____ _______ ______    ^|[0m
echo  [92m^|  ^|_____] ^|______ ^|  __  ^|______   ^|     ^|   ^|______ ^|_____/   ^|[0m
echo  [92m^|  ^|   ^|   ^|______ ^|__^|^|  ^|______ __^|__   ^|   ^|______ ^|    \_   ^|[0m
echo  [92m^|                                                               ^|[0m
echo  [92m^|        CMD Cli RegEditer v1.0                                 ^|[0m
echo  [92m^|                    STATUS: ADMINISTRATOR UPRAWNIONY           ^|[0m
echo  [92m^|_______________________________________________________________^|[0m
echo.
echo  [1] DODAJ NOWY WPIS (REG_SZ)
echo  [2] USUN KLUCZ LUB WARTOSC
echo  [3] EKSPORTUJ DO PLIKU .REG
echo  [4] PRZEGLADAJ KLUCZ (QUERY)
echo  [5] URUCHOM SYSTEMOWY REGEDIT
echo  [6] INFORMACJE
echo  [H] POMOC
echo  [Q] WYJSCIE
echo.
echo  ---------------------------------------------------------------
set /p choice="Wybierz opcje i nacisnij ENTER: "

if /i "%choice%"=="1" goto add
if /i "%choice%"=="2" goto delete
if /i "%choice%"=="3" goto export
if /i "%choice%"=="4" goto query
if /i "%choice%"=="5" start regedit.exe & goto menu
if /i "%choice%"=="6" goto about
if /i "%choice%"=="h" goto help
if /i "%choice%"=="q" exit
goto menu

:add
cls
echo.
echo  [ TRYB DODAWANIA ]
echo  Przyklad: HKLM\Software\MojaFirma
set /p key="SCIEZKA: "
set /p name="NAZWA WARTOSCI: "
set /p data="TRESC (DANE): "
reg add "%key%" /v "%name%" /t REG_SZ /d "%data%" /f
echo.
echo  OPERACJA ZAKONCZONA.
pause
goto menu

:delete
cls
echo.
echo  [ TRYB USUWANIA ]
set /p key="SCIEZKA KLUCZA: "
set /p name="NAZWA WARTOSCI (puste = caly klucz): "
if "%name%"=="" (reg delete "%key%" /f) else (reg delete "%key%" /v "%name%" /f)
pause
goto menu

:export
cls
echo.
echo  [ EKSPORTOWANIE ]
set /p key="KLUCZ DO EKSPORTU: "
set /p file="NAZWA PLIKU (np. kopia.reg): "
reg export "%key%" "%file%"
pause
goto menu

:query
cls
echo.
echo  [ PODGLAD REJESTRU ]
set /p key="PODAJ KLUCZ: "
reg query "%key%"
echo.
pause
goto menu

:help
cls
echo.
echo  [92m===========================[ HELP / POMOC ]=============================[0m
echo.
echo  [97mTo narzedzie pozwala na wykonywanie podstawowych operacji na[0m
echo  [97mrejestrze Windows z poziomu wiersza polecen (CMD).[0m
echo  [97mWymagane sa uprawnienia administratora.[0m
echo.
echo  [92m-----------------------------[ OPCJE ]----------------------------------[0m
echo.
echo  [96m[1] DODAJ NOWY WPIS (REG_SZ)[0m
echo      [97mDodaje wartosc typu REG_SZ do wskazanego klucza.[0m
echo      [97mWymagane dane:[0m
echo        - sciezka klucza
echo        - nazwa wartosci
echo        - tresc (dane)
echo      [93mPolecenie:[0m
echo        [93mreg add "KLUCZ" /v "NAZWA" /t REG_SZ /d "DANE" /f[0m
echo.
echo  [96m[2] USUN KLUCZ LUB WARTOSC[0m
echo      [97mUsuwa cala galez rejestru lub konkretna wartosc.[0m
echo      [97mJesli nazwa wartosci jest pusta — usuwany jest caly klucz.[0m
echo      [93mPolecenia:[0m
echo        [93mreg delete "KLUCZ" /f[0m
echo        [93mreg delete "KLUCZ" /v "NAZWA" /f[0m
echo.
echo  [96m[3] EKSPORTUJ DO PLIKU .REG[0m
echo      [97mTworzy kopie wskazanego klucza rejestru.[0m
echo      [93mPolecenie:[0m
echo        [93mreg export "KLUCZ" "plik.reg"[0m
echo.
echo  [96m[4] PRZEGLADAJ KLUCZ (QUERY)[0m
echo      [97mWyswietla wartosci, typy i dane w kluczu.[0m
echo      [93mPolecenie:[0m
echo        [93mreg query "KLUCZ"[0m
echo.
echo  [96m[5] URUCHOM SYSTEMOWY REGEDIT[0m
echo      [97mOtwiera graficzny edytor rejestru Windows.[0m
echo.
echo  [96m[6] ABOUT / INFORMACJE[0m
echo      [97mInformacje o autorze i wersji narzedzia.[0m
echo.
echo  [96m[Q] WYJSCIE[0m
echo      [97mZamyka program.[0m
echo.
echo  [92m------------------------[ DODATKOWE UWAGI ]----------------------------[0m
echo.
echo  [33m- Program automatycznie sprawdza uprawnienia administratora.
echo  - W przypadku braku uprawnien uruchamia sie ponownie z opcja "RunAs".
echo  - Wartosci REG_SZ sa dodawane z parametrem /f (force).
echo  - Sciezki rejestru musza byc podawane w pelnej formie:
echo      HKLM\Software\...\...
echo      HKCU\Software\...\...[0m
echo.
echo  [92m=======================================================================[0m
echo.
pause
goto menu
pause
goto menu

:about
cls
echo.
echo  =====================[ ABOUT / INFORMACJE ]=====================
echo.
echo              [1;3;32mCMD Cli RegEditer v1.0[0m
echo.
echo    [2;3mAuthor :[0;3m  Sebastian Januchowski
echo    [2;3mEmail  :[0;3m  polsoft.its@fastservice.com
echo    [2;3mGitHub :[0;3m  https://github.com/seb07uk
echo.
echo    [33mCMD Cli RegEditer v1.0
echo    Narzedzie do pracy z rejestrem Windows w trybie tekstowym.[0m
echo.
echo  =================================================================
echo.
pause
goto menu