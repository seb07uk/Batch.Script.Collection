@echo off
cls

:: Enable ANSI support
reg query HKCU\Console /v VirtualTerminalLevel >nul 2>&1
if %errorlevel% neq 0 (
    reg add HKCU\Console /f /v VirtualTerminalLevel /t REG_DWORD /d 1 >nul
)

:: Generate ESC
for /f "delims=" %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

:: Colors
set "BLUE=%ESC%[34m"
set "CYAN=%ESC%[36m"
set "GREEN=%ESC%[32m"
set "YELLOW=%ESC%[33m"
set "RED=%ESC%[31m"
set "RESET=%ESC%[0m"

:: Banner
echo %CYAN%@@@@@@@    @@@@@@   @@@        @@@@@@    @@@@@@   @@@@@@@@  @@@@@@@       @@@  @@@@@@@   @@@@@@%RESET%
echo %CYAN%@@@@@@@@  @@@@@@@@  @@@       @@@@@@@   @@@@@@@@  @@@@@@@@  @@@@@@@       @@@  @@@@@@@  @@@@@@@%RESET%
echo %BLUE%@@!  @@@  @@!  @@@  @@!       !@@       @@!  @@@  @@!         @@!         @@!    @@!    !@@%RESET%
echo %BLUE%!@!  @!@  !@!  @!@  !@!       !@!       !@!  @!@  !@!         !@!         !@!    !@!    !@!%RESET%
echo %GREEN%@!@@!@!   @!@  !@!  @!!       !!@@!!    @!@  !@!  @!!!:!      @!!         !!@    @!!    !!@@!!%RESET%
echo %GREEN%!!@!!!    !@!  !!!  !!!        !!@!!!   !@!  !!!  !!!!!:      !!!         !!!    !!!     !!@!!!%RESET%
echo %YELLOW%!!:       !!:  !!!  !!:            !:!  !!:  !!!  !!:         !!:         !!:    !!:         !:!%RESET%
echo %YELLOW%:!:       :!:  !:!   :!:          !:!   :!:  !:!  :!:         :!:    :!:  :!:    :!:        !:!%RESET%
echo %RED% ::       ::::: ::   :: ::::  :::: ::   ::::: ::   ::          ::    :::   ::     ::    :::: ::%RESET%
echo %RED% :         : :  :   : :: : :  :: : :     : :  :    :           :     :::  :       :     :: : :%RESET%

echo.
echo %CYAN%                  @@@        @@@@@@   @@@  @@@  @@@@@@@    @@@@@@   @@@  @@@%RESET%
echo %CYAN%                  @@@       @@@@@@@@  @@@@ @@@  @@@@@@@@  @@@@@@@@  @@@@ @@@%RESET%
echo %BLUE%                  @@!       @@!  @@@  @@!@!@@@  @@!  @@@  @@!  @@@  @@!@!@@@%RESET%
echo %BLUE%                  !@!       !@!  @!@  !@!!@!@!  !@!  @!@  !@!  @!@  !@!!@!@!%RESET%
echo %GREEN%                  @!!       @!@  !@!  @!@ !!@!  @!@  !@!  @!@  !@!  @!@ !!@!%RESET%
echo %GREEN%                  !!!       !@!  !!!  !@!  !!!  !@!  !!!  !@!  !!!  !@!  !!!%RESET%
echo %YELLOW%                  !!:       !!:  !!!  !!:  !!!  !!:  !!!  !!:  !!!  !!:  !!!%RESET%
echo %YELLOW%                   :!:      :!:  !:!  :!:  !:!  :!:  !:!  :!:  !:!  :!:  !:!%RESET%
echo %RED%                   :: ::::  ::::: ::   ::   ::   :::: ::  ::::: ::   ::   ::%RESET%
echo %RED%                  : :: : :   : :  :   ::    :   :: :  :    : :  :   ::    :%RESET%

echo.
echo.
pause