@echo off
setlocal enabledelayedexpansion
title Polsoft WebViewer Compiler

:: Konfiguracja ścieżek Polsoft
set "TARGET_DIR=%USERPROFILE%\.polsoft\psCLI\WGCF"
set "DIST_DIR=%cd%\dist"
set "BUILD_DIR=%cd%\build"

echo =======================================================
echo     KOMPILACJA PROJEKTU DO EXE (BEZ KONSOLI)
echo =======================================================

:: 1. Sprawdzenie czy venv istnieje
if not exist ".venv" (
    echo [!] Brak srodowiska .venv. Uruchom najpierw build.bat.
    pause
    exit /b
)

:: 2. Instalacja narzędzi do kompilacji
echo [*] Instalacja PyInstaller...
.\.venv\Scripts\python.exe -m pip install pyinstaller PyQt6 PyQt6-WebEngine

:: 3. Czyszczenie starych plików buildu
echo [*] Czyszczenie poprzednich kompilacji...
if exist "%DIST_DIR%" rmdir /s /q "%DIST_DIR%"
if exist "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%"
if exist "*.spec" del /q "*.spec"

:: 4. Kompilacja właściwa
echo [*] Rozpoczynanie kompilacji (to moze potrwac)...
echo [*] Flagi: --onefile (jeden plik), --windowed (brak konsoli)

.\.venv\Scripts\pyinstaller --noconfirm --onefile --windowed ^
    --name "WebViewer" ^
    --collect-all PyQt6.QtWebEngineWidgets ^
    --collect-all PyQt6.QtWebEngineCore ^
    main.py

if %errorlevel% neq 0 (
    echo.
    echo [!] BLAD KOMPILACJI! Sprawdz logi powyzej.
    pause
    exit /b
)

:: 5. Przenoszenie gotowego pliku do Twojej lokalizacji Polsoft
echo [*] Przenoszenie gotowego pliku do: %TARGET_DIR%
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"
move /y "%DIST_DIR%\WebViewer.exe" "%TARGET_DIR%\"

echo =======================================================
echo     SUKCES! Program WebViewer.exe jest gotowy.
echo     Lokalizacja: %TARGET_DIR%\WebViewer.exe
echo =======================================================
pause