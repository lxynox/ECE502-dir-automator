SETLOCAL enabledelayedexpansion
:: turn on/off the echo on command line
ECHO ON

:: welcome message to navigate user
ECHO Welcome to use me to create the right folder structure of ECE502 on your local PC

:: let user create the title of their folder
SET /p root_folder="First, give your NEW FOLDER a name (like homework1): "
SET /p node_folder_number="Second, tell me how many assignments do you have for this homework: "
ECHO
ECHO Wait a while, the rest counts on me, and check your Desktop for the delivered artifact please

CD %USERPROFILE%/
MKDIR ECE502_HWGENERATOR
MKDIR !root_folder!
FOR /L %%G IN ( 1,1,!node_folder_number! ) (
  DO MKDIR assignment%GG
  :: enter the new made node_folder
  CD Assignment%%GG
  TYPE NUL > problem%%GG.docx
)

