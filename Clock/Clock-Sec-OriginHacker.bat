@echo off 
title 電子鐘附秒版-經典款 (絕影駭客)
mode con cols=55 lines=7
COLOR A
echo=
echo                       Loading...
:top
set /a r1=%random%%%2+0
set /a r2=%random%%%2+0
if %r1% == %r2% goto top
SET blank=%r1%%r2%
for /l %%z in (1 +1 13) do set "a%%z=%blank%"
for /l %%z in (1 +1 13) do set "b%%z=%blank%"
for /l %%z in (1 +1 13) do set "c%%z=%blank%"
for /l %%z in (1 +1 13) do set "d%%z=%blank%"
for /l %%z in (1 +1 13) do set "e%%z=%blank%"
for /l %%z in (1 +1 13) do set "f%%z=%blank%"
set "X1=%time:~0,1%" & set "X2=%time:~1,1%" & set "X4=%time:~3,1%" & set "X5=%time:~4,1%"& set "x7=%time:~6,1%" & set "x8=%time:~7,1%"
:zero
if "%x1%"==" " (
for /l %%z in (1 +1 13) do set "a%%z=■"
set "a7=%blank%"
)
if "%x2%"=="0" (
for /l %%z in (1 +1 13) do set "b%%z=■"
set "b7=%blank%"
)
if "%x4%"=="0" (
for /l %%z in (1 +1 13) do set "c%%z=■"
set "c7=%blank%"
)
if "%x5%"=="0" (
for /l %%z in (1 +1 13) do set "d%%z=■"
set "d7=%blank%"
)
if "%x7%"=="0" (
for /l %%z in (1 +1 13) do set "e%%z=■"
set "e7=%blank%"
)
if "%x8%"=="0" (
for /l %%z in (1 +1 13) do set "f%%z=■"
set "f7=%blank%"
)
:one
if "%x1%"=="1" (
set a3=■
set a5=■
set a8=■
set a10=■
set a13=■
)
if "%x2%"=="1" (
set b3=■
set b5=■
set b8=■
set b10=■
set b13=■
)
if "%x4%"=="1" (
set c3=■
set c5=■
set c8=■
set c10=■
set c13=■
)
if "%x5%"=="1" (
set d3=■
set d5=■
set d8=■
set d10=■
set d13=■
)
if "%x7%"=="1" (
set e3=■
set e5=■
set e8=■
set e10=■
set e13=■
)
if "%x8%"=="1" (
set f3=■
set f5=■
set f8=■
set f10=■
set f13=■
)
:two
if "%x1%"=="2" (
for /l %%z in (1 +1 13) do set "a%%z=■"
set "a4=%blank%"
set "a10=%blank%"
)
if "%x2%"=="2" (
for /l %%z in (1 +1 13) do set "b%%z=■"
set "b4=%blank%"
set "b10=%blank%"
)
if "%x4%"=="2" (
for /l %%z in (1 +1 13) do set "c%%z=■"
set "c4=%blank%"
set "c10=%blank%"
)
if "%x5%"=="2" (
for /l %%z in (1 +1 13) do set "d%%z=■"
set "d4=%blank%"
set "d10=%blank%"
)
if "%x7%"=="2" (
for /l %%z in (1 +1 13) do set "e%%z=■"
set "e4=%blank%"
set "e10=%blank%"
)
if "%x8%"=="2" (
for /l %%z in (1 +1 13) do set "f%%z=■"
set "f4=%blank%"
set "f10=%blank%"
)
:three
if "%x2%"=="3" (
for /l %%z in (1 +1 13) do set "b%%z=■"
set "b4=%blank%"
set "b9=%blank%"
)
if "%x4%"=="3" (
for /l %%z in (1 +1 13) do set "c%%z=■"
set "c4=%blank%"
set "c9=%blank%"
)
if "%x5%"=="3" (
for /l %%z in (1 +1 13) do set "d%%z=■"
set "d4=%blank%"
set "d9=%blank%"
)
if "%x7%"=="3" (
for /l %%z in (1 +1 13) do set "e%%z=■"
set "e4=%blank%"
set "e9=%blank%"
)
if "%x8%"=="3" (
for /l %%z in (1 +1 13) do set "f%%z=■"
set "f4=%blank%"
set "f9=%blank%"
)
:four
if "%x2%"=="4" (
for /l %%z in (1 +1 13) do set "b%%z=■"
set "b2=%blank%"
set "b9=%blank%"
set "b11=%blank%"
set "b12=%blank%"
)
if "%x4%"=="4" (
for /l %%z in (1 +1 13) do set "c%%z=■"
set "c2=%blank%"
set "c9=%blank%"
set "c11=%blank%"
set "c12=%blank%"
)
if "%x5%"=="4" (
for /l %%z in (1 +1 13) do set "d%%z=■"
set "d2=%blank%"
set "d9=%blank%"
set "d11=%blank%"
set "d12=%blank%"
)
if "%x7%"=="4" (
for /l %%z in (1 +1 13) do set "e%%z=■"
set "e2=%blank%"
set "e9=%blank%"
set "e11=%blank%"
set "e12=%blank%"
)
if "%x8%"=="4" (
for /l %%z in (1 +1 13) do set "f%%z=■"
set "f2=%blank%"
set "f9=%blank%"
set "f11=%blank%"
set "f12=%blank%"
)
:looop
set /a r1=%random%%%2+0
set /a r2=%random%%%2+0
if %r1% == %r2% goto looop
SET blank=%r1%%r2%
:five
if "%x2%"=="5" (
for /l %%z in (1 +1 13) do set "b%%z=■"
set "b5=%blank%"
set "b9=%blank%"
)
if "%x4%"=="5" (
for /l %%z in (1 +1 13) do set "c%%z=■"
set "c5=%blank%"
set "c9=%blank%"
)
if "%x5%"=="5" (
for /l %%z in (1 +1 13) do set "d%%z=■"
set "d5=%blank%"
set "d9=%blank%"
)
if "%x7%"=="5" (
for /l %%z in (1 +1 13) do set "e%%z=■"
set "e5=%blank%"
set "e9=%blank%"
)
if "%x8%"=="5" (
for /l %%z in (1 +1 13) do set "f%%z=■"
set "f5=%blank%"
set "f9=%blank%"
)
:six
if "%x2%"=="6" (
for /l %%z in (1 +1 13) do set "b%%z=■"
set "b5=%blank%"
)
if "%x5%"=="6" (
for /l %%z in (1 +1 13) do set "d%%z=■"
set "d5=%blank%"
)
if "%x8%"=="6" (
for /l %%z in (1 +1 13) do set "f%%z=■"
set "f5=%blank%"
)
:seven
if "%x2%"=="7" (
for /l %%z in (1 +1 13) do set "b%%z=■"
set "b4=%blank%"
set "b6=%blank%"
set "b7=%blank%"
set "b9=%blank%"
set "b11=%blank%"
set "b12=%blank%"
)
if "%x5%"=="7" (
for /l %%z in (1 +1 13) do set "d%%z=■"
set "d4=%blank%"
set "d6=%blank%"
set "d7=%blank%"
set "d9=%blank%"
set "d11=%blank%"
set "d12=%blank%"
)
if "%x8%"=="7" (
for /l %%z in (1 +1 13) do set "f%%z=■"
set "f4=%blank%"
set "f6=%blank%"
set "f7=%blank%"
set "f9=%blank%"
set "f11=%blank%"
set "f12=%blank%"
)
:eight
if "%x2%"=="8" for /l %%z in (1 +1 13) do set "b%%z=■"
if "%x5%"=="8" for /l %%z in (1 +1 13) do set "d%%z=■"
if "%x8%"=="8" for /l %%z in (1 +1 13) do set "f%%z=■"
:nine
if "%x2%"=="9" (
for /l %%z in (1 +1 13) do set "b%%z=■"
set "b9=%blank%"
)
if "%x5%"=="9" (
for /l %%z in (1 +1 13) do set "d%%z=■"
set "d9=%blank%"
)
if "%x8%"=="9" (
for /l %%z in (1 +1 13) do set "f%%z=■"
set "f9=%blank%"
)
set z=0
:loop
set /a z=z+1
SET /a Q%z%=%random%%%2+0
if not %z% == 94 goto loop
cls
echo=
echo %Q1%%Q6%%a1%%a2%%a3%%Q17%%b1%%b2%%b3%%Q19%%Q23%%Q28%%Q31%%Q36%%Q42%%c1%%c2%%c3%%Q49%%d1%%d2%%d3%%Q59%%Q60%%Q64%%Q67%%Q70%%e1%%e2%%e3%%Q83%%f1%%f2%%f3%%Q6%%Q1%
echo %Q2%%Q7%%a4%%Q11%%Q13%%a5%%Q16%%b4%%Q20%%Q24%%b5%%Q32%%Q37%■%Q43%%Q46%%c4%%Q50%%Q52%%c5%%Q55%%d4%%Q61%%Q65%%d5%%Q71%%Q74%■%Q78%%e4%%Q84%%Q87%%e5%%Q90%%f4%%Q93%%Q94%%f5%%Q7%%Q2%
echo %Q3%%Q8%%a6%%a7%%a8%%Q15%%b6%%b7%%b8%%Q21%%Q25%%Q29%%Q33%%Q38%%Q44%%c6%%c7%%c8%%Q53%%d6%%d7%%d8%%Q62%%Q66%%Q68%%Q72%%Q75%%e6%%e7%%e8%%Q86%%f6%%f7%%f8%%Q8%%Q3%%Q%
echo %Q4%%Q9%%a9%%Q12%%Q14%%a10%%Q17%%b9%%Q22%%Q26%%b10%%Q34%%Q41%■%Q39%%Q47%%c9%%Q51%%Q54%%c10%%Q56%%d9%%Q63%%Q69%%d10%%Q76%%Q79%■%Q81%%e9%%Q88%%Q89%%e10%%Q91%%f9%%Q15%%Q16%%f10%%Q9%%Q4%
echo %Q5%%Q10%%a11%%a12%%a13%%Q18%%b11%%b12%%b13%%Q27%%Q30%%Q35%%Q40%%Q45%%Q48%%c11%%c12%%c13%%Q57%%d11%%d12%%d13%%Q73%%Q77%%Q80%%Q82%%Q85%%e11%%e12%%e13%%Q92%%f11%%f12%%f13%%Q10%%Q5%
goto top