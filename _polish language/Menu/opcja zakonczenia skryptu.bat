:: Sebastian Januchowski
:: polsoft.its@fastservice.com
:: https://github.com/seb07uk
@echo off
chcp 65001 >nul

:koniec
echo   Wybierz opcję zakończenia

echo [1] Pozostan w aplikacji
echo [2] Wyjdz i wroc do CMD

choice /c 12 /n /m "Twoj wybor: "

if errorlevel 2 goto exit_to_cmd
if errorlevel 1 goto stay_in_app

:stay_in_app
cls
echo Pozostajesz w aplikacji...
goto menu

:exit_to_cmd
echo Zamykanie aplikacji i powrót do CMD...
exit