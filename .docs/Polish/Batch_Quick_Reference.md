# 03_Batch_Quick_Reference.md - Szybkie Odniesienie Komend

Polska wersja - Quick Reference Guide dla Batch Scripts i CMD

---

## Struktury Kontrolne | Control Structures

### IF - Instrukcja Warunkowa
```batch
IF condition (commands)
IF condition (commands) ELSE (commands)
IF EXIST "file.txt" ECHO File exists
IF NOT EXIST "file.txt" ECHO File not found
IF "%var%"=="value" ECHO Match
IF /I "%var%"=="VALUE" ECHO Case-insensitive
IF ERRORLEVEL 1 ECHO Error occurred
```

### FOR - Pętla
```batch
FOR %%i IN (list) DO command         REM Po liście
FOR /L %%i IN (1,1,10) DO ECHO %%i   REM Numeryczna
FOR /F %%i IN (file.txt) DO ECHO %%i REM Po linijkach
FOR /D %%i IN (*) DO ECHO %%i        REM Po folderach
FOR /R %%i IN (*) DO ECHO %%i        REM Rekursywnie
```

### GOTO - Skok do Etykiety
```batch
GOTO label
ECHO To nie będzie wykonane
:label
ECHO To będzie wykonane
```

### CALL - Wywoływanie Podprogramów
```batch
CALL :subroutine argument
GOTO :EOF
:subroutine
REM Kod podprogramu
EXIT /B 0
```

---

## Komendy Systemowe

### Podstawowe
```batch
ECHO text              REM Wyświetl tekst
ECHO.                 REM Pusta linia
@ECHO OFF             REM Wyłącz wyświetlanie komend
PAUSE                 REM Wstrzymaj wykonanie
CLS                   REM Wyczyść ekran
EXIT /B code          REM Wyjdź z kodem
```

### Nawigacja Katalogów
```batch
CD [path]             REM Zmień katalog
PUSHD path            REM Zmień i zapamiętaj
POPD                  REM Wróć do poprzedniego
DIR [/options]        REM Lista katalogu
CD %CD%               REM Bieżący katalog
```

### Operacje na Plikach
```batch
COPY source dest      REM Kopiuj plik
MOVE source dest      REM Przenieś plik
DEL file              REM Usuń plik
REN oldname newname   REM Zmień nazwę
TYPE file             REM Wyświetl plik
FIND "text" file      REM Wyszukaj w pliku
FINDSTR pattern file  REM Regex w pliku
```

### Operacje na Katalogach
```batch
MD folder             REM Utwórz katalog
RD folder             REM Usuń katalog (pusty)
RD /S /Q folder       REM Usuń z zawartością
TREE                  REM Struktura katalogów
```

### Atrybuty Plików
```batch
ATTRIB file.txt       REM Pokaż atrybuty
ATTRIB +R file.txt    REM Ustaw read-only
ATTRIB -R file.txt    REM Usuń read-only
ATTRIB +H file.txt    REM Ukryj
```

---

## Zmienne i Parametry

### Podstawowe
```batch
SET var=value         REM Ustaw zmienną
ECHO %var%            REM Użyj zmienną
SET /A var=5+3        REM Arytmetyka
SET /P var=Prompt:    REM Wczytaj z input
```

### Wbudowane Zmienne Systemowe
```batch
%COMPUTERNAME%        REM Nazwa komputera
%USERNAME%            REM Nazwa użytkownika
%USERPROFILE%         REM Home directory
%TEMP%                REM Katalog temp
%SYSTEMROOT%          REM C:\Windows
%PATH%                REM Ścieżki
%DATE%                REM Data systemowa
%TIME%                REM Czas systemowy
%ERRORLEVEL%          REM Kod błędu
%RANDOM%              REM Liczba losowa
```

### Parametry Batch
```batch
%0                    REM Nazwa skryptu
%1-%9                 REM Argumenty 1-9
%*                    REM Wszystkie argumenty
SHIFT                 REM Przesunięcie argumentów
```

### Opóźnione Rozwijanie
```batch
SETLOCAL ENABLEDELAYEDEXPANSION
SET var=value
ECHO !var!            REM Używaj ! zamiast %
```

---

## Redirekcja i Potoki

### Pliki
```batch
command > file        REM Zapis do pliku
command >> file       REM Dodaj do pliku
command < file        REM Wczytaj z pliku
command 2> file       REM Błędy do pliku
command 2>&1          REM Błędy do stdout
command > NUL         REM Wyłącz wyjście
```

### Potoki
```batch
command1 | command2   REM Przekaż wyjście
command1 && command2  REM AND
command1 || command2  REM OR
command1 & command2   REM Sekwencja
```

---

## Zmienne Logiczne i Warunki

### Porównywanie Stringów
```batch
IF "%a%"=="value"          REM Równe
IF NOT "%a%"=="value"      REM Nierówne
IF /I "%a%"=="VALUE"       REM Bez rozróżniania
```

### Porównywanie Numeryczne
```batch
IF 5 GTR 3                 REM Greater than
IF 5 LSS 10                REM Less than
IF 5 GEQ 5                 REM Greater or equal
IF 5 LEQ 5                 REM Less or equal
IF 5 EQU 5                 REM Equal
IF 5 NEQ 10                REM Not equal
```

### Sprawdzanie Plików
```batch
IF EXIST "file"            REM Plik istnieje
IF NOT EXIST "file"        REM Plik nie istnieje
IF EXIST "*.txt"           REM Jakieś .txt
```

### Error Level
```batch
IF ERRORLEVEL 0            REM Sukces
IF ERRORLEVEL 1            REM Błąd
IF %ERRORLEVEL%==0         REM Dokładny kod
```

---

## Polecenia Sieciowe

```batch
PING host              REM Test połączenia
IPCONFIG               REM Konfiguracja IP
IPCONFIG /DISPLAYDNS   REM DNS cache
NSLOOKUP domain        REM DNS lookup
NETSTAT -AN            REM Połączenia sieciowe
TASKLIST               REM Procesy
TASKKILL /IM name.exe  REM Zamknij proces
```

---

## Administracja Systemem

```batch
SYSTEMINFO             REM Informacje systemowe
VER                    REM Wersja Windows
WMIC OS GET CAPTION    REM OS name
TASKLIST /V            REM Procesy z szczegółami
SC QUERY               REM Usługi
SCHTASKS /QUERY        REM Zaplanowane zadania
```

---

## Zaawansowane Techniki

### START - Uruchomienie Programu
```batch
START program          REM Otwórz w nowym oknie
START /B program       REM W tle
START /WAIT program    REM Czekaj na zakończenie
START /HIGH program    REM Wysoki priorytet
START /LOW program     REM Niski priorytet
```

### SET /A - Arytmetyka
```batch
SET /A x=5+3           REM 8
SET /A x=10-3          REM 7
SET /A x=3*4           REM 12
SET /A x=10/3          REM 3
SET /A x=10%%3         REM 1 (modulo)
SET /A x+=5            REM Inkrementacja
```

### FINDSTR - Zaawansowane Wyszukiwanie
```batch
FINDSTR /R "^[0-9]"    REM Regex: liczby na początek
FINDSTR /I "text"      REM Case-insensitive
FINDSTR /V "text"      REM Odwrotnie (nie zawiera)
```

---

## Obsługa Błędów

```batch
IF ERRORLEVEL 1 (
    ECHO Error!
    EXIT /B 1
)

REM Lub
command || (
    ECHO Command failed!
    EXIT /B 1
)
```

---

## Escape'owanie Znaków Specjalnych

```batch
REM Znaki wymagające ^ przed nimi:
REM & | < > ( ) [ ] { } ^ = ; ! ' + , ` ~ spacja

ECHO Pipe: ^|
ECHO Less: ^<
ECHO Greater: ^>
ECHO Ampersand: ^&

REM W cudzysłowach (większość znków jest bezpieczna)
ECHO "Text with | pipe and & ampersand"
```

---

## Szybkie Szablony

### Szablonu Skryptu Podstawowego
```batch
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM === KONFIGURACJA ===
SET scriptname=%~n0
SET scriptdir=%~dp0

REM === MAIN ===
ECHO %scriptname% started at %DATE% %TIME%

REM Twój kod tutaj

ECHO %scriptname% finished

PAUSE
ENDLOCAL
EXIT /B 0
```

### Szablonu Obsługi Błędów
```batch
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

CALL :main
EXIT /B !ERRORLEVEL!

:main
REM Kod główny
IF !ERRORLEVEL! NEQ 0 GOTO :Error
ECHO Success!
EXIT /B 0

:Error
ECHO Error occurred: !ERRORLEVEL!
EXIT /B 1
```

### Szablonu Pętli po Plikach
```batch
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

FOR /R "C:\folder" %%F IN (*.txt) DO (
    ECHO Processing: %%F
    REM Twój kod
)

ENDLOCAL
```

---

## Kolory w CMD (cmd.exe)

Użyj `cmd /t:{tło}{tekst}`

Kody:
```
0=Czarny    1=Niebieski   2=Zielony   3=Turkusowy
4=Czerwony  5=Fioletowy   6=Żółty     7=Biały
8=Szary     9=Jasnoniebiesk  a=Jasnozielony  b=Jasnobłękitny
c=Jasnoczerwony  d=Jasnofioletowy  e=Jasnożółty  f=Jasnybiały
```

Użycie:
```batch
REM Czarne tło, zielony tekst
cmd /t:02

REM W skrypcie bez możliwości zmiany
COLOR 0A
```

---

## Komendy do Zapamiętania

```
CHOICE /C YN /M "Continue?"   - Menu wyboru
TIMEOUT /T 5                   - Czekaj 5 sekund
ASSOC                          - Powiązania plików
FTYPE                          - Typy plików
SETX VAR value                 - Globalnie (rejestr)
SETLOCAL / ENDLOCAL            - Escoping zmiennych
REG ADD / REG DELETE           - Edycja rejestru
REM comment                    - Komentarz
:: comment                     - Komentarz (alt)
LABEL                          - Etykieta dysku
VOL                            - Numer dysku
```

---

## Przydatne Kombinacje

### Czyszczenie Temp
```batch
DEL /S /Q "%TEMP%\*.*" 2>NUL
```

### Kopia Zapasowa
```batch
FOR /F "tokens=2-4 delims=/ " %%a IN ('DATE /T') DO SET mydate=%%c%%a%%b
XCOPY source dest /Y /I /S
```

### Liczba Plików
```batch
FOR /F %%i IN ('DIR /B | FIND /V /C ""') DO SET count=%%i
ECHO Files: %count%
```

### Pobierz IP
```batch
FOR /F "tokens=2 delims=:" %%i IN ('IPCONFIG ^| FIND "IPv4"') DO SET IP=%%i
ECHO IP: %IP%
```

---

## WMIC - Windows Management Instrumentation

```batch
REM Informacje systemowe
WMIC OS GET CAPTION,VERSION,BUILDNUMBER
WMIC COMPUTERSYSTEM GET MANUFACTURER,MODEL
WMIC CPU GET NAME,MAXCLOCKSPEED
WMIC LOGICALDISK GET NAME,SIZE,FREESPACE

REM Procesy
WMIC PROCESS LIST BRIEF
WMIC PROCESS WHERE Name=\"notepad.exe\" CALL TERMINATE

REM Użytkownicy
WMIC USERACCOUNT GET Name,SID

REM Data/czas
WMIC OS GET LOCALDATETIME
```

---

## Zasoby Online

- Microsoft Learn: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/
- Wikipedia Batch File: https://en.wikipedia.org/wiki/Batch_file
- CMD Documentation: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/cmd

---

**Ostatnia aktualizacja:** Styczeń 2026

Polecam drukowanie lub zapisanie tego dokumentu dla szybkiego dostępu!
