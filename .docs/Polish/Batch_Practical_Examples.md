# Praktyczne Przykłady - Batch Scripts z Kolekcji

Dokumentacja praktycznych skryptów znajdujących się w kolekcji `Batch.Script.Collection`

---

## Spis Treści

1. [ASCII Art](#ascii-art)
2. [Calculator](#calculator)
3. [Clear Functions](#clear-functions)
4. [CLI Menu](#cli-menu)
5. [Clock/Time Scripts](#clocktime-scripts)
6. [Diagnostics](#diagnostics)
7. [Drivers & ADB](#drivers--adb)
8. [File Manager](#file-manager)
9. [Games](#games)
10. [Install & Update](#install--update)
11. [Notepad](#notepad)
12. [Registry Editor](#registry-editor)
13. [USB Write Protection](#usb-write-protection)

---

## ASCII Art

### Matrix.cmd / Matrix.bat
Symuluje efekt "deszczowy kod" z filmu Matrix w Command Prompt.

**Jak działa:**
```batch
- Generuje losowe znaki
- Wyświetla je w losowych pozycjach
- Tworzy efekt padającego tekstu
```

**Modyfikacja:**
```batch
REM Zmień znaki na swoje
SET "chars=0123456789"  REM Zmień na inne znaki

REM Zmień kolor
COLOR 02                 REM Zielony na czarnym
```

### Parrot.bat
Wyświetla ASCII art papugi.

**Funkcja:**
- Edukacyjny skrypt demonstracyjny
- Pokazuje możliwości ECHO
- Ilustruje strukturę skryptu

### Windows Logo.bat
Rysuje logo Windows w tekstowym formie.

---

## Calculator

### Calculator CMD / Calculator Basic
Kalkulator opierający się na komendzie `SET /A`

**Operacje wspierane:**
```batch
+ (dodawanie)
- (odejmowanie)
* (mnożenie)
/ (dzielenie)
% (modulo)
```

**Algorytm:**
```batch
SET /A result=5+3
ECHO Result: %result%
```

**Ograniczenia:**
- Tylko liczby całkowite
- Maksymalny zakres: -2147483648 do 2147483647
- Brak funkcji matematycznych (sin, cos, sqrt)

### CLI Calculator Pro v1.5
Zaawansowany kalkulator z interfejsem menu.

**Funkcje:**
- Menu interaktywne
- Historia obliczeń
- Walidacja danych
- Obsługa błędów

**Struktura:**
```batch
:menu
ECHO Select operation: 1=Add 2=Subtract 3=Multiply 4=Divide
SET /P operation="Operation: "

SELECT operation:
    1: Dodawanie
    2: Odejmowanie
    3: Mnożenie
    4: Dzielenie
```

---

## Clear Functions

### Clear Cookies.bat
Usuwa pliki cookies z przeglądarek.

**Czyszczone lokalizacje:**
```
- Internet Explorer: %APPDATA%\Microsoft\Windows\Cookies
- Firefox: %APPDATA%\Mozilla\Firefox\Profiles
- Chrome: %LOCALAPPDATA%\Google\Chrome\User Data\Default\Cookies
```

**Kod:**
```batch
DEL /S /Q "%APPDATA%\Microsoft\Windows\Cookies\*.*"
DEL /S /Q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cookies"
```

### Clear Temporary Internet Files.bat
Usuwa cache przeglądarek.

**Lokalizacje:**
```
- IE: %APPDATA%\Microsoft\Windows\Temporary Internet Files
- Edge: %LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache
```

### Clear Pending Windows Updates.bat
Czyści plik windows update cache jeśli jest zablokowany.

**Procedura:**
1. Stop WU Service
2. Delete temporary files
3. Start WU Service

```batch
NET STOP wuauserv
DEL /S /Q "%WINDIR%\SoftwareDistribution\Download\*.*"
NET START wuauserv
```

### Clear Windows Defender History.cmd
Usuwa historię skanów Windows Defender.

**Ścieżki:**
```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Scan
%ProgramData%\Microsoft\Windows Defender\Scans
```

### Empty Bin.cmd
Opróżnia Kosz systemowy.

**Metoda 1 - PowerShell:**
```batch
POWERSHELL -Command "Clear-RecycleBin -Force"
```

**Metoda 2 - Rejestr:**
```batch
REG DELETE "HKEY_LOCAL_MACHINE\EMPTYING RECYCLE BIN
```

**Metoda 3 - cmd.exe (starsze Windows):**
```batch
CLEANMGR
```

---

## CLI Menu

### Simple CMD Menu
Podstawowe menu wyboru w wierszu poleceń.

**Struktura:**
```batch
:menu
CLS
ECHO ==== MENU ====
ECHO 1. Option 1
ECHO 2. Option 2
ECHO 3. Exit
CHOICE /C 123 /M "Select: "

IF ERRORLEVEL 3 GOTO end
IF ERRORLEVEL 2 GOTO op2
IF ERRORLEVEL 1 GOTO op1
```

### Multiline Menu
Menu wieloliniowe z bardziej skomplikowaną strukturą.

**Cechy:**
- Pełny opis opcji
- Wejście użytkownika
- Pętla powrotna

### Hybrid Batch + PowerShell Script
Skrypt działający zarówno w Batch jak i PowerShell.

**Hybrydowa struktura:**
```batch
@ECHO OFF
REM To jest sekcja Batch
ECHO Batch executing

POWERSHELL -Command ^
    "Write-Host 'PowerShell executing'"

EXIT /B 0

<#
PowerShell:
 Tę sekcję może wykonać tylko PowerShell
#>
```

---

## Clock/Time Scripts

### Clock-Origin.bat / Clock.bat
Wyświetla zegar cyfrowy w Command Prompt.

**Algorytm:**
```batch
:loop
CLS
FOR /F "tokens=1-2 delims=/:" %%A IN ('TIME /T') DO (
    ECHO %%A:%%B
)
TIMEOUT /T 1 /NOBREAK
GOTO loop
```

### Clock-Sec-Origin.bat
Zegar z wyświetlaniem sekund.

**Format:**
```
HH:MM:SS
```

### Clock-Sec-OriginGhost / Hacker Style
Zegar z efektami wizualnymi.

**Efekty:**
- Przezroczysty efekt (ghost)
- Styl hakerski
- Kolory

```batch
COLOR 0A          REM Zielony tekst
FOR /F "tokens=*" %%i IN ('TIME /T') DO ECHO %%i
```

---

## Diagnostics

### HARD-iNfO.cmd
Wyświetla informacje o sprzęcie.

**Informacje:**
```batch
WMIC COMPUTERSYSTEM GET manufacturer,model
WMIC CPU GET name,maxclockspeed
WMIC BASEBOARD GET product,manufacturer
SYSTEMINFO
```

### RAM-iNfO.bat
Informacje o pamięci RAM.

```batch
WMIC MEMORYCHIP GET capacity
SYSTEMINFO | FIND "Total Physical Memory"
```

### System-iNfO.bat
Ogólne informacje systemowe.

```batch
SYSTEMINFO           REM Pełne informacje
VER                 REM Wersja Windows
WMIC OS GET *       REM OS info
```

---

## Drivers & ADB

### Latest ADB Installer
Instalator Android Debug Bridge.

**ADB - Android Debug Bridge:**
- Narzędzie do komunikacji z urządzeniami Android
- Potrzebne dla programistów Android
- Umożliwia debugowanie, transfer plików, uruchamianie aplikacji

**Proces instalacji:**
```batch
ECHO Downloading ADB...
REM Pobierz plik

ECHO Installing ADB...
REM Rozpakuj

ECHO Adding to PATH...
SETX PATH "%PATH%;C:\adb"
```

### List of Installed Drivers
Lista zainstalowanych sterowników.

```batch
DRIVERQUERY         REM Lista wszystkich
DRIVERQUERY /FO LIST /V    REM Szczegóły
```

---

## File Manager

### File Manager Pro v1.5
Zaawansowany menadżer plików w wierszu poleceń.

**Funkcje:**
```batch
1. List Files - DIR /B
2. Copy Files - COPY
3. Move Files - MOVE
4. Delete Files - DEL
5. Search Files - FINDSTR
6. File Properties - ATTRIB
```

**Interfejs:**
- Menu główne
- Podnaboru operacji
- Obsługa błędów
- Zatwierdzenie dla operacji usuwania

### Simple File Manager
Uproszczony menadżer bez zaawansowanych opcji.

---

## Games

### TIC TAC TOE
Gra w Kółko i Krzyżyk.

**Algorytm:**
```batch
- Tablica 3x3 (9 pól)
- Gracz vs Komputer
- Losowy ruch komputera
- Sprawdzanie zwycięzcy
```

### Snake the Batch Game
Klasyczna gra Snake.

**Problemy:**
- Powolna prędkość (opóźnienia)
- Trudne do implementacji w Batch
- Wymaga czasów rzeczywistych

### Minesweeper
Gra Saper.

**Mechanika:**
- Tablica z minami
- Odkrywanie pól
- Liczba sąsiadujących min
- Detekcja końca gry

### CMD Rubik's Cube
Symulator Kostki Rubika.

### Number Guessing Game
Gra zgadywania liczby.

**Kod:**
```batch
SET /A number=%RANDOM% %% 100
:guess
SET /P input="Guess: "
IF %input% LSS %number% (
    ECHO Higher
) ELSE IF %input% GTR %number% (
    ECHO Lower
) ELSE (
    ECHO You won!
)
```

### Rock Paper Scissors
Papier, Kamień, Nożyce.

```batch
REM Komputer wybiera losowo
SET /A choice=%RANDOM% %% 3
REM 0=Papier, 1=Kamień, 2=Nożyce
```

---

## Install & Update

### Windows Update Checker
Sprawdzenie dostępnych aktualizacji.

```batch
WUAUCLT /ResetAuthorization    REM Reset
WUAUCLT /DetectNow             REM Sprawdź
```

### Drivers Updater
Aktualizacja sterowników.

```batch
DRIVERQUERY /FO CSV > drivers_before.txt
REM Sprawdź zmiany
DRIVERQUERY /FO CSV > drivers_after.txt
```

### Runtime Installers
- **DirectX** - Biblioteka do gier i grafiki
- **.NET Runtime** - Framework Microsoft
- **Visual C++ Redistributable** - Wymagane przez wiele aplikacji

**Procedura instalacji:**
```batch
ECHO Installing %1...
START /WAIT setup.exe /quiet
IF ERRORLEVEL 1 (
    ECHO Installation failed
) ELSE (
    ECHO Installation successful
)
```

---

## Notepad

### Simple Notepad
Otwarcie Notatnika systemowego.

```batch
START notepad.exe
```

### Notepad Pro (Various versions)
Zaawansowany edytor tekstowy w Batch.

**Funkcje:**
- Otwieranie/zapisywanie plików
- Edycja tekstu
- Wyszukiwanie i zamiana

---

## Registry Editor

### RegEditor v1.0
Edytor rejestru systemowego (GUI).

```batch
REGEDIT.EXE            REM Otworzy interfejs
REGEDIT /E file.reg    REM Eksport
REGEDIT /I file.reg    REM Import
```

**Operacje Batch:**
```batch
REM Dodaj klucz
REG ADD "HKEY_LOCAL_MACHINE\Software\MyApp" /V Setting /D Value /F

REM Usuń klucz
REG DELETE "HKEY_LOCAL_MACHINE\Software\MyApp" /V Setting /F

REM Odczytaj wartość
FOR /F "tokens=2*" %%A IN ('REG QUERY "HKEY_LOCAL_MACHINE\Software\MyApp"') DO SET var=%%B
```

⚠️ **OSTROŻNIE!** Edycja rejestru może uszkodzić system!

---

## USB Write Protection

### USB Write Protection Manager
Zarządzanie ochroną przed zapisem na USB.

**Procedura:**
```batch
REM Sprawdź status
WMIC LOGICALDISK GET name, writecache

REM Włącz ochronę (wymaga rejestru)
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" /V WriteProtect /T REG_DWORD /D 1 /F

REM Wyłącz ochronę
REG ADD ... /D 0 /F
```

**Wymagane restartowanie** dla zmian wejścia w życie.

---

## Najlepsze Praktyki z Kolekcji

### 1. Struktura Skryptu
```batch
@ECHO OFF
REM Nowy wiersz dla jasności
SETLOCAL ENABLEDELAYEDEXPANSION
REM Setup
REM Main logic
REM Cleanup
ENDLOCAL
EXIT /B 0
```

### 2. Obsługa Błędów
```batch
command || (
    ECHO Error: command failed
    EXIT /B 1
)
```

### 3. Opóźnianie Rozwinięcia
```batch
SETLOCAL ENABLEDELAYEDEXPANSION
ECHO !variable!    REM Zamiast %variable%
```

### 4. Czyszczenie Zasobów
```batch
REM Usuń pliki tymczasowe
DEL /Q tempfile.tmp

REM Przywróć katalog
POPD

REM Wyłącz zmienne lokalne
ENDLOCAL
```

---

## Wskazówki dla Użytkowników

### Uruchamianie Skryptów

**Metoda 1: Explorer**
- Kliknij dwukrotnie na plik .bat

**Metoda 2: Command Prompt**
```cmd
C:\path\> script.bat
```

**Metoda 3: Zaplanowane Zadanie**
```batch
SCHTASKS /CREATE /TN MyTask /TR "C:\script.bat" /SC DAILY /ST 09:00
```

### Modyfikacja Skryptów

1. Otwórz notatnik
2. Otwórz plik .bat
3. Wprowadź zmiany
4. Zapisz (nie zmieniaj rozszerzenia!)

### Rozwiązywanie Problemów

**Skrypt nie uruchamia się:**
- Sprawdź uprawnienia administratora
- Sprawdzenie PATH
- Sprawdź wykonanie polityki (ExecutionPolicy)

**Błędy składni:**
- Sprawdzenie nawiasów
- Sprawdzenie spacji w zmiennych
- Sprawdzenie cudzysłowów

**Program się zawiesza:**
- Dodaj `PAUSE` do debugowania
- Sprawdzenie ERRORLEVEL
- Sprawdzenie timeout'ów

---

## Zasoby Offline

Wszystkie skrypty w kolekcji zawierają:
- Komentarze objaśniające
- Pliki pomocy w `_Help files`
- README z instrukcjami

---

## Podsumowanie

Kolekcja `Batch.Script.Collection` zawiera:
- ✅ 100+ praktycznych skryptów
- ✅ ASCII art i gry dla zabawy
- ✅ Narzędzia systemowe
- ✅ Przykłady do nauki
- ✅ Szablony do własnych projektów

**Rozpocznij od:**
1. Przeczytaj ten poradnik
2. Obejrzyj konkretne skrypty
3. Zmodyfikuj na własne potrzeby
4. Stwórz własne skrypty!

---

**Ostatnia aktualizacja:** Styczeń 2026

