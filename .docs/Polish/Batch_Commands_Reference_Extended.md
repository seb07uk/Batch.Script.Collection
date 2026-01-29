# 📚 Rozszerzone Odniesienie Poleceń Batch

**Dokument integrujący informacje z notatek **

---

## 🎯 Wprowadzenie

Batch Script to narzędzie do automatyzacji poleceń, które są powtarzalne z natury. Skrypty batch pozwalają na:

✅ Odczytywanie danych wejściowych od użytkowników  
✅ Struktury kontrolne (for, if, while, switch)  
✅ Zaawansowane funkcje i tablice  
✅ Regularne wyrażenia  
✅ Integrację z innymi językami programowania (np. Perl)  

### Typowe Zastosowania

1. **Konfiguracja serwerów** - Różne cele i zadania
2. **Automatyzacja housekeeping** - Usuwanie niepotrzebnych plików i logów
3. **Deployment aplikacji** - Z jednego środowiska na inne
4. **Instalacja zbiorowa** - Programy na wiele maszyn jednocześnie

---

## 📋 Polecenia Podstawowe (S.No 1-33)

| Nr | Polecenie | Opis | Przykład |
|----|-----------|------|---------|
| 1 | VER | Wersja MS-DOS | `VER` |
| 2 | ASSOC | Łączy rozszerzenie z typem pliku | `ASSOC .txt=textfile` |
| 3 | CD | Zmienia/wyświetla katalog | `CD C:\Users` |
| 4 | CLS | Czyści ekran | `CLS` |
| 5 | COPY | Kopiuje pliki | `COPY source.txt dest.txt` |
| 6 | DEL | Usuwa pliki | `DEL file.txt` |
| 7 | DIR | Wyświetla zawartość | `DIR C:\Users /S` |
| 8 | DATE | Data systemowa | `DATE /T` |
| 9 | ECHO | Wyświetla tekst/kontrola | `ECHO Hello World` |
| 10 | EXIT | Zamyka konsolę | `EXIT /B 0` |
| 11 | MD | Tworzy katalog | `MD newfolder` |
| 12 | MOVE | Przenosi pliki | `MOVE old.txt new.txt` |
| 13 | PATH | Zmienną path | `PATH` |
| 14 | PAUSE | Czeka na klawisz | `PAUSE` |
| 15 | PROMPT | Zmienia prompt | `PROMPT $P$G` |
| 16 | RD | Usuwa katalog | `RD /S /Q folder` |
| 17 | REN | Zmienia nazwę | `REN old.txt new.txt` |
| 18 | REM | Uwagi/komentarze | `REM To jest komentarz` |
| 19 | START | Uruchamia program | `START notepad.exe` |
| 20 | TIME | Godzina systemowa | `TIME /T` |
| 21 | TYPE | Wyświetla zawartość | `TYPE file.txt` |
| 22 | VOL | Etykieta woluminu | `VOL C:` |
| 23 | ATTRIB | Atrybuty pliku | `ATTRIB +R file.txt` |
| 24 | CHKDSK | Sprawdza dysk | `CHKDSK C: /F` |
| 25 | CHOICE | Lista opcji | `CHOICE /C YN` |
| 26 | CMD | Nowa instancja | `CMD /C "command"` |
| 27 | COMP | Porównuje pliki | `COMP file1.txt file2.txt` |
| 28 | CONVERT | Konwertuje system | `CONVERT C: /FS:NTFS` |
| 29 | DRIVERQUERY | Sterowniki | `DRIVERQUERY /V` |
| 30 | EXPAND | Rozpakuj .cab | `EXPAND archive.cab -F:* dest\` |
| 31 | FIND | Szuka tekstu | `FIND "error" file.txt` |
| 32 | FORMAT | Formatuje dysk | `FORMAT D: /FS:NTFS` |
| 33 | HELP | Pomoc poleceń | `HELP COPY` |

---

## 🌐 Polecenia Sieciowe (NET)

Polecenie NET jest używane do aktualizacji, naprawy lub wyświetlania ustawień sieciowych.

### Dostępne Opcje NET

```batch
:: NET ACCOUNTS - Wyświetl ograniczenia
NET ACCOUNTS

:: NET CONFIG - Ustawienia serwera/workgroup
NET CONFIG SERVER

:: NET COMPUTER - Zarządzanie komputerami
NET COMPUTER \\COMPUTERNAME /ADD
NET COMPUTER \\COMPUTERNAME /DEL

:: NET USER - Zarządzanie użytkownikami
NET USER username
NET USER username password /ADD
NET USER username /DELETE

:: NET STOP/START - Usługi
NET STOP "Service Name"
NET START "Service Name"

:: NET STATISTICS - Statystyki sieci
NET STATISTICS SERVER
NET STATISTICS WORKSTATION

:: NET USE - Zasoby sieciowe
NET USE Z: \\server\share password /user:domain\username
NET USE * /DELETE /Y  :: Rozłączaj wszystko
```

### Praktyczne Przykłady Sieciowe

```batch
@echo off
:: Wyświetl informacje o sieci
ECHO === Network Information ===
NET ACCOUNTS
NET CONFIG SERVER
ECHO.

:: Wyświetl podłączone zasoby
ECHO === Connected Resources ===
NET USE

:: Wyświetl statystyki
ECHO === Network Statistics ===
NET STATISTICS SERVER
PAUSE
```

---

## 🖨️ Drukowanie z Batch (PRINT & PRINTUI)

### Polecenie PRINT

```batch
:: Składnia
PRINT [/D:device] [[drive:][path]filename[...]]

:: Przykład - Druk na porcie LPT1
PRINT c:\example.txt /D:lpt1

:: Druk na drukarce sieciowej
PRINT c:\document.txt /D:\\printserver\printername
```

### RUNDLL32 PRINTUI - Zaawansowana Kontrola

PRINTUI.DLL oferuje zaawansowaną kontrolę drukowania przez wiersz poleceń.

```batch
:: Składnia
RUNDLL32.EXE PRINTUI.DLL,PrintUIEntry [options] [@commandfile]

:: Najczęstsze opcje:
/dl    - Usuń drukarkę lokalną
/dn    - Usuń połączenie sieciowe
/dd    - Usuń sterownik drukarki
/e     - Pokaż preferencje
/f[file] - Plik INF lub plik wyjściowy
/ia    - Zainstaluj sterownik z INF
/id    - Zainstaluj sterownik z kreatora
/if    - Zainstaluj drukarkę z INF
/ii    - Zainstaluj drukarkę z kreatora (INF)
/il    - Zainstaluj drukarkę z kreatora
/in    - Dodaj drukarkę sieciową
/ip    - Zainstaluj drukarkę sieciową
/k     - Drukuj stronę testową
/l[path] - Ścieżka do sterownika
/m[model] - Model sterownika
/n[name] - Nazwa drukarki
/o     - Wyświetl kolejkę drukowania
/p     - Właściwości drukarki
/Ss    - Zapisz ustawienia do pliku
/Sr    - Przywróć ustawienia z pliku
/y     - Ustaw jako domyślną
/Xg    - Pobierz ustawienia drukarki
/Xs    - Ustaw ustawienia drukarki
```

### Sprawdzanie czy Drukarka Istnieje

```batch
@echo off
SETLOCAL

SET PrinterName=Test Printer
SET file=%TEMP%\Prt.txt

:: Sprawdź czy drukarka istnieje
RUNDLL32.EXE PRINTUI.DLL,PrintUIEntry /Xg /n "%PrinterName%" /f "%file%" /q

IF EXIST "%file%" (
    ECHO [OK] Drukarka "%PrinterName%" istnieje
    DEL "%file%"
) ELSE (
    ECHO [ERROR] Drukarka "%PrinterName%" NIE istnieje
)

ENDLOCAL
```

---

## 📝 ECHO - Polecenie Najpopularniejsze

### Wyłączanie Echo Poleceń

```batch
@echo off
:: @ przed poleceniem = echo off dotyczy samego @echo off
:: Bez @ widniejemy to polecenie na ekranie
```

### Dokumentacja i Komentarze

Zawsze dodawaj komentarze do skryptów:

```batch
:: Komentarz używając ::
REM Komentarz używając REM

:: Popularna praktyka - linie separacyjne
::===============================================================
:: Nazwa skryptu: Moje Narzędzie
:: Autor: Jan Kowalski
:: Data: Styczeń 2026
::===============================================================
```

### Praktyczny Przykład ECHO

```batch
@echo off
SETLOCAL

REM Listing plików w Program Files
ECHO Listowanie zawartości Program Files...
dir "C:\Program Files" > C:\lists.txt
echo Plik: C:\lists.txt

ECHO Operacja zakończona pomyślnie
PAUSE
```

---

## 🐛 Debugowanie Skryptów Batch

Debugowanie staje się ważne w dużych, złożonych skryptach batch.

### 1. Używanie ECHO do Debugowania

```batch
@echo off
REM Prosty debuger - wyświetl komunikaty gdzie mogą być błędy

IF [%1] == [] (
    ECHO [ERROR] Wartość wejściowa nie podana
    GOTO stop
)

REM Wyświetl liczby parzyste
FOR /L %%n IN (2,2,%1) DO (
    ECHO [DEBUG] Aktualnie przetwarzam: %%n
    ECHO %%n
)

:stop
PAUSE
```

### 2. Używanie PAUSE do Zatrzymania

```batch
@echo off

IF [%1] == [] (
    ECHO [ERROR] Wartość nie podana
    GOTO stop
) ELSE (
    ECHO [OK] Wartość prawidłowa: %1
)

:stop
PAUSE
```

### 3. Logowanie do Pliku (Rekomendowane)

```batch
@echo off
SETLOCAL

REM Zamiast patrzeć na cały ECHO, loguj do pliku
REM Trudno jest debugować opierając się na zwykłym echo

net statistics /Server 2> C:\testerrors.txt

:: Sprawdź zawartość pliku błędów
IF EXIST C:\testerrors.txt (
    ECHO === BŁĘDY ===
    TYPE C:\testerrors.txt
)

ENDLOCAL
```

### 4. Logowanie ze Zmienną ERRORLEVEL

```batch
@echo off
SETLOCAL

REM ERRORLEVEL zwraca 0 jeśli sukces, 1 jeśli błąd

PING google.com
IF ERRORLEVEL 1 GOTO stop

ECHO Połączenie udane
GOTO end

:stop
   ECHO [ERROR] Nie można połączyć się z google.com

:end
ENDLOCAL
PAUSE
```

### 5. Zaawansowana Strategia Logowania

```batch
@echo off
SETLOCAL

SET LOGFILE=C:\logs\application_%DATE:~-4%-%DATE:~-10,2%-%DATE:~-7,2%.log
SET ERRORLOG=C:\logs\errors_%DATE:~-4%-%DATE:~-10,2%-%DATE:~-7,2%.log

REM Wszystkie operacje są logowane
(
    ECHO [%DATE% %TIME%] ===== Script Start =====
    
    REM Tutaj twoje polecenia
    ECHO [%DATE% %TIME%] Przetwarzanie pliku
    
    ECHO [%DATE% %TIME%] ===== Script End =====
) > "%LOGFILE%"

REM Jeśli błędy, zapisz je osobno
IF ERRORLEVEL 1 (
    ECHO [%DATE% %TIME%] ERROR: Operacja nie powiodła się >> "%ERRORLOG%"
)

ECHO Log zapisany: %LOGFILE%
ENDLOCAL
PAUSE
```

---

## ✏️ Dokumentacja Skryptów - Najlepsze Praktyki

### Dlaczego Dokumentacja Jest Ważna?

Poniżej kod bez komentarzy - trudny do zrozumienia:

```batch
ECHO OFF
IF NOT "%OS%"=="Windows_NT" GOTO Syntax
ECHO.%* | FIND "?" >NUL
IF NOT ERRORLEVEL 1 GOTO Syntax
IF NOT [%2]==[] GOTO Syntax
SETLOCAL
SET WSS=
IF NOT [%1]==[] FOR /F "tokens = 1 delims = \ " %%A IN ('ECHO.%~1') 
DO SET WSS = %%A
FOR /F "tokens = 1 delims = \ " %%a IN ('NET VIEW ^| FIND /I "\\%WSS%"') 
DO FOR /F "tokens = 1 delims = " %%A IN ('NBTSTAT -a %%a ^| 
FIND /I /V "%%a" ^| FIND "<03>"') DO ECHO.%%a %%A
ENDLOCAL
GOTO:EOF
ECHO Display logged on users and their workstations.
ECHO Usage: ACTUSR [ filter ]
IF "%OS%"=="Windows_NT" ECHO Where: filter is the first part of the computer name(s)
```

### Kod z Dobrą Dokumentacją

```batch
::===============================================================
:: ACTUSR.BAT - Wyświetl zalogowanych użytkowników na komputerach
:: 
:: Funkcja: Wyświetla zalogowanych użytkowników i ich stacje robocze
:: Użycie: ACTUSR [ filter ]
:: Gdzie: filter = początkowa część nazwy komputera(ów)
::===============================================================
ECHO OFF

:: Windows NT check - czy system wspiera wymagane polecenia?
IF NOT "%OS%"=="Windows_NT" GOTO Syntax

:: Sprawdzenie parametru pomocy
ECHO.%* | FIND "?" >NUL
IF NOT ERRORLEVEL 1 GOTO Syntax

:: Sprawdzenie liczby parametrów - max 1
IF NOT [%2]==[] GOTO Syntax

:: Utrzymuj zmienne lokalne
SETLOCAL

:: Inicjalizuj zmienną dla nazwy workstation search string
SET WSS=

:: Przetwórz parametr filtra
IF NOT [%1]==[] FOR /F "tokens = 1 delims = \ " %%A IN ('ECHO.%~1') DO SET WSS = %%A

:: Używaj NET VIEW i NBTSTAT do znalezienia komputerów i zalogowanych użytkowników
FOR /F "tokens = 1 delims = \ " %%a IN ('NET VIEW ^| FIND /I "\\%WSS%"') DO 
FOR /F "tokens = 1 delims = " %%A IN ('NBTSTAT -a %%a ^| FIND /I /V "%%a" ^| FIND "<03>"') 
DO ECHO.%%a %%A

:: Zakończ
ENDLOCAL
GOTO:EOF

:Syntax
ECHO Display logged on users and their workstations.
ECHO Usage: ACTUSR [ filter ]
IF "%OS%"=="Windows_NT" ECHO Where: filter is the first part of the computer name(s) to be displayed
```

### Dwie Metody Komentarzy

**Metoda 1: REM Statement**

```batch
@echo off
REM To jest komentarz przy użyciu REM
set message=Hello World
echo %message%

REM Wszystko po REM jest ignorowane
REM Może być używane dla wieloliniowych wyjaśnień
```

**Metoda 2: :: Statement (Rekomendowana)**

```batch
@echo off
:: To jest komentarz przy użyciu ::
set message=Hello World
echo %message%

:: Szybsza i bardziej czytelna
:: Bardziej powszechnie używana w nowoczesnych skryptach

:: UWAGA: Zbyt wiele linii REM może spowolnić kod
:: ponieważ każda linia musi być wykonana
:: :: jest szybsze i preferowane
```

---

## 🌍 Środowisko Execution

### Tworzenie Pliku Batch

1. **Otwórz Notatnik** (Notepad)
2. **Wpisz polecenia**
3. **Zapisz** z rozszerzeniem `.bat` lub `.cmd`

### Różne Sposoby Uruchamiania cmd.exe

**Metoda 1: Przejść do System32**
```
C:\Windows\System32\cmd.exe
```

**Metoda 2: Przez Run Command**
```
Windows + R
Wpisz: cmd
```

**Metoda 3: Z paska wyszukiwania**
```
Wpisz "cmd" w wyszukiwaniu Windows
```

### Ustawianie Zmiennych PATH

Aby uruchomić batch z dowolnego miejsca:

```batch
:: Dodaj to do PATH
:: Windows: Append ; C:\Application\bin do PATH

setx PATH "%PATH%;C:\Application\bin"
```

---

## 🔒 Bezpieczeństwo: Binary Hijacking

### Poważne Zagrożenie

Polecenie Windows `CreateProcess` z plikami `.cmd` lub `.bat`:
- Automatycznie używa cmd.exe do uruchomienia
- **Podatne na atak binary hijacking** (MS14-019)

### Scenariusz Ataku

1. Aplikacja uruchamia `.cmd` lub `.bat` z WebDAV/SMB
2. Atakujący umieszcza złośliwy `cmd.exe` w bieżącym katalogu
3. Aplikacja wykonuje złośliwą kopię zamiast systemowej

### Ochrona

```batch
:: ❌ NIEBEZPIECZNE - może zostać przechwycone
CreateProcess(NULL, "C:\\malware\\script.bat", ...)

:: ✅ BEZPIECZNE - zawsze system cmd.exe
CreateProcess(NULL, "C:\\Windows\\System32\\cmd.exe /c script.bat", ...)

:: ✅ BEZPIECZNE - pełna ścieżka
"C:\\Windows\\System32\\cmd.exe /c C:\\AppPath\\script.bat"
```

---

## 📊 Podsumowanie

| Temat | Liczba Poleceń | Obsługiwane |
|-------|---|---|
| Polecenia Podstawowe | 33 | ✅ Wszystkie |
| Polecenia Sieciowe (NET) | 7 | ✅ Wszystkie |
| Drukowanie | 2 | ✅ PRINT, PRINTUI |
| Debugowanie | 4+ | ✅ ECHO, PAUSE, ERRORLEVEL |
| Dokumentacja | 2 | ✅ ::, REM |

---

**Ostatnia aktualizacja:** Styczeń 2026  
**Źródła:** Notatki z .docs, Microsoft Learn, polsoft.its  
**Status:** Kompletne

