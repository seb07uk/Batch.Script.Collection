:: Sebastian Januchowski
:: polsoft.ITS London
:: polsoft.its@fastservice.com
@echo off
title Number Guessing Game by polsoft.ITS
setlocal enabledelayedexpansion
echo    [2m[3mWritten by Sebastian Januchowski                  polsoft.ITS                   e-mail: polsoft.its@fastservice.com
echo.[0m

set /a target=%random% %% 100 + 1
set attempts=0

echo Welcome %username% to the Number Guessing Game.
echo I'm thinking of a number between 1 and 100.
echo.
:guess
set /p "guess=Enter your guess: "
set /a attempts+=1
echo.
if !guess! equ %target% (
    echo [7m[33mCongratulations. You guessed the number on your !attempts! try.[0m
	echo.
    goto end
) else if !guess! lss %target% (
    echo Too low! Try again.
) else (
    echo Too high! Try again.
)
goto guess

:end
echo Thanks for playing.
echo.
echo [6mPress any key to exit the game...[0m
pause >nul