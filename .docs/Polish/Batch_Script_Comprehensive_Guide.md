# 02_Batch_Script_Comprehensive_Guide.md - Kompleksowy Poradnik

**Data:** Styczeń 2026  
**Temat:** Kompletny przewodnik po skryptach Batch i CMD dla Windows  
**Źródła:** Microsoft Learn, Wikipedia, polsoft.its

---

## Spis Treści

1. [Wprowadzenie](#wprowadzenie)
2. [Historia Batch Scripts](#historia-batch-scripts)
3. [Rozszerzenia Plików](#rozszerzenia-plików)
4. [Architektura i Interpretery](#architektura-i-interpretery)
5. [Podstawowe Komendy](#podstawowe-komendy)
6. [Zmienne Środowiskowe](#zmienne-środowiskowe)
7. [Konstrukty Kontrolne](#konstrukty-kontrolne)
8. [Parametry i Argumenty](#parametry-i-argumenty)
9. [Redirekcja i Potoki](#redirekcja-i-potoki)
10. [Zaawansowane Techniki](#zaawansowane-techniki)
11. [Bezpieczeństwo i Ograniczenia](#bezpieczeństwo-i-ograniczenia)
12. [Przykłady Praktyczne](#przykłady-praktyczne)

---

## Wprowadzenie | Introduction

Batch Scripts, znane też jako **pliki wsadowe** lub **skrypty wsadowe**, to pliki tekstowe zawierające sekwencje poleceń wykonywane liniowo przez interpreter wiersza poleceń systemu operacyjnego Windows. Termin "batch" pochodzi z terminologii *batch processing* - przetwarzania wsadowego, co oznacza wykonywanie zadań nieinteraktywnie.

### Co to jest Batch Script?

Batch script to:
- **Plik tekstowy** zapisany w formacie UTF-8 lub OEM
- **Sekwencja poleceń** wykonywana w kolejności liniowej
- **Narzędzie automatyzacji** systemowych zadań
- **Język programowania** niski poziomem z podstawowymi strukturami kontrolnymi

### Zastosowania

- Automatyzacja rutynowych zadań systemowych
- Zarządzanie użytkownikami i kontami
- Tworzenie kopii zapasowych
- Instalacja i aktualizacja oprogramowania
- Czyszczenie tymczasowych plików
- Zarządzanie procesami i usługami
- Administracja siecią
- Uruchamianie zaplanowanych zadań

---

## Historia Batch Scripts

### Początki: MS-DOS (1981-2000s)

**MS-DOS** był pierwszym systemem operacyjnym, który wprowadził obsługę plików wsadowych (.BAT). Gdy system wczytywał się, szukał pliku specjalnego:

```batch
AUTOEXEC.BAT
```

Plik ten automatycznie wykonywał się podczas startu systemu i zawierał:
- Inicjalizację zmiennych środowiskowych
- Załadowanie sterowników rezydentnych
- Programów systemowych
- Konfiguracji sieci

**Interpreter:** `COMMAND.COM` - pierwszy interpreter wiersza poleceń w MS-DOS

### Era Windows 3.1x i Windows 9x (1992-2001)

W wczesnych wersjach Windows system zachowywał obsługę plików `.BAT`, uruchamiając je poprzez:
- `COMMAND.COM` (16-bitowy interpreter)
- Możliwość uruchamiania z poziomu MS-DOS Prompt w Windows

### Windows NT i Współczesność (2001-present)

Rewolucja dotarła wraz z **Windows NT**. Microsoft wprowadził:

- **cmd.exe** - 32-bitowy interpreter (o wiele bardziej zaawansowany)
- **Rozszerzenie `.cmd`** - specjalnie dla Windows NT
- **Ulepszone możliwości** przetwarzania poleceń
- **Obsługę zmiennych z opóźnionym rozwijaniem**

**Od Windows 8 wzwyż:** cmd.exe jest standardowym interpreterem. COMMAND.COM jest dostępny tylko w 32-bitowych wersjach Windows NT dla kompatybilności wstecznej.

### Alternatywne Interpretery

- **4DOS/4OS2/4NT** - ulepszone interpretery z rozszerzeniami
- **Take Command** - zaawansowany shell komercyjny
- **PowerShell** (2006) - nowoczesna alternatywa z obiektowym podejściem

---

## Rozszerzenia Plików

### .BAT (Batch)

```
Rozszerzenie: .bat
Interpreter: COMMAND.COM lub cmd.exe
Kompatybilność: DOS, Windows 9x, Windows NT (wszystkie wersje)
Zastosowanie: Uniwersalne, wsadowe
```

**Charakterystyka:**
- Działa na wszystkich wersjach Windows
- Może zawierać polecenia zarówno dla COMMAND.COM jak i cmd.exe
- Zachowanie może się różnić między interpreterami

**Przykład:**
```batch
@ECHO OFF
REM To jest plik BAT
ECHO Hello from BAT file
PAUSE
```

### .CMD (Command)

```
Rozszerzenie: .cmd
Interpreter: cmd.exe (Windows NT)
Kompatybilność: Windows NT, Windows 2000 i nowsze
Zastosowanie: Zaawansowane skrypty systemowe
```

**Charakterystyka:**
- Specjalnie dla Windows NT i nowsze
- COMMAND.COM nie rozpoznaje tego rozszerzenia (bezpieczeństwo)
- Pełne wsparcie dla ulepszeń cmd.exe
- Różne zachowanie niektórych poleceń (np. `errorlevel`)

**Różnice między .BAT a .CMD:**
| Aspekt | .BAT | .CMD |
|--------|------|------|
| Interpreter | COMMAND.COM, cmd.exe | Tylko cmd.exe |
| Kompatybilność | Szeroka | Windows NT+ |
| errorlevel | Zmienia się tylko na błędy | Zmienia się zawsze |
| Bezpieczeństwo | Mniejsze | Większe |

### .BTM (Batch Macro)

```
Rozszerzenie: .btm
Interpreter: 4DOS, 4OS2, 4NT, Take Command
Zastosowanie: Zaawansowane skrypty
```

**Charakterystyka:**
- Szybsze przetwarzanie (wczytanie całego pliku)
- Więcej zaawansowanych funkcji
- Niedostępne w standardowym Windows

**Porównanie wydajności:**
- Skrypty `.btm` są szybsze na dłuższych plikach
- Są wczytywane całkowicie do pamięci przed wykonaniem
- Idealne do zaawansowanych operacji

---

## Architektura i Interpretery

### cmd.exe vs COMMAND.COM

#### COMMAND.COM (Interpreter 16-bitowy)

```
Wersja: 1.0 (MS-DOS)
Typ: 16-bitowy
Status: Przestarzały
Dostępność: Tylko Windows 9x i 32-bitowe Windows NT
```

**Możliwości:**
- Podstawowe poleceń systemowe
- Zmienne środowiskowe
- Proste przepływy kontrolne (IF, FOR, GOTO)
- Brak obsługi opóźnionego rozwijania zmiennych
- Ograniczone możliwości edycji linii poleceń

**Polecenia wspierane:**
- ECHO, DIR, CD, COPY, DEL, TYPE
- IF, FOR, GOTO, CALL
- SET, PATH, PROMPT

#### cmd.exe (Interpreter 32-bitowy)

```
Wersja: 6.1+ (Windows 7 i nowsze)
Typ: 32-bitowy
Status: Aktualnie wspierany
Dostępność: Wszystkie nowoczesne Windows
```

**Ulepszone możliwości:**
- Wszystko co COMMAND.COM + więcej
- **Rozszerzenia poleceń** (Command Extensions)
- **Opóźnione rozwijanie zmiennych** (!VARIABLE!)
- Zaawansowana edycja linii poleceń
- Uzupełnianie nazw plików (Tab completion)
- Obsługę parametrów cmd.exe
- Lepszą obsługę znaków specjalnych

**Składnia cmd.exe:**
```cmd
cmd [/c|/k] [/s] [/q] [/d] [/a|/u] [/t:{<b><f>}] [/e:{on|off}] [/f:{on|off}] [/v:{on|off}] [<string>]
```

**Parametry cmd.exe:**

| Parametr | Opis |
|----------|------|
| `/c` | Wykonaj polecenie i zamknij |
| `/k` | Wykonaj polecenie i zostań otwarty |
| `/s` | Modyfikuje traktowanie znaków specjalnych |
| `/q` | Wyłącz echo (quiet mode) |
| `/d` | Wyłącz AutoRun z rejestru |
| `/a` | Format ANSI dla wyjścia |
| `/u` | Format Unicode dla wyjścia |
| `/t:{b}{f}` | Kolory (tło - b, tekst - f) |
| `/e:on\|off` | Włącz/wyłącz rozszerzenia poleceń |
| `/f:on\|off` | Włącz/wyłącz uzupełnianie nazw |
| `/v:on\|off` | Włącz/wyłącz opóźnione rozwijanie |

**Kody kolorów dla /t:**
```
0=Czarny    1=Niebieski   2=Zielony    3=Turkusowy
4=Czerwony  5=Fioletowy   6=Żółty      7=Biały
8=Szary     9=Jasnoniebiesk  a=Jasnozielony  b=Jasnobł
c=Jasnoczerwony  d=Jasnofioletowy  e=Jasnożółty  f=Jasnybiały
```

**Przykłady użycia:**
```batch
REM Wykonaj polecenie i zamknij
cmd /c dir

REM Uruchom PowerShell
cmd /k powershell

REM Włącz Unicode
cmd /u /c chcp 65001

REM Bezpośrednio polecenie z kolorem
cmd /t:0A /c echo Zielony tekst na czarnym tle

REM Wyłącz AutoRun i wykonaj skrypt
cmd /d /c script.bat
```

### Włączanie/wyłączanie rozszerzeń poleceń

**Globalnie (rejestr):**
```
HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\EnableExtensions
HKEY_CURRENT_USER\Software\Microsoft\Command Processor\EnableExtensions
```

Ustaw REG_DWORD na: `0x1` (włączone) lub `0x0` (wyłączone)

**W skrypcie:**
```batch
REM Włącz rozszerzenia
cmd /e:on

REM Wyłącz rozszerzenia (dla kompatybilności)
cmd /e:off
```

---

## Podstawowe Komendy

### Komendy Systemowe

#### ECHO - Wyświetlanie tekstu

```batch
@ECHO OFF              REM Wyłącz wyświetlanie poleceń
ECHO.                  REM Pusta linia
ECHO Hello World       REM Wyświetl tekst
ECHO. >> file.txt      REM Dodaj pustą linię do pliku
```

**Parametry:**
- `ECHO` - wyświetl bieżący stan
- `ECHO ON` - włącz wyświetlanie poleceń
- `ECHO OFF` - wyłącz wyświetlanie poleceń
- `@ECHO OFF` - wyłącz wyświetlanie dla bieżącego wiersza

#### PAUSE - Wstrzymanie wykonania

```batch
PAUSE                  REM "Press any key to continue..."
PAUSE > NUL            REM Pauza bez komunikatu (wymaga polecenia)
```

#### CLS - Czyszczenie ekranu

```batch
CLS                    REM Wyczyść ekran
```

#### DIR - Wyświetlanie zawartości katalogu

```batch
DIR                    REM Katalog bieżący
DIR C:\Windows         REM Katalog sprecyzowany
DIR /S                 REM Rekursywnie
DIR /A:H               REM Tylko ukryte pliki
DIR /B                 REM Format prosty (bez nagłówka)
DIR /O:N               REM Sortuj po nazwie
DIR *.txt              REM Tylko pliki .txt
```

**Parametry:**
```
/S - Rekurencyjnie z podkatalogami
/B - Prosty format (bare)
/A - Atrybuty (H=ukryty, S=systemowy, R=readonly, A=archum)
/O - Sortowanie (N=nazwa, D=data, S=rozmiar)
/P - Pauza na każdej stronie
/W - Format szeroki
```

#### CD / CHDIR - Zmiana katalogu

```batch
CD                     REM Wyświetl bieżący katalog
CD \                   REM Do katalogu głównego
CD Windows             REM Do podkatalogu
CD ..                  REM Katalog nadrzędny
CHDIR C:\Program Files REM Pełna ścieżka
PUSHD C:\temp          REM Zmień i zapamiętaj
POPD                   REM Wróć do poprzedniej lokalizacji
```

#### COPY - Kopiowanie plików

```batch
COPY source.txt dest.txt          REM Prosty kopia
COPY file.txt C:\backup\          REM Do katalogu
COPY *.txt C:\backup\             REM Wiele plików
COPY /Y source.txt dest.txt       REM Bez pytania o nadpisanie
COPY /V source.txt dest.txt       REM Weryfikuj po skopiowaniu
```

#### MOVE - Przenoszenie/zmiana nazwy

```batch
MOVE oldname.txt newname.txt      REM Zmiana nazwy
MOVE file.txt C:\backup\          REM Przeniesienie
MOVE /Y file.txt dest\            REM Bez pytania
```

#### DEL / ERASE - Usuwanie plików

```batch
DEL file.txt                      REM Usuń plik
DEL /Q file.txt                   REM Bez pytania
DEL /S *.tmp                      REM Usuń rekursywnie
DEL /F /S /Q C:\temp\*.*          REM Wymuś, rekursywnie, bez pytania
```

⚠️ **UWAGA:** `DEL /Q *.*` usuwa WSZYSTKIE pliki bez pytania!

#### REN / RENAME - Zmiana nazwy

```batch
REN oldname.txt newname.txt       REM Zmiana nazwy
RENAME *.old *.bak                REM Zmień rozszerzenie
```

#### MD / MKDIR - Tworzenie katalogu

```batch
MD newfolder                      REM Utwórz katalog
MKDIR C:\path\to\folder           REM Pełna ścieżka
MD "My Folder"                    REM Z spacjami
```

#### RD / RMDIR - Usuwanie katalogu

```batch
RD foldername                     REM Katalog pusty
RMDIR /S /Q folder                REM Katalog z zawartością, bez pytania
```

#### TYPE - Wyświetlenie zawartości pliku

```batch
TYPE file.txt                     REM Wyświetl plik
TYPE file.txt | MORE              REM Ze stronicowaniem
TYPE file.txt > output.txt        REM Zapis do pliku
```

#### ATTRIB - Zmiana atrybutów

```batch
ATTRIB file.txt                   REM Wyświetl atrybuty
ATTRIB +R file.txt                REM Ustaw read-only
ATTRIB -R file.txt                REM Usuń read-only
ATTRIB +H file.txt                REM Ukryj plik
ATTRIB -A *.* /S                  REM Wyczyść archum rekursywnie
```

**Atrybuty:**
```
A = Archum (backup flag)
H = Hidden (ukryty)
R = Read-only (tylko do odczytu)
S = System
```

#### FIND / FINDSTR - Wyszukiwanie tekstu

```batch
FIND "text" file.txt              REM Znajdź "text" w pliku
FIND /C "text" file.txt           REM Policz wystąpienia
FINDSTR "pattern" file.txt        REM Wyszukaj pattern (regex)
FINDSTR /S "text" C:\*            REM Rekursywnie
```

#### FC - Porównywanie plików

```batch
FC file1.txt file2.txt            REM Porównaj pliki tekstowe
FC /B file1.bin file2.bin         REM Porównaj binarne
```

---

## Zmienne Środowiskowe

### Definiowanie Zmiennych

```batch
SET MyVar=Hello           REM Zdefiniuj zmienną
SET MyVar=%MyVar% World   REM Dołącz do istniejącej
SET /A Result=5+3         REM Operacja arytmetyczna
SET /P UserInput=Input: <NUL  REM Wczytaj od użytkownika
```

### Używanie Zmiennych

```batch
ECHO %MyVar%              REM Rozwiń zmienną
ECHO %USERNAME%           REM Wbudowana zmienna systemowa
ECHO %CD%                 REM Bieżący katalog
ECHO %DATE%               REM Data systemowa
ECHO %TIME%               REM Czas systemowy
```

### Wbudowane Zmienne Systemowe

```batch
%COMPUTERNAME%   - Nazwa komputera
%USERNAME%       - Nazwa użytkownika
%USERDOMAIN%     - Domena użytkownika
%USERPROFILE%    - Ścieżka profilu użytkownika
%HOMEPATH%       - Home directory
%TEMP%           - Katalog tymczasowy
%SYSTEMROOT%     - Katalog Windows (zwykle C:\Windows)
%WINDIR%         - Katalog Windows
%PATH%           - Ścieżki do programów
%PATHEXT%        - Rozszerzenia plików wykonywalnych
%PROCESSOR_ARCHITECTURE% - Architektura procesora (x86, x64, ARM)
%OS%             - System operacyjny
%PROCESSOR_COUNT% - Liczba procesorów
%RANDOM%         - Liczba losowa (0-32767)
%CD%             - Bieżący katalog
%DATE%           - Data (format zależy od systemu)
%TIME%           - Czas (format HH:mm:ss.ms)
%ERRORLEVEL%     - Kod błędu ostatniego polecenia
```

### Specjalne Zmienne Batch

```batch
%0               - Nazwa skryptu
%1-%9            - Argumenty 1-9
%*               - Wszystkie argumenty
```

### Opóźnione Rozwijanie Zmiennych

W Windows 2000 i nowsze, gdy włączone są rozszerzenia:

```batch
SETLOCAL ENABLEDELAYEDEXPANSION
SET var=start
IF 1==1 (
    SET var=changed
    ECHO %var%                REM Wyświetli: start (stara wartość)
    ECHO !var!                REM Wyświetli: changed (nowa wartość)
)
ENDLOCAL
```

### Operacje Arytmetyczne

```batch
SET /A result=5+3          REM 8
SET /A result=10-3         REM 7
SET /A result=3*4          REM 12
SET /A result=10/3         REM 3 (zaokrąglone)
SET /A result=10%%3        REM 1 (modulo - podwójne %)
SET /A result=(2+3)*4      REM 20 (nawiasy)
SET /A counter+=1          REM Inkrementacja
SET /A counter-=1          REM Dekrementacja
```

### Zmienne Lokalne vs Globalne

```batch
REM Bez SETLOCAL - globalne (wpływ na system)
SET GlobalVar=Value

REM Z SETLOCAL - lokalne (tylko w skrypcie)
SETLOCAL ENABLEDELAYEDEXPANSION
SET LocalVar=Value
ECHO !LocalVar!            REM Dostępne w SETLOCAL
ENDLOCAL
ECHO %LocalVar%            REM Niedostępne poza SETLOCAL
```

---

## Konstrukty Kontrolne

### IF - Instrukcja Warunkowa

#### IF String Comparison

```batch
IF "%var%"=="value" ECHO Match
IF NOT "%var%"=="value" ECHO Not match
IF /I "%var%"=="VALUE" ECHO Case-insensitive match
```

#### IF Exist - Sprawdzenie Istnienia Pliku

```batch
IF EXIST "file.txt" ECHO File exists
IF NOT EXIST "C:\folder\file.txt" ECHO File not found
IF EXIST "*.txt" ECHO Text files exist
```

#### IF ErrorLevel - Sprawdzenie Kodu Błędu

```batch
some_command
IF ERRORLEVEL 1 ECHO Command failed
IF ERRORLEVEL 0 ECHO Command succeeded
IF %ERRORLEVEL%==0 ECHO Success
```

#### Bloki IF (Windows NT+)

```batch
IF condition (
    ECHO First statement
    ECHO Second statement
) ELSE (
    ECHO Alternative
)
```

#### Zaawansowane Porównania

```batch
REM Porównanie numeryczne (z /I dla case-insensitive)
IF 5 GTR 3 ECHO 5 is greater than 3
IF 5 LSS 10 ECHO 5 is less than 10
IF 5 GEQ 5 ECHO Greater or equal
IF 5 LEQ 5 ECHO Less or equal
IF 5 EQU 5 ECHO Equal
IF 5 NEQ 10 ECHO Not equal

REM Operatory logiczne
IF condition1 (
    IF condition2 (
        ECHO Both true (AND)
    )
)

REM Alternatywa
IF condition1 (
    ECHO True
) ELSE IF condition2 (
    ECHO Also true
) ELSE (
    ECHO False
)
```

### FOR - Pętla

#### FOR /L - Pętla numeryczna

```batch
REM Od 1 do 10
FOR /L %%i IN (1,1,10) DO ECHO %%i

REM Od 10 do 1 (malejąco)
FOR /L %%i IN (10,-1,1) DO ECHO %%i

REM Co 5
FOR /L %%i IN (0,5,100) DO ECHO %%i
```

#### FOR /F - Pętla po liniach pliku

```batch
REM Po każdej linii pliku
FOR /F %%line IN (file.txt) DO ECHO %%line

REM Tokeny (pola rozdzielone)
FOR /F "tokens=1,2" %%a IN (file.txt) DO ECHO %%a %%b

REM Katalog
FOR /F %%line IN ('DIR') DO ECHO %%line

REM Po linijkach tekstu
FOR /F "delims=" %%line IN ('dir /b') DO ECHO %%line
```

#### FOR /D - Pętla po katalogach

```batch
REM Wszystkie podfoldery
FOR /D %%dir IN (*) DO ECHO %%dir

REM Rekursywnie
FOR /R C:\Windows %%dir IN (.) DO ECHO %%dir
```

#### FOR /R - Pętla rekursywna

```batch
REM Wszystkie pliki *.txt rekursywnie
FOR /R "C:\MyFolder" %%file IN (*.txt) DO ECHO %%file

REM Bieżący katalog i podkatalogi
FOR /R %%file IN (*.bat) DO ECHO %%file
```

#### FOR - Zmienne

```batch
REM Pętla po zmiennych oddzielonych spacjami
FOR %%item IN (item1 item2 item3) DO ECHO %%item

REM Pętla po wynikach polecenia
FOR /F %%line IN ('tasklist') DO ECHO %%line
```

### GOTO - Skoki Warunkowe

```batch
REM Podstawowy GOTO
GOTO label
ECHO To nie będzie wykonane
:label
ECHO To będzie wykonane

REM Z warunkiem
IF ERRORLEVEL 1 GOTO Error
ECHO Success
GOTO End
:Error
ECHO An error occurred
:End
```

### CALL - Wywoływanie Podprogramów

```batch
REM Wywołaj podprogram
CALL :subroutine arg1 arg2

REM Wykonaj inny skrypt
CALL another_script.bat

REM Argument domyślny
CALL :subroutine
GOTO :EOF

:subroutine
ECHO Argument 1: %1
ECHO Argument 2: %2
EXIT /B 0
```

---

## Parametry i Argumenty

### Parametry Batch

```batch
REM W pliku script.bat
REM Uruchomienie: script.bat param1 param2 param3

ECHO %0      REM Nazwa skryptu
ECHO %1      REM Pierwszy argument (param1)
ECHO %2      REM Drugi argument (param2)
ECHO %3      REM Trzeci argument (param3)
ECHO %*      REM Wszystkie argumenty
```

### SHIFT - Przesunięcie Argumentów

```batch
REM Parametry: a b c d e
:loop
IF "%1"=="" GOTO end
ECHO Processing: %1
SHIFT          REM Przesunięcie: a -> b -> c ...
GOTO loop
:end
```

### Pobieranie Specyficznych Argumentów

```batch
REM Wszystkie argumenty z pominięciem %0
FOR %%i IN (%*) DO ECHO %%i

REM Liczba argumentów (wymaga trick)
SET /A argcount=0
FOR %%i IN (%*) DO SET /A argcount+=1
ECHO Number of arguments: %argcount%
```

---

## Redirekcja i Potoki

### Podstawowa Redirekcja

```batch
REM Zapis do pliku (nadpisanie)
ECHO Hello > output.txt

REM Zapis do pliku (dodanie)
ECHO World >> output.txt

REM Wczytanie z pliku
SORT < input.txt

REM Wczytanie i zapis
SORT < input.txt > output.txt
```

### Redirekcja Błędów

```batch
REM Błędy do pliku (stderr tylko w cmd.exe)
command 2> error.txt

REM Błędy do pustki (wyłącz)
command 2> NUL

REM Wszystko (stdout + stderr)
command > output.txt 2>&1

REM Błędy do stdout
command 2>&1

REM Stderr do stdout i odwrotnie
command 1> output.txt 2> error.txt
```

### Potoki (Pipes)

```batch
REM Przekaż wyjście jednego do drugiego
DIR | SORT

REM Szukaj w wynikach
DIR | FIND "Documents"

REM Liczba linii
TYPE file.txt | FIND /C /V ""

REM Łańcuch poleceń
DIR | FINDSTR ".txt$" | SORT
```

### Operatory Logiczne

```batch
REM AND - wykonaj drugie tylko jeśli pierwsze się powiedzie
command1 && command2

REM OR - wykonaj drugie tylko jeśli pierwsze się nie powiedzie
command1 || command2

REM SEKWENCJA - zawsze wykonaj oba
command1 & command2
```

**Przykład:**
```batch
CD C:\Users || ECHO Directory not found
dir > output.txt && ECHO File created successfully || ECHO Error creating file
```

---

## Zaawansowane Techniki

### Subroutines - Podprogramy

```batch
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

CALL :Add 5 3
CALL :Multiply 4 7
GOTO :EOF

:Add
SET /A result=%1+%2
ECHO %1 + %2 = !result!
EXIT /B 0

:Multiply
SET /A result=%1*%2
ECHO %1 * %2 = !result!
EXIT /B 0
```

### Pobieranie Zwracanych Wartości

```batch
@ECHO OFF
CALL :GetDate mydate
ECHO Date is: %mydate%
GOTO :EOF

:GetDate
FOR /F %%i IN ('WMIC OS GET LOCALDATETIME^|FIND "20"') DO SET %1=%%i
EXIT /B 0
```

### Interaktywny Menu

```batch
@ECHO OFF
:menu
CLS
ECHO ============ MENU ============
ECHO 1 - Option 1
ECHO 2 - Option 2
ECHO 3 - Option 3
ECHO 0 - Exit
ECHO ==============================
CHOICE /C 0123 /M "Select option: "

IF ERRORLEVEL 4 GOTO op3
IF ERRORLEVEL 3 GOTO op2
IF ERRORLEVEL 2 GOTO op1
IF ERRORLEVEL 1 GOTO exit

:op1
ECHO Option 1 selected
PAUSE
GOTO menu

:op2
ECHO Option 2 selected
PAUSE
GOTO menu

:op3
ECHO Option 3 selected
PAUSE
GOTO menu

:exit
ECHO Goodbye!
```

### Obsługa Błędów

```batch
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

some_command
IF !ERRORLEVEL! NEQ 0 (
    ECHO Error code: !ERRORLEVEL!
    REM Obsługa błędu
    EXIT /B !ERRORLEVEL!
)

ECHO Success!
EXIT /B 0
```

### Prace w Tle - START

```batch
REM Otwórz nowe okno i wykonaj
START "" cmd /c script.bat

REM Bez czekania na zakończenie
START /B application.exe

REM Z priorytetem
START /HIGH application.exe
START /LOW application.exe

REM W określonym katalogu
START /D "C:\Users" cmd
```

### Zaplanowane Zadania - SCHTASKS

```batch
REM Lista zadań
SCHTASKS /QUERY

REM Utwórz zadanie (co godzinę)
SCHTASKS /CREATE /TN "MyTask" /TR "C:\script.bat" /SC HOURLY

REM Kasutaj zadanie
SCHTASKS /DELETE /TN "MyTask" /F

REM Uruchom zadanie
SCHTASKS /RUN /TN "MyTask"
```

### Oczekiwanie na Proces

```batch
REM Czekaj aż program się zakończy
START /WAIT program.exe
ECHO Program finished

REM TASKLIST - czy proces istnieje
TASKLIST | FIND /I "notepad.exe"
IF ERRORLEVEL 1 ECHO Notepad is not running
```

### Pobieranie Informacji Systemowej

```batch
REM Informacje systemowe
SYSTEMINFO

REM Wersja Windows
VER

REM Nazwa komputera
ECHO %COMPUTERNAME%

REM Użytkownik
ECHO %USERNAME%

REM Data i czas
ECHO %DATE% %TIME%

REM IP Address
IPCONFIG

REM Lista procesów
TASKLIST

REM Informacje o dysku
WMIC LOGICALDISK GET name,size,freespace
```

---

## Bezpieczeństwo i Ograniczenia

### Problemy ze Zmiennymi Pustymi

```batch
REM ❌ PROBLEM: Jeśli %var% jest puste
IF %var%==value ECHO Match
REM Wynik: IF ==value ECHO Match (BŁĄD SKŁADNI)

REM ✓ ROZWIĄZANIE: Otocz cudzysłowami
IF "%var%"=="value" ECHO Match
REM Wynik: IF ""=="value" ECHO Match (OK)
```

### Escape'owanie Znaków Specjalnych

```batch
REM Znaki specjalne wymagające escape'owania:
REM & | < > ( ) [ ] { } ^ = ; ! ' + , ` ~ (spacja)

REM Przy użyciu ^
ECHO Pipe: ^|
ECHO Less: ^<
ECHO Greater: ^>

REM W cytatach
ECHO "Text with | pipe"
ECHO "Text with & ampersand"

REM Dla ! (przy delayed expansion)
SETLOCAL ENABLEDELAYEDEXPANSION
SET var=!value!
```

### Problem z UNC Path

```batch
REM ❌ Nie można zmienić na UNC path bezpośrednio
CD \\server\share  REM BŁĄD

REM ✓ Rozwiązanie z PUSHD
PUSHD \\server\share
REM Automatycznie tworzy tymczasową literę dysku
POPD
REM Automatycznie usuwa przypisaną literę
```

### Usuń i Zastaw CR/LF

```batch
REM Normalnie, każdy ECHO dodaje CR/LF
REM Aby usunąć:
SET /P ="Text" < NUL

REM Aplikacja:
SET /P ="Line 1" < NUL > file.txt
SET /P ="Line 2" < NUL >> file.txt
REM Wynik: Line 1Line 2 (bez znaku nowej linii)
```

### Character Set i Unicode

Batch files używają **OEM character set** (np. Code Page 437).

```batch
REM Aby używać Unicode:
cmd /U /C script.bat

REM Zapisanie wyniku z UTF-16
cmd /U /C dir > files.txt

REM Zmiana code page
CHCP 65001    REM UTF-8
CHCP 1252     REM Windows Latin
```

### Bezpieczeństwo - Batch Viruses

⚠️ **OSTRZEŻENIE:** Batch scripts mogą być niebezpieczne!

```batch
REM ❌ NIEBEZPIECZNE KODY - NIE WYKONUJ

REM 1. Usunięcie wszystkich danych (bez potwierdzenia!)
DEL /Q *.*

REM 2. Fork bomb - zapaść systemu
:TOP
START "" %0
GOTO TOP

REM 3. Modyfikacja HOSTS file (DNS poisoning)
ECHO 127.0.0.1 google.com >> C:\Windows\System32\drivers\etc\hosts

REM 4. Rozprzestrzenianie się przez USB (Autorun)
COPY %0 X:\autorun.bat
```

**Jak się chronić:**
- Nie uruchamiaj skryptów z nieznanych źródeł
- Zawsze przejrzyj zawartość przed wykonaniem
- Używaj antywirusa
- Wyłącz Autorun na urządzeniach USB
- Rozważ Windows Defender/Windows Security
- Niezbędne uprawnienia tylko

---

## Przykłady Praktyczne

### 1. Kopia Zapasowa Plików

```batch
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM Kopia zapasowa z datą
FOR /F "TOKENS=2-4 DELIMS=/ " %%a IN ('DATE /T') DO SET mydate=%%c%%a%%b
FOR /F "TOKENS=1-2 DELIMS=/:" %%a IN ('TIME /T') DO SET mytime=%%a%%b

SET backupdir=C:\Backup\!mydate!_!mytime!

IF NOT EXIST "!backupdir!" MKDIR "!backupdir!"

REM Kopiuj wszystkie pliki txt z bieżącego katalogu
XCOPY "*.txt" "!backupdir!\" /Y /I

ECHO Backup completed to: !backupdir!
PAUSE
```

### 2. Monitorowanie Procesu

```batch
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

SET processname=notepad.exe
SET checkinterval=5

:monitor
CLS
ECHO Monitoring %processname%
ECHO Time: %DATE% %TIME%
ECHO.

TASKLIST | FIND /I "%processname%"
IF ERRORLEVEL 1 (
    ECHO Process NOT FOUND!
) ELSE (
    ECHO Process is running
)

TIMEOUT /T %checkinterval% /NOBREAK
GOTO monitor
```

### 3. Czyszczenie Tymczasowych Plików

```batch
@ECHO OFF
SETLOCAL

ECHO Cleaning temporary files...

REM Czyszczenie Windows Temp
DEL /S /Q "%TEMP%\*.*" 2>NUL
REM Czyszczenie User Temp
DEL /S /Q "%USERPROFILE%\AppData\Local\Temp\*.*" 2>NUL

REM Internet Explorer cache
DEL /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*" 2>NUL

REM Recent files
DEL /Q "%USERPROFILE%\AppData\Recent\*.*" 2>NUL

ECHO Cleanup completed!
PAUSE
```

### 4. Logowanie do Pliku

```batch
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

SET logfile=log.txt
SET timestamp=%DATE% %TIME%

:log_message
REM Ustawienie zmiennej logmessage przed uruchomieniem tego sekcji
IF "%1"=="" (
    ECHO Logging function - pass message as %%1
    GOTO :EOF
)

SET message=%1
ECHO [!timestamp!] !message! >> !logfile!
EXIT /B 0
```

**Użycie:**
```batch
CALL script.bat "Starting application"
CALL script.bat "Error occurred"
CALL script.bat "Process completed"
```

### 5. Wyszukiwanie i Zastępowanie

```batch
@ECHO OFF

REM Prosty find & replace z FIND/FINDSTR
SETLOCAL

SET inputfile=input.txt
SET outputfile=output.txt
SET findtext=OldText
SET replacetext=NewText

REM Zastępowanie liniowe
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "TOKENS=*" %%i IN (%inputfile%) DO (
    SET line=%%i
    SET line=!line:%findtext%=%replacetext%!
    ECHO !line! >> %outputfile%
)
ENDLOCAL

ECHO Replacement completed!
```

### 6. Instalacja i Konfiguracja Oprogramowania

```batch
@ECHO OFF
SETLOCAL

REM Sprawdzenie uprawnień administratora
NET SESSION >nul 2>&1
IF ERRORLEVEL 1 (
    ECHO Error: Administrator rights required!
    PAUSE
    EXIT /B 1
)

REM Instalacja programu
ECHO Installing application...
START /WAIT "MyApp Installer.exe"

REM Konfiguracja
ECHO Configuring...
REG ADD "HKEY_LOCAL_MACHINE\Software\MyApp" /V Setting1 /D Value1 /F

REM Uruchomienie
START "" "C:\Program Files\MyApp\myapp.exe"

ECHO Installation completed!
```

### 7. Obieg Biuro - Skrypty DPO

```batch
@ECHO OFF
SETLOCAL

REM System-wide batch automation
REM Sprawdz czy system wymaga aktualizacji
ECHO Checking for Windows Updates...
WUAUCLT /DetectNow

REM Uruchom Windows Defender full scan
ECHO Running Windows Defender scan...
REM "%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2

REM Defragmentacja dysku
ECHO Defragmenting drive...
REM defrag C: /U /V

REM Clear temporary files
CALL :cleantemp

GOTO :EOF

:cleantemp
ECHO Cleaning temporary files...
DEL /S /Q "%TEMP%\*.*" 2>NUL
EXIT /B 0
```

---

## Dodatki i Przydatne Zasoby

### Najczęstsze Błędy

| Błąd | Przyczyna | Rozwiązanie |
|------|-----------|------------|
| `'...' is not recognized as internal or external command` | Polecenie nie znalezione lub błędna ścieżka | Sprawdź PATH, podaj pełną ścieżkę |
| `The system cannot find the path specified` | Katalog nie istnieje | Sprawdź ścieżkę, użyj cudzysłowów dla spacji |
| `Access Denied` | Brak uprawnień | Uruchom jako administrator |
| `Syntax error` | Błąd w składni | Sprawdzselect nawias, znaki specjalne |
| `IF ==value` | Pusta zmienna w warunku | Otocz % zmienną cudzysłowami |

### Przydatne Polecenia Dodatkowe

```batch
TASKLIST          - Lista uruchomionych procesów
TASKKILL          - Zamknij proces
SCHTASKS          - Zaplanowane zadania
WMIC              - Windows Management Instrumentation Command-line
POWERSHELL        - PowerShell interpreter
NETSH             - Network shell
IPCONFIG          - Konfiguracja sieci
PING              - Test połączenia
NET               - Sieci commands
ROBOCOPY          - Zaawansowana kopia rekursywna
XCOPY             - Zaawansowana kopia plików
SUBST             - Mapowanie ścieżki na literę dysku
TREE              - Struktura katalogów
WMIC PROCESS      - Zarządzanie procesami
WMIC SERVICE      - Zarządzanie usługami
```

### Porady Optymalizacji

1. **Wyłącz ECHO dla szybkości**
   ```batch
   @ECHO OFF
   ```

2. **Używaj SETLOCAL dla zmiennych lokalnych**
   ```batch
   SETLOCAL ENABLEDELAYEDEXPANSION
   ```

3. **Minimalizuj wzywania zewnętrznych poleceń**
   ```batch
   REM Wolne: 1000 iteracji x DIR
   REM Szybkie: Jedna sekcja PUSHD, iteracje bez DIR
   ```

4. **Buforuj dane wyjściowe**
   ```batch
   REM Zamiast wielu >>
   (
       ECHO line1
       ECHO line2
       ECHO line3
   ) >> file.txt
   ```

---

## Bibliografia i Źródła

1. **Microsoft Learn** (learn.microsoft.com)
   - Windows Commands Reference
   - cmd documentation
   - Batch file scripting guides

2. **Wikipedia** (en.wikipedia.org)
   - Batch file article
   - DOS history
   - Windows history

3. **Polsoft.its**
   - Kolekcja skryptów Batch
   - Praktyczne przykłady
   - Narzędzia systemowe

4. **TechNet Archive**
   - Zaawansowane batch scripting
   - Administracja systemem

---

## Licencja i Użytkowanie

Ta dokumentacja jest dostarczana w celach edukacyjnych. Skrypty zawarte mogą być modyfikowane i rozpowszechniane w ramach użytku osobistego lub komercyjnego, z wyłączeniem treści złośliwych.

**Ostatnia aktualizacja:** Styczeń 2026

**Autor:** polsoft.its Batch Script Collection Documentation

---

## Podsumowanie

Batch scripts, mimo swojej prostoty w porównaniu do nowoczesnych języków programowania, pozostają potężnym narzędziem do:

- ✅ Automatyzacji zadań systemowych
- ✅ Administracji Windows
- ✅ Tworzenia prostych aplikacji konsolowych
- ✅ Zarządzania zasobami systemu
- ✅ Integracji z innymi narzędziami Windows

Wiedza o Batch scripting jest niezbędna dla każdego administratora systemu Windows, DevOps czy zaawansowanego użytkownika.

**Pamiętaj:**
- Zawsze testuj skrypty w bezpiecznym środowisku
- Zachowaj kopie oryginałów plików przed uruchomieniem obracających je skryptów
- Monitoruj logi błędów
- Dokumentuj kod dla przyszłych odniesień

---

**Koniec Poradnika**
