@echo off

:important delayed expansion to update variable values placed on the same line
setlocal enabledelayedexpansion

:window modd
MODE con: cols=17 lines=3
COLOR 4f

:/PROMPT for input
SET /P c=HH:mm OR Minutes:

:define an optional message
SET /P msg=message: || SET msg=""

:set window title
TITLE %msg%

:calculate seconds from input integer OR string
ECHO %c% | FINDSTR /C:":" >nul & IF ERRORLEVEL 1 (SET /a s=60*c) ELSE (SET "h=%c:~0,2%" && SET "m=%c:~2,3%" && SET /a "s=!h::=!*60*60+!m::=!*60")
:"%c:~0,2%": extract Hours string from /PROMPT input
:"%c:~2,3%": extract Minutes string from /PROMPT input
:"!h::=!": remove : from Hours string
:"!m::=!": remove : from Minutes string

:countdown with report
FOR /L %%a in (%s%,-1,1) do (
  ECHO %%a/%s%
  timeout 1 > NUL
:  PING -n 2 127.0.0.1 >NUL 2>&1
  CLS
)

:execute command with argument
CSCRIPT playsound.vbs "%msg%"

EXIT