@echo off
setlocal enableextensions enabledelayedexpansion

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/scripts/script_downloader.bat -OutFile ./script_downloader.bat"
echo Downloaded script_downloader.bat

call script_downloader.bat
cls

:listMenu
echo.
   echo  [1] ACS
   echo  [2] APS
echo.
   echo  [q] quit
echo.

:: Retrieve User input
set /p select=Please pick from above:
echo.
GOTO :validateSelection

:validateSelection
IF %select% EQU q GOTO :EOF
IF %select% EQU Q GOTO :EOF
IF %select% EQU 0 GOTO listMenuError
SET /A UserInputVal="%select%"*1
IF %UserInputVal% GTR 0 ( IF %UserInputVal% LEQ 2 ( goto Run ) )
IF %UserInputVal% EQU 0 goto listMenuError

:Run
IF %select% EQU 1 ( call acs_download-docker-compose.bat & echo. & call acs_run.bat) 
IF %select% EQU 1 ( call aps_download-docker-compose.bat & echo. & call aps_run.bat) 

:listMenuError
echo.
	 echo  [1] ACS
   echo  [2] APS
echo.
   echo  [q] quit
echo.

:: Retrieve User input
set /p select=Please pick from above:
echo.
GOTO :validateSelection
