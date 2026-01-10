@echo off
setlocal EnableDelayedExpansion

::  =============================================
::              Empty System Bin v1.0
::        polsoft.ITS London  CLI Framework
::          2025(c) Sebastian Januchowski
::  =============================================
echo.
set "LOGDIR=%USERPROFILE%\.polsoft\Log"
if not exist "%LOGDIR%" mkdir "%LOGDIR%"


REM --- Numeracja logów ---
set "NEXT=1"
for /f "tokens=2 delims=_." %%A in ('dir /b "%LOGDIR%\EmptyBin_psCLI_*.log" 2^>nul') do (
    set /a NUM=%%A
    if !NUM! geq !NEXT! set /a NEXT=!NUM!+1
)

set "NUMLOG=00%NEXT%"
set "NUMLOG=!NUMLOG:~-3!"
set "LOGFILE=%LOGDIR%\EmptyBin_psCLI_!NUMLOG!.log"
set "LATEST=%LOGDIR%\EmptyBin_psCLI.log"

REM --- Zapisz listę plików z kosza ---
powershell -NoProfile -Command ^
  "$shell = New-Object -ComObject Shell.Application; $ns = $shell.Namespace(10); $items = $ns.Items(); $lines=@(); for ($i=0; $i -lt $items.Count; $i++) { $it=$items.Item($i); $lines += $ns.GetDetailsOf($it,0)+' | '+$ns.GetDetailsOf($it,1)+' | '+$ns.GetDetailsOf($it,2)+' | '+$ns.GetDetailsOf($it,3) }; $header = '# EmptyBin Log ' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'); $out=$header,$lines; $out | Set-Content -Path '%LOGFILE%' -Encoding UTF8; $out | Set-Content -Path '%LATEST%' -Encoding UTF8"

REM --- Opróżnij kosz przez API SHEmptyRecycleBin ---
powershell -NoProfile -Command ^
  "Add-Type -Namespace Win32 -Name NativeMethods -MemberDefinition '[DllImport(\"Shell32.dll\")] public static extern int SHEmptyRecycleBin(IntPtr hwnd, string pszRootPath, uint dwFlags);'; [Win32.NativeMethods]::SHEmptyRecycleBin([IntPtr]::Zero,$null,0)"

echo [32m[OK] Kosz oprozniony.[0m [33mLog: %LOGFILE%[0m
endlocal
exit /b 0