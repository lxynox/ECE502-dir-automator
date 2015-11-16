:: turn on/off the echo on command line
@
ECHO off

:: Declared for user input interaction
SETLOCAL enabledelayedexpansion


:: welcome message to navigate user

ECHO Welcome to use me to create the right folder structure of ECE502 
ECHO on your local PC

 : )

:: let user create the title of HOMEWORK folder

:INIT_NAME
:: SET /P root_folder="First, name your NEW FOLDER (for e.g., homework1): "

:: SET /P assign_number="Second, tell me the number of assignments of this homework (for e.g., 5): "


:: IN CASE OF the app is not in C dir
C:

CD %USERPROFILE%\Desktop

:: 1-level root folder creation & enter
IF NOT EXIST ECE502_HWGENERATOR (
  MKDIR ECE502_HWGENERATOR  
) 
CD ECE502_HWGENERATOR



:: 2-level sub folder (homeworks folder) existance check and creation
IF EXIST !root_folder! (
  ECHO.
  :: 2 options decided by the user: RENAME OR DELETE
  :USER_CHOICE
  SET /P user_choice="The name you just chose already existed, choose to rename or delete the existing one? [type "r" or "d"]: "
  IF !user_choice! == r (
    ECHO.
    GOTO :INIT_NAME
  ) ELSE IF !user_choice! == d (
    RMDIR /S /Q !root_folder!
    MKDIR !root_folder!
  ) ELSE (
    ECHO. 
    ECHO Typing error, please re-type correctly
    GOTO :USER_CHOICE
  )
) ELSE (
  MKDIR !root_folder!
)
CD !root_folder!

:: iteratively creating new ASSIGNMENT dirs
FOR /L %%G IN ( 1,1,!assign_number! ) DO (
 
  :: create sub directory and create a new .docx file in it
  MKDIR assignment%%G
  CD assignment%%G 
  TYPE NUL > problem%%G.docx
  
  :: go back to upper-level folder
  CD ..
)

:: check to exit or continue
ECHO.
ECHO You're all set! Check your Desktop for delivered artifact please!
SET /P toExit="Exit or Continue making new homework directories? [type "e" or "c"]: "
IF !toExit! == e (
  EXIT 
) ELSE (
  FOR /L %%G IN (1,1,5) DO ECHO. 
  SET /P root_folder="First, name your NEW FOLDER (for e.g., homework1): "

  SET /P assign_number="Second, tell me the number of assignments of this homework (for e.g., 5): "
  GOTO :INIT_NAME
)
	