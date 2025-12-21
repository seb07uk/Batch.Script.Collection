@echo off
setlocal enabledelayedexpansion

:: Konsola i kolory
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1
mode con cols=85 lines=30

set "esc="
set "c_res=%esc%[0m"
set "c_hid=%esc%[90m#%c_res%"
set "c_min=%esc%[91m*%c_res%"
set "c_empty= "
set "border=%esc%[90m|%c_res%"
for /l %%i in (1,1,9) do set "c_%%i=%esc%[9!i!m%%i%c_res%"

:: Ścieżki zapisu
set "save_dir=%userprofile%\.polsoft\hi-score"
set "save_file=%save_dir%\Minesweeper.txt"
if not exist "%save_dir%" mkdir "%save_dir%"

:main_menu
cls
echo %esc%[93m====================%c_res%
echo       [1;3;32mSaper CLI[0m
echo %esc%[93m====================%c_res%
echo.
echo  [1] [1;3;36mNowa gra[0m
echo  [2] [1;3;36mHi-Score[0m
echo  [3] [1;3;36mO grze[0m
echo  [4] [1;3;31mWyjscie[0m
echo.
choice /C 1234 /N /M "Wybor: "
set "choice=%errorlevel%"
if %choice%==1 goto difficulty_menu
if %choice%==2 goto hi_score
if %choice%==3 goto about
if %choice%==4 exit
goto main_menu

:difficulty_menu
cls
echo Wybierz trudnosc:
echo.
echo  [1] [1;3;32mLatwy (10 min)[0m
echo  [2] [1;3;34mSredni (15 min)[0m 
echo  [3] [1;3;31mEkspert (20 min)[0m
echo.
choice /C 123 /N /M "Wybor: "
set "d_choice=%errorlevel%"
if %d_choice%==1 set "m_max=10" & set "level=Latwy"  & set "ptk=1"
if %d_choice%==2 set "m_max=15" & set "level=Sredni" & set "ptk=2"
if %d_choice%==3 set "m_max=20" & set "level=Ekspert" & set "ptk=3"
if not defined m_max goto difficulty_menu
goto init

:hi_score
cls
echo             [1;3;32mTABELA WYNIKOW[0m
echo [34m----------------------------------------[0m
echo [34m^|[0m   [1;3;35mPTK[0m    [34m^|[0m    [1;3;35mIMIE[0m     [34m^|[0m   [1;3;35mPOZIOM[0m    [34m^|[0m
echo [34m-----------+-------------+--------------[0m
if not exist "%save_file%" (
    echo Brak zapisanych wynikow.
) else (
    for /f "tokens=1-4 delims=^|" %%a in ('sort /r "%save_file%"') do (
        set "s_raw=%%a"
        set "s_val=!s_raw: =!"
        set "n_raw=%%b"
        set "n_val=!n_raw: =!"
        set "l_raw=%%c"
        set "l_val=!l_raw: =!"
        set "c1=  !s_val!      "
        set "c1=!c1:~0,8!"
        set "c2=  !n_val!         "
        set "c2=!c2:~0,11!"
        set "c3=  !l_val!         "
        set "c3=!c3:~0,11!"
        echo [34m^|[0m !c1! [34m^|[0m !c2! [34m^|[0m !c3! [34m^|[0m
    )
)
echo [34m----------------------------------------[0m
echo.
pause
goto main_menu

:about
cls
echo %esc%[93m=====================================================================================%c_res%
echo                                   O Grze - Saper CLI
echo %esc%[93m=====================================================================================%c_res%
echo.
echo  [32mAutor:[0m   [1;3;36mSebastian Januchowski[0m
echo  [32mEmail:[0m   [1;3;36mpolsoft.its@fastservice.com[0m
echo  [32mGitHub:[0m  [1;3;36mhttps://github.com/seb07uk[0m
echo.
echo  [1;3;35mOpis:[0m
echo    [1;3mKlasyczny Saper. Odkrywaj pola na planszy 8x8 i unikaj min.
echo    Liczby wskazuja ile min znajduje sie w 8 sasiadach danego pola.
echo    Wygrywasz, gdy liczba zakrytych pol rowna sie liczbie min (%m_max%).
echo    Przegrywasz, gdy odkryjesz pole z mina.
echo.
echo  [1;3;35mSterowanie:[0m
echo    [1;3m- Wpisz wspolrzedne w formacie: xy lub x y (np. 11, 38).
echo    - x to kolumna (1-8), y to wiersz (1-8).
echo    - Pierwszy ruch jest zawsze bezpieczny (miny losowane po nim).
echo    - Brak flagowania pol (skupiamy sie na szybkim odkrywaniu).
echo.
echo  [1;3;35mPunktacja:[0m
echo    [1;3m- Latwy: +1 ptk za ruch
echo    - Sredni: +2 ptk za ruch
echo    - Ekspert: +3 ptk za ruch
echo    - Wyniki zapisywane sa w Hi-Score i sortowane malejaco.
echo.
echo %esc%[93m=====================================================================================%c_res%
pause
goto main_menu

:init
set "w=8" & set "h=8"
set "loose=0" & set "first_move=1"
set "score=0" & set "rev_total=0"
set "t_start=%time%"
for /l %%y in (1,1,%h%) do for /l %%x in (1,1,%w%) do (
    set "m_%%x_%%y=0"
    set "v_%%x_%%y=HID"
)

:loop
cls
set "hidden_count=0"
for /l %%y in (1,1,%h%) do for /l %%x in (1,1,%w%) do (
    if "!v_%%x_%%y!"=="HID" set /a "hidden_count+=1"
)
echo [1;3;37;40mSAPER[0m ^| [1;36m%level%[0m ^| [1;31mMiny: %m_max%[0m ^| [1;33mPUNKTY: %esc%[92m%score%%c_res%
echo.
echo      1   2   3   4   5   6   7   8
echo    +---+---+---+---+---+---+---+---+
for /l %%y in (1,1,%h%) do (
    set "row= %%y %border%"
    for /l %%x in (1,1,%w%) do (
        if "!v_%%x_%%y!"=="HID" (set "row=!row! %c_hid% %border%") else (
            set "val=!m_%%x_%%y!"
            if "!val!"=="M" (set "row=!row! %c_min% %border%") else (
                if "!val!"=="EMPTY" (set "row=!row! %c_empty% %border%") else (set "row=!row! !c_%val%! %border%")
            )
        )
    )
    echo !row!
    echo    +---+---+---+---+---+---+---+---+
)
if %loose% equ 1 (echo. & echo %esc%[91m[ BOOM ] Przegrana!%c_res% & goto end_game)
if %hidden_count% equ %m_max% (echo. & echo %esc%[92m[ WYGRANA ] Gratulacje!%c_res% & goto end_game)

set "inp="
set /p "inp=[32mRuch[0m (xy lub x y): "
set "s=!inp: =!"
if "!s!"=="" goto loop
if "!s:~1,1!"=="" goto loop
set "cx=!s:~0,1!"
set "cy=!s:~1,1!"
if not defined v_%cx%_%cy% goto loop
if not "!v_%cx%_%cy%!"=="HID" goto loop

if "%first_move%"=="1" (
    set "first_move=0"
    call :place_mines %cx% %cy%
)
if "!m_%cx%_%cy%!"=="M" (
    set "loose=1"
    for /l %%y in (1,1,%h%) do for /l %%x in (1,1,%w%) do if "!m_%%x_%%y!"=="M" set "v_%%x_%%y=REV"
    goto loop
)
call :reveal %cx% %cy%
goto loop

:place_mines
set "c=0"
:pm_gen
set /a "rx=(!random!%%w)+1, ry=(!random!%%h)+1"
if %1 equ !rx! if %2 equ !ry! goto pm_gen
if "!m_!rx!_!ry!!"=="M" goto pm_gen
set "m_!rx!_!ry!=M" & set /a "c+=1"
if !c! lss %m_max% goto pm_gen
for /l %%y in (1,1,%h%) do for /l %%x in (1,1,%w%) do if not "!m_%%x_%%y!"=="M" (
    set "n=0"
    for /l %%i in (-1,1,1) do for /l %%j in (-1,1,1) do (
        set /a "sx=%%x+%%i, sy=%%y+%%j"
        if defined m_!sx!_!sy! if "!m_!sx!_!sy!!"=="M" set /a "n+=1"
    )
    if !n! equ 0 (set "m_%%x_%%y=EMPTY") else (set "m_%%x_%%y=!n!")
)
goto :eof

:reveal
if not defined m_%1_%2 goto :eof
if not "!v_%1_%2!"=="HID" goto :eof
set /a "rev_total+=1"
set /a "score+=!ptk!"
set "v_%1_%2=REV"
if "!m_%1_%2!"=="EMPTY" (
    for /l %%i in (-1,1,1) do for /l %%j in (-1,1,1) do (
        if not "%%i %%j"=="0 0" (
            set /a "nx=%1+%%i, ny=%2+%%j"
            if defined m_!nx!_!ny! if "!v_!nx!_!ny!!"=="HID" (
                if %%i equ 0 (call :reveal !nx! !ny!) else (
                    if %%j equ 0 (call :reveal !nx! !ny!) else (
                        set /a "rev_total+=1"
                        set /a "score+=!ptk!"
                        set "v_!nx!_!ny!=REV"
                    )
                )
            )
        )
    )
)
goto :eof

:end_game
set "t_end=%time%"
set /a "h1=1%t_start:~0,2%-100, m1=1%t_start:~3,2%-100, s1=1%t_start:~6,2%-100"
set /a "h2=1%t_end:~0,2%-100, m2=1%t_end:~3,2%-100, s2=1%t_end:~6,2%-100"
set /a "sec=(h2*3600+m2*60+s2)-(h1*3600+m1*60+s1)"
if %sec% lss 0 set /a "sec+=86400"

echo.
echo [1;3;31mKONIEC GRY![0m Wynik: [1;3;33m%score% Ptk[0m
set /p "u_name=Podaj imie: [1;3;36m"
echo.[0m
if "!u_name!"=="" set "u_name=Gracz"
set "u_name=!u_name: =_!"

:: NOWY SYSTEM WYROWNANIA - DOKŁADNE SPACJE
set "f_score=0000%score%" & set "f_score=!f_score:~-4!"
set "f_name=!u_name!                    " & set "f_name=!f_name:~0,19!"
set "f_lvl=%level%            " & set "f_lvl=!f_lvl:~0,10!"

:: Linia zapisu dopasowana co do spacji do naglowka
echo  !f_score!    ^| !f_name! ^| !f_lvl! >> "%save_file%"
set "cnt=0"
> "%save_dir%\Minesweeper.tmp" (
    for /f "usebackq tokens=* delims=" %%L in (`sort /r "%save_file%"`) do (
        set /a cnt+=1
        if !cnt! leq 7 echo %%L
    )
)
move /y "%save_dir%\Minesweeper.tmp" "%save_file%" >nul
pause
goto main_menu
