# Zaawansowany Przewodnik Batch Scripts - Techniki Profesjonalne

## Spis Treści
1. [Architektura Aplikacji](#architektura-aplikacji)
2. [Design Patterns](#design-patterns)
3. [Bezpieczeństwo](#bezpieczeństwo)
4. [Debugowanie](#debugowanie)
5. [Optymalizacja Wydajności](#optymalizacja-wydajności)
6. [Integracja z PowerShell](#integracja-z-powershell)
7. [Najlepsze Praktyki](#najlepsze-praktyki)

---

## Architektura Aplikacji

### Struktura Dużego Projektu

```
MyProject/
├── main.bat               # Punkt wejścia
├── config.bat            # Konfiguracja globalna
├── libs/
│   ├── logger.bat        # Logging functions
│   ├── utils.bat         # Funkcje utility
│   └── validators.bat    # Walidacja danych
├── modules/
│   ├── backup.bat        # Moduł backup
│   ├── sync.bat          # Moduł synchronizacji
│   └── monitor.bat       # Moduł monitoringu
├── tests/
│   ├── test_utils.bat    # Testy
│   └── test_backup.bat
├── docs/
│   ├── README.md
│   └── API.md
└── logs/
    └── application.log
```

### Główny Skrypt z Modułami

```batch
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM main.bat - Application entry point

SET "SCRIPT_DIR=%~dp0"
SET "CONFIG_FILE=!SCRIPT_DIR!config.bat"
SET "LIBS_DIR=!SCRIPT_DIR!libs"
SET "MODULES_DIR=!SCRIPT_DIR!modules"

REM Ładowanie konfiguracji
CALL "!CONFIG_FILE!" || EXIT /B 1

REM Ładowanie bibliotek
CALL "!LIBS_DIR!\logger.bat"
CALL "!LIBS_DIR!\utils.bat"

CALL :log_info "Application started"

REM Parsowanie argumentów
IF "%1"=="" (
    CALL :show_help
) ELSE IF "%1"=="backup" (
    CALL "!MODULES_DIR!\backup.bat" %2 %3
) ELSE IF "%1"=="monitor" (
    CALL "!MODULES_DIR!\monitor.bat"
) ELSE (
    CALL :log_error "Unknown command: %1"
    EXIT /B 1
)

CALL :log_info "Application finished"
ENDLOCAL
EXIT /B 0

:show_help
ECHO Usage: main.bat [command]
ECHO.
ECHO Commands:
ECHO   backup [source] [dest]  - Create backup
ECHO   monitor                 - Monitor system
ECHO.
EXIT /B 0
```

---

## Design Patterns

### Pattern 1: Library/Module

```batch
REM utils.bat - Reusable functions

:string_trim
REM Usuń spacje z początku i końca
SET "str=%~1"
FOR /F "tokens=*" %%a IN ("!str!") DO SET "str=%%a"
SET "%2=!str!"
EXIT /B 0

:string_length
REM Zwróć długość stringa
SETLOCAL ENABLEDELAYEDEXPANSION
SET "s=%~1"
SET /A "len=0"
:len_loop
IF NOT "!s!"=="" (
    SET "s=!s:~1!"
    SET /A "len+=1"
    GOTO len_loop
)
ENDLOCAL & SET "%2=%len%"
EXIT /B 0

:string_contains
REM Sprawdź czy string zawiera substring
ECHO(%~1 | FINDSTR /C:"%~2" >NUL
IF ERRORLEVEL 1 (EXIT /B 1) ELSE (EXIT /B 0)

:string_replace
REM Zastąp substring
SET "result=%~1"
SET "result=!result:%~2=%~3!"
SET "%4=!result!"
EXIT /B 0
```

Użycie:
```batch
CALL :string_trim "  Hello World  " trimmed
ECHO !trimmed!

CALL :string_length "Hello" len
ECHO Length: !len!

IF CALL :string_contains "Hello World" "World" (
    ECHO Found!
)
```

### Pattern 2: Configuration Management

```batch
REM config.bat - Centralna konfiguracja

REM === ENVIRONMENT ===
SET "APP_NAME=MyApplication"
SET "APP_VERSION=1.0.0"
SET "APP_AUTHOR=Your Company"

REM === PATHS ===
SET "BASE_DIR=%~dp0"
SET "LOG_DIR=!BASE_DIR!logs"
SET "BACKUP_DIR=!BASE_DIR!backups"
SET "TEMP_DIR=%TEMP%\!APP_NAME!"

REM === LOGGING ===
SET "LOG_FILE=!LOG_DIR!\application.log"
SET "LOG_LEVEL=INFO"  REM DEBUG, INFO, WARN, ERROR

REM === DATABASE ===
SET "DB_SERVER=localhost"
SET "DB_USER=admin"
SET "DB_PASS=password"  REM NIGDY NIE HARDCODUJ!

REM === TIMEOUTS ===
SET "TIMEOUT_SECONDS=30"
SET "RETRY_COUNT=3"

REM === CREATE DIRECTORIES ===
IF NOT EXIST "!LOG_DIR!" MKDIR "!LOG_DIR!"
IF NOT EXIST "!BACKUP_DIR!" MKDIR "!BACKUP_DIR!"
IF NOT EXIST "!TEMP_DIR!" MKDIR "!TEMP_DIR!"

EXIT /B 0
```

### Pattern 3: Dependency Injection

```batch
REM Przekazanie zależności jako argumentu

:process_file
SETLOCAL
SET "filepath=%~1"
SET "processor=%~2"  REM Funkcja do procesu przetwarzania

CALL :!processor! "!filepath!"
ENDLOCAL
EXIT /B 0

REM Użycie
CALL :process_file "input.txt" "xml_processor"
CALL :process_file "data.csv" "csv_processor"

:xml_processor
ECHO Processing XML: %1
EXIT /B 0

:csv_processor
ECHO Processing CSV: %1
EXIT /B 0
```

---

## Bezpieczeństwo

### Walidacja Danych

```batch
:validate_filepath
REM Sprawdzenie czy ścieżka jest bezpieczna
SET "filepath=%~1"

REM Check for dangerous characters
ECHO !filepath! | FINDSTR /R "\.\..*\|;\*\?" >NUL
IF ERRORLEVEL 0 (
    ECHO Error: Invalid characters in path
    EXIT /B 1
)

REM Check if path exists
IF NOT EXIST "!filepath!" (
    ECHO Error: Path does not exist
    EXIT /B 1
)

EXIT /B 0

:validate_number
REM Walidacja czy string jest numerem
SET "value=%~1"
SET "result=1"

FOR /L %%i IN (0,1,9) DO (
    IF "!value!"=="%%i" SET "result=0"
)

EXIT /B !result!

:validate_email
REM Prosty regex dla email
SET "email=%~1"
ECHO !email! | FINDSTR /R ".*@.*\..*" >NUL
EXIT /B %ERRORLEVEL%
```

### Obsługa Wrażliwych Danych

```batch
REM NIGDY nie loguj haseł ani tokenów!

REM ❌ ŹRÓDŁEM PROBLEMU
SET "password=MySecretPassword"
ECHO Password: !password! >> log.txt

REM ✓ DOBRZE
SET "password=MySecretPassword"
REM Loguj tylko że operacja się powiodła
ECHO Authentication succeeded >> log.txt
SET "password="

REM Użycie GetPass dla bezpieczeństwa
CALL :get_secure_input userpassword
IF !ERRORLEVEL! NEQ 0 EXIT /B 1

:get_secure_input
REM Wczytaj hasło bez wyświetlania (wymaga VB/powershell)
SETLOCAL
SET "output=%1"
ENDLOCAL & SET "%output%=!password!"
EXIT /B 0
```

### Sprawdzenie Uprawnień

```batch
:check_admin
REM Sprawdź czy skrypt uruchomiony jest jako admin
NET SESSION >NUL 2>&1
IF ERRORLEVEL 1 (
    ECHO Error: Administrator rights required
    ECHO Please run this script as Administrator
    PAUSE
    EXIT /B 1
)
EXIT /B 0

:check_os
REM Sprawdź wersję Windows
FOR /F "tokens=3" %%i IN ('VER') DO SET "os_version=%%i"
ECHO OS Version: !os_version!
EXIT /B 0
```

---

## Debugowanie

### Strategia Debugowania

```batch
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM === DEBUG MODE ===
SET "DEBUG_MODE=1"  REM 0=OFF, 1=ON

IF !DEBUG_MODE!==1 (
    @ECHO ON
    ECHO DEBUG MODE: ON
)

:debug_print
IF !DEBUG_MODE!==1 (
    ECHO [DEBUG] %1
)
EXIT /B 0

REM Użycie
CALL :debug_print "Starting operation"
SET var=value
CALL :debug_print "var=!var!"
```

### Trace Stack

```batch
SETLOCAL ENABLEDELAYEDEXPANSION

SET "CALL_STACK="

:trace_enter
REM Loguj wejście do funkcji
IF "%1"=="" EXIT /B 1
SET "CALL_STACK=!CALL_STACK! [%1]"
ECHO Call stack: !CALL_STACK!
EXIT /B 0

:trace_exit
REM Loguj wyjście z funkcji
IF "%CALL_STACK%"=="" EXIT /B 0
FOR %%a IN (!CALL_STACK!) DO SET "last=%%a"
REM Usuń ostatni element
SET "CALL_STACK=!CALL_STACK:%last%=!"
ECHO Call stack: !CALL_STACK!
EXIT /B 0
```

### Logging do Pliku

```batch
:log_message
SETLOCAL ENABLEDELAYEDEXPANSION
SET "level=%~1"
SET "message=%~2"

FOR /F "tokens=2-4 delims=/ " %%a IN ('DATE /T') DO SET "mydate=%%c%%a%%b"
FOR /F "tokens=1-2 delims=/:" %%a IN ('TIME /T') DO SET "mytime=%%a%%b"

ECHO [!mydate! !mytime!] [!level!] !message! >> application.log
ENDLOCAL
EXIT /B 0

REM Użycie
CALL :log_message "INFO" "Operation started"
CALL :log_message "WARN" "Low disk space"
CALL :log_message "ERROR" "File not found"
```

---

## Optymalizacja Wydajności

### Benchmarking

```batch
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM === PERFORMANCE TESTING ===

:benchmark_operation
SET "start_time=%TIME%"
FOR /F "tokens=1-4 delims=:," %%a IN ("%start_time%") DO SET /A start_ms=(%%a*3600000)+(%%b*60000)+(%%c*1000)+%%d

REM Twoja operacja
CALL :expensive_operation

SET "end_time=%TIME%"
FOR /F "tokens=1-4 delims=:," %%a IN ("%end_time%") DO SET /A end_ms=(%%a*3600000)+(%%b*60000)+(%%c*1000)+%%d

SET /A elapsed=!end_ms!-!start_ms!
IF !elapsed! LSS 0 SET /A elapsed=86400000+!elapsed!

ECHO Operation took !elapsed! milliseconds
EXIT /B 0

:expensive_operation
REM Simulacja wydajnych operacji
FOR /L %%i IN (1,1,1000000) DO @REM loop
EXIT /B 0
```

### Pamięć Cache

```batch
REM Cachowanie wyników operacji

SET "cache_enabled=1"
SET "cache_dir=%TEMP%\batch_cache"

IF NOT EXIST "!cache_dir!" MKDIR "!cache_dir!"

:get_cached_value
SETLOCAL
SET "key=%~1"
SET "cache_file=!cache_dir!\!key!.cache"

IF EXIST "!cache_file!" (
    FOR /F %%i IN ('TYPE "!cache_file!"') DO SET "result=%%i"
    ENDLOCAL & SET "%2=!result!"
    EXIT /B 0
)

REM Nie znaleziono w cache
ENDLOCAL
EXIT /B 1

:set_cached_value
SETLOCAL
SET "key=%~1"
SET "value=%~2"
SET "cache_file=!cache_dir!\!key!.cache"

ECHO !value! > "!cache_file!"
ENDLOCAL
EXIT /B 0
```

### Zoptymalizowane Pętle

```batch
REM ❌ POWOLI: Wiele pojedynczych redirekcji
FOR %%i IN (1,2,3,4,5) DO (
    ECHO %%i >> output.txt
)

REM ✓ SZYBKO: Jedna redirekcja zbiorowa
(
    FOR %%i IN (1,2,3,4,5) DO (
        ECHO %%i
    )
) >> output.txt

REM ❌ POWOLI: Wiele zmian katalogów
FOR /D %%d IN (*) DO (
    CD %%d
    ECHO Processing %%d
    CD ..
)

REM ✓ SZYBKO: PUSHD/POPD
FOR /D %%d IN (*) DO (
    PUSHD %%d
    ECHO Processing %%d
    POPD
)
```

---

## Integracja z PowerShell

### Wywoływanie PowerShell z Batch

```batch
@ECHO OFF
REM Uruchomienie PowerShell kodu z Batch

REM Prosty sposób
POWERSHELL -Command "Get-Date"

REM Ze skryptem
POWERSHELL -ExecutionPolicy Bypass -File script.ps1

REM Z argumentami
POWERSHELL -Command "param($name) Write-Host $name" -args "John"

REM Wieloliniowy kod
POWERSHELL -Command ^
    "Get-ChildItem | Where-Object {$_.Extension -eq '.txt'} | ForEach-Object {Write-Host $_.Name}"
```

### Wymiana Danych

```batch
REM Ustawienie zmiennej z PowerShell wyniku
FOR /F "delims=" %%i IN ('POWERSHELL -Command "Get-Date -Format yyyy-MM-dd"') DO SET "today=%%i"
ECHO Today is: %today%

REM Wywołanie PS funkcji
POWERSHELL -Command "function Get-FirstName($name) { return $name.Split(' ')[0] }; Get-FirstName 'John Doe'"
```

### Hybrydowy Skrypt Batch+PowerShell

```batch
@ECHO OFF
REM Uniwersalny skrypt działający zarówno w Batch jak i PS

SETLOCAL ENABLEDELAYEDEXPANSION
POWERSHELL -NoProfile -Command ^
    "$batch=$true; invoke-expression (($this | select @{n='_';e={$_}})._ | out-string)"
EXIT /B !ERRORLEVEL!

<#
PowerShell:
if ($batch) {
    Write-Host "Running from Batch"
}
#>
```

---

## Najlepsze Praktyki

### 1. Dokumentacja

```batch
REM ============================================================================
REM NAZWA:     backup_system.bat
REM OPIS:      Tworzy backup plików systemowych
REM AUTOR:     Your Name
REM DATA:      2026-01-28
REM VERSION:   1.0.0
REM ============================================================================
REM
REM UŻYCIE:    backup_system.bat [opcje]
REM 
REM OPCJE:
REM   /FULL      - Pełny backup
REM   /INCREMENTAL - Inkrementacyjny backup
REM   /RESTORE   - Przywróć backup
REM
REM PRZYKŁADY:
REM   backup_system.bat /FULL
REM   backup_system.bat /INCREMENTAL /VERIFY
REM
REM ZMIENNE:
REM   BACKUP_PATH  - Ścieżka do backupów (definiuj w config)
REM   SOURCE_PATH  - Ścieżka źródłowa
REM
REM ============================================================================
```

### 2. Konwencja Nazewnictwa

```batch
REM Zmienne
SET "g_globalVariable=value"      REM Zmienne globalne z prefiksem g_
SET "local_variable=value"        REM Zmienne lokalne
SET "m_ModuleVariable=value"      REM Zmienne modułu z m_

REM Funkcje
:public_function_name             REM Publiczne funkcje
:_private_function                REM Prywatne funkcje z _

REM Stałe
SET "CONST_MAX_RETRIES=3"         REM UPPERCASE dla stałych
SET "CONST_TIMEOUT=5000"
```

### 3. Error Handling

```batch
REM Zawsze sprawdzaj ERRORLEVEL po operacjach
COPY source.txt dest.txt
IF ERRORLEVEL 1 (
    CALL :log_error "Failed to copy file"
    EXIT /B 1
)

REM Lub używaj && i ||
COPY source.txt dest.txt && (
    CALL :log_info "File copied successfully"
) || (
    CALL :log_error "Failed to copy file"
    EXIT /B 1
)
```

### 4. Zarządzanie Zasobami

```batch
REM Zawsze oczyść zasoby
REM Zamknij pliki tymczasowe
IF EXIST "%TEMP_FILE%" DEL "%TEMP_FILE%"

REM Wyłącz zmienne delayed expansion
ENDLOCAL

REM Przywróć poprzedni stan
POPD
```

### 5. Testowanie

```batch
REM test_suite.bat

SET "test_count=0"
SET "test_passed=0"
SET "test_failed=0"

REM Test 1
SET /A test_count+=1
CALL :assert_equals 5 5
IF ERRORLEVEL 1 (
    ECHO FAILED: Test 1
    SET /A test_failed+=1
) ELSE (
    ECHO PASSED: Test 1
    SET /A test_passed+=1
)

REM Test 2
SET /A test_count+=1
CALL :assert_true 1
IF ERRORLEVEL 1 (
    SET /A test_failed+=1
) ELSE (
    SET /A test_passed+=1
)

ECHO.
ECHO Test Summary: %test_passed%/%test_count% passed

:assert_equals
IF "%1"=="%2" EXIT /B 0
EXIT /B 1

:assert_true
IF "%1"=="1" EXIT /B 0
EXIT /B 1
```

### 6. Version Control

```batch
REM Zawsze dodawaj wersje do Twoich skryptów
REM W GIT include version info

REM W skrypcie:
SET "SCRIPT_VERSION=1.0.0"
SET "SCRIPT_BUILD=2026012801"
SET "SCRIPT_LAST_MODIFIED=2026-01-28"

REM Zwolnienie wersji
REM Tag w Git: v1.0.0
```

### 7. Deployment Safety

```batch
REM Pre-deployment checks

REM 1. Backup istniejących plików
IF EXIST "production.bat" (
    COPY "production.bat" "production.bat.bak.!DATE!"
)

REM 2. Weryfikacja nowego skryptu
IF NOT EXIST "production_new.bat" (
    ECHO Error: New script not found
    EXIT /B 1
)

REM 3. Test w dry-run mode
CALL production_new.bat /DRY_RUN
IF ERRORLEVEL 1 (
    ECHO Deployment failed in dry-run
    EXIT /B 1
)

REM 4. Faktyczne zagrożenie
MOVE "production.bat" "production.bat.old"
MOVE "production_new.bat" "production.bat"

REM 5. Weryfikacja
CALL production.bat /VERIFY
IF ERRORLEVEL 1 (
    REM Rollback!
    MOVE "production.bat.old" "production.bat"
    ECHO Rollback completed
    EXIT /B 1
)

ECHO Deployment successful
DEL "production.bat.old"
EXIT /B 0
```

---

## Summary - Złote Zasady

✅ **DO:**
- Zawsze dodawaj komentarze
- Testuj kod przed deploymentem
- Obsługuj błędy gracjnie
- Loguj ważne zdarzenia
- Weryfikuj dane wejściowe
- Zarządzaj zasobami
- Używaj zmiennych zamiast hardcodingu

❌ **NIE:**
- Nie hardcoduj ścieżek
- Nie loguj haseł
- Nie usuwaj bez pytania (`/Q`)
- Nie ignoruj błędów
- Nie modyfikuj rejestru bez kopii
- Nie uruchamiaj nieznanego kodu
- Nie pollegaj na wcisku `Ctrl+C`

---

**Ostatnia aktualizacja:** Styczeń 2026

