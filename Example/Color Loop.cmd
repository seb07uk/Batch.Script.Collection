@echo off
:loop
set /a num=(%Random% %%9)+1
color %num%

pause
goto :loop