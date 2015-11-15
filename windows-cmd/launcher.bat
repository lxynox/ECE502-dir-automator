@echo off
SETLOCAL enabledelayedexpansion

ECHO Input Hint: enter 2 inputs seperated by coma (like a, b)
SET /P input_str="Please enter the [folder_name, #assignments] : " 

:: user input validation
FOR /F "tokens=1,2 delims=," %%a in ("!input_str!") DO (
  SET root_folder=%%a
:: trim first parameter
  SET root_folder=!root_folder: =! 
  SET /a "assign_number=%%b"
)

:: PAUSE
ECHO.
folder_creator