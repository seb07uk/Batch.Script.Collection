@echo off 
title ¹q¤lÄÁªþ¬íª©-¸g¨å´Ú 
mode con cols=58 lines=7
COLOR f
set m=2
:top
for /l %%z in (1 +1 13) do set "a%%z=  "
for /l %%z in (1 +1 13) do set "b%%z=  "
for /l %%z in (1 +1 13) do set "c%%z=  "
for /l %%z in (1 +1 13) do set "d%%z=  "
for /l %%z in (1 +1 13) do set "e%%z=  "
for /l %%z in (1 +1 13) do set "f%%z=  "
set /a m=m+1
if %m% == 1 set "K=  "
if %m% == 2 set "K=¡½"
if %m% == 3 set "K=  "& set m=1
set "X1=%time:~0,1%" & set "X2=%time:~1,1%" & set "X4=%time:~3,1%" & set "X5=%time:~4,1%"& set "x7=%time:~6,1%" & set "x8=%time:~7,1%"
:zero
if "%x1%"==" " (
for /l %%z in (1 +1 13) do set "a%%z=¡½"
set "a7=  "
)
if "%x2%"=="0" (
for /l %%z in (1 +1 13) do set "b%%z=¡½"
set "b7=  "
)
if "%x4%"=="0" (
for /l %%z in (1 +1 13) do set "c%%z=¡½"
set "c7=  "
)
if "%x5%"=="0" (
for /l %%z in (1 +1 13) do set "d%%z=¡½"
set "d7=  "
)
if "%x7%"=="0" (
for /l %%z in (1 +1 13) do set "e%%z=¡½"
set "e7=  "
)
if "%x8%"=="0" (
for /l %%z in (1 +1 13) do set "f%%z=¡½"
set "f7=  "
)
:one
if "%x1%"=="1" (
set a3=¡½
set a5=¡½
set a8=¡½
set a10=¡½
set a13=¡½
)
if "%x2%"=="1" (
set b3=¡½
set b5=¡½
set b8=¡½
set b10=¡½
set b13=¡½
)
if "%x4%"=="1" (
set c3=¡½
set c5=¡½
set c8=¡½
set c10=¡½
set c13=¡½
)
if "%x5%"=="1" (
set d3=¡½
set d5=¡½
set d8=¡½
set d10=¡½
set d13=¡½
)
if "%x7%"=="1" (
set e3=¡½
set e5=¡½
set e8=¡½
set e10=¡½
set e13=¡½
)
if "%x8%"=="1" (
set f3=¡½
set f5=¡½
set f8=¡½
set f10=¡½
set f13=¡½
)
:two
if "%x1%"=="2" (
for /l %%z in (1 +1 13) do set "a%%z=¡½"
set "a4=  "
set "a10=  "
)
if "%x2%"=="2" (
for /l %%z in (1 +1 13) do set "b%%z=¡½"
set "b4=  "
set "b10=  "
)
if "%x4%"=="2" (
for /l %%z in (1 +1 13) do set "c%%z=¡½"
set "c4=  "
set "c10=  "
)
if "%x5%"=="2" (
for /l %%z in (1 +1 13) do set "d%%z=¡½"
set "d4=  "
set "d10=  "
)
if "%x7%"=="2" (
for /l %%z in (1 +1 13) do set "e%%z=¡½"
set "e4=  "
set "e10=  "
)
if "%x8%"=="2" (
for /l %%z in (1 +1 13) do set "f%%z=¡½"
set "f4=  "
set "f10=  "
)
:three
if "%x2%"=="3" (
for /l %%z in (1 +1 13) do set "b%%z=¡½"
set "b4=  "
set "b9=  "
)
if "%x4%"=="3" (
for /l %%z in (1 +1 13) do set "c%%z=¡½"
set "c4=  "
set "c9=  "
)
if "%x5%"=="3" (
for /l %%z in (1 +1 13) do set "d%%z=¡½"
set "d4=  "
set "d9=  "
)
if "%x7%"=="3" (
for /l %%z in (1 +1 13) do set "e%%z=¡½"
set "e4=  "
set "e9=  "
)
if "%x8%"=="3" (
for /l %%z in (1 +1 13) do set "f%%z=¡½"
set "f4=  "
set "f9=  "
)
:four
if "%x2%"=="4" (
for /l %%z in (1 +1 13) do set "b%%z=¡½"
set "b2=  "
set "b9=  "
set "b11=  "
set "b12=  "
)
if "%x4%"=="4" (
for /l %%z in (1 +1 13) do set "c%%z=¡½"
set "c2=  "
set "c9=  "
set "c11=  "
set "c12=  "
)
if "%x5%"=="4" (
for /l %%z in (1 +1 13) do set "d%%z=¡½"
set "d2=  "
set "d9=  "
set "d11=  "
set "d12=  "
)
if "%x7%"=="4" (
for /l %%z in (1 +1 13) do set "e%%z=¡½"
set "e2=  "
set "e9=  "
set "e11=  "
set "e12=  "
)
if "%x8%"=="4" (
for /l %%z in (1 +1 13) do set "f%%z=¡½"
set "f2=  "
set "f9=  "
set "f11=  "
set "f12=  "
)
:five
if "%x2%"=="5" (
for /l %%z in (1 +1 13) do set "b%%z=¡½"
set "b5=  "
set "b9=  "
)
if "%x4%"=="5" (
for /l %%z in (1 +1 13) do set "c%%z=¡½"
set "c5=  "
set "c9=  "
)
if "%x5%"=="5" (
for /l %%z in (1 +1 13) do set "d%%z=¡½"
set "d5=  "
set "d9=  "
)
if "%x7%"=="5" (
for /l %%z in (1 +1 13) do set "e%%z=¡½"
set "e5=  "
set "e9=  "
)
if "%x8%"=="5" (
for /l %%z in (1 +1 13) do set "f%%z=¡½"
set "f5=  "
set "f9=  "
)
:six
if "%x2%"=="6" (
for /l %%z in (1 +1 13) do set "b%%z=¡½"
set "b5=  "
)
if "%x5%"=="6" (
for /l %%z in (1 +1 13) do set "d%%z=¡½"
set "d5=  "
)
if "%x8%"=="6" (
for /l %%z in (1 +1 13) do set "f%%z=¡½"
set "f5=  "
)
:seven
if "%x2%"=="7" (
for /l %%z in (1 +1 13) do set "b%%z=¡½"
set "b4=  "
set "b6=  "
set "b7=  "
set "b9=  "
set "b11=  "
set "b12=  "
)
if "%x5%"=="7" (
for /l %%z in (1 +1 13) do set "d%%z=¡½"
set "d4=  "
set "d6=  "
set "d7=  "
set "d9=  "
set "d11=  "
set "d12=  "
)
if "%x8%"=="7" (
for /l %%z in (1 +1 13) do set "f%%z=¡½"
set "f4=  "
set "f6=  "
set "f7=  "
set "f9=  "
set "f11=  "
set "f12=  "
)
:eight
if "%x2%"=="8" for /l %%z in (1 +1 13) do set "b%%z=¡½"
if "%x5%"=="8" for /l %%z in (1 +1 13) do set "d%%z=¡½"
if "%x8%"=="8" for /l %%z in (1 +1 13) do set "f%%z=¡½"
:nine
if "%x2%"=="9" (
for /l %%z in (1 +1 13) do set "b%%z=¡½"
set "b9=  "
)
if "%x5%"=="9" (
for /l %%z in (1 +1 13) do set "d%%z=¡½"
set "d9=  "
)
if "%x8%"=="9" (
for /l %%z in (1 +1 13) do set "f%%z=¡½"
set "f9=  "
)
cls
echo=
echo   %a1%%a2%%a3% %b1%%b2%%b3%      %c1%%c2%%c3% %d1%%d2%%d3%     %e1%%e2%%e3% %f1%%f2%%f3%
echo   %a4%  %a5% %b4%  %b5%  %K%  %c4%  %c5% %d4%  %d5%  %K% %e4%  %e5% %f4%  %f5%
echo   %a6%%a7%%a8% %b6%%b7%%b8%      %c6%%c7%%c8% %d6%%d7%%d8%     %e6%%e7%%e8% %f6%%f7%%f8%
echo   %a9%  %a10% %b9%  %b10%  %K%  %c9%  %c10% %d9%  %d10%  %K% %e9%  %e10% %f9%  %f10%
echo   %a11%%a12%%a13% %b11%%b12%%b13%      %c11%%c12%%c13% %d11%%d12%%d13%     %e11%%e12%%e13% %f11%%f12%%f13%
::for /l %%v in (1 +1 60000) do rem delay
timeout /t 1 /nobreak >nul
goto top