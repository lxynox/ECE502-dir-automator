:: turn on/off the echo on command line
@ECHO OFF
:: Declared for user input interaction
SETLOCAL enabledelayedexpansion




:: WELCOME MESSAGE
ECHO Welcome to use me to create the right folder structure of ECE502 
ECHO on your local PC

 : )



:: uSER DEFINED FOLDER_NAME AND #ASSIGNMENTS
:INIT_NAME
ECHO.
SET /P root_folder="First, name your NEW FOLDER (for e.g., homework1): "

SET /P assign_number="Second, tell me the number of assignments of this homework (for e.g., 5): "





:: IMAGE PREPARATION & OS ENVIRONMENT CONFIGURATION
:: add python to path
SET path=C:\Python27;%path%
ECHO.
ECHO Please ensure the image folder is filled with .jpg images you want to insert into MS Word
ECHO Just name them as 1.jpg, 2.jpg ... N.jpg mapped to pr1, pr2, ... , prN accordingly
ECHO.
PAUSE
CD util 
IF EXIST "lxml_py27.exe" (
  lxml_py27
  DEL /S /Q lxml_py27.exe
)
:: REVISE THE PATH OF SCRIPT RUNNING PATH ON DEMAND 
CD ..
::CHDIR
SET current_workdir= %CD%



:: FOLDER STRUCTURE CREATOR 
:: ensure swiched to C disk to use "cd" under C disk
C:

CD %USERPROFILE%\Desktop

:: root-level folder creation & cd
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
  
:: Kill all the error messages if exists
  PYTHON %current_workdir%\util\python-docx-0.8.5\MAIN_DEMO.py %current_workdir% %%G.jpg >nul 2>nul
  move %current_workdir%\Problem%%G.docx .
  IF NOT EXIST Problem%%G.docx TYPE NUL > Problem%%G.docx
  Javac >nul 2>nul
  :: go back to upper-level folder
  CD ..
)



:: EXIT OR CONTINUE CHECK 
ECHO.
ECHO You're all set! Check your Desktop for delivered artifact please!
SET /P toExit="Exit or Continue making new homework directories? [type "e" or "c"]: "
IF !toExit! == e (
  EXIT 
) ELSE (
  FOR /L %%G IN (1,1,5) DO ECHO.
  :: ECHO %current_workdir%
  %current_workdir:~0,2%: 
  CD %current_workdir%
  GOTO :INIT_NAME
)
	
