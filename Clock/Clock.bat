@echo off
setlocal
:initialize
set "s=10"
set "m=10"
:: Note Offset
set "xs=%time:~6,1%" & set "sx=%time:~7,1%"
set "xm=%time:~3,1%" & set "mx=%time:~4,1%"
set "so=%xs:0=%%sx%" & set "mo=%xm:0=%%mx%"
echo Offset: %mo% : %so%
:process
:: Calculate Changes
set "xs=%time:~6,1%" & set "sx=%time:~7,1%"
set "xm=%time:~3,1%" & set "mx=%time:~4,1%"
set "xs=%xs:0=%" & set "xm=%xm:0=%"
if %xs%%sx% lss %so% set "xs=60+%xs%"
if %xm%%mx% lss %mo% set "xs=60+%xm%"
set /a "s=%xs%%sx%-%so%"
if %s% equ 0 set /a "m=%xm%%mx%-%mo%"
:: Pause Processing
ping 192.0.2.2 -n 1 -w 200 >nul
:display
:: Detect Lag
set "w="
if %s%0 equ %bs%0 goto process
if %s%0 lss %bs%0 set "w=lag detected"
if %s%0 geq %es%0 set "w=lag detected"
:: Format Output
set "mm=00%m%"
set "ss=00%s%"
set "bm=%m%"
set "bs=%s%"
set /a "es=%s%+2"
:: Display
echo Clock: %mm:~-2% : %ss:~-2% %w%
goto process
endlocal
exit /b 0

:: For an universal time format parser use the following with en-US format fallback.
for /f "skip=1 tokens=2 delims==" %%A in ('"wmic OS Get LocalDateTime /Value 2>nul || echo. & echo DT=%date:~-4%%date:~4,2%%date:~7,2%%time:~0,2%%time:~3,2%%time:~6,2%%time:~8,3%0000-ZZZ"') do @echo %%A