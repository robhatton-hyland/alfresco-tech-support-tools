@echo off
setlocal enableextensions enabledelayedexpansion
set count=0
set checkdockerrunningcount=0
set isdockerrunning=0
set filename=""
set projectname=""
set displayName=""
set ACS="ACS v"


:
:: Read in files
for /f "delims=" %%x in ('dir /b /ogd .\KB-Support\*.yml') do (
    set /a count=count+1
    set choice[!count!]=%%x
	for %%y in (!count!) do set "displayChoice[%%y]=!choice[%%y]:%cd%\=!" & set "displayChoice[%%y]=!displayChoice[%%y]:-docker-compose.yml=%!" 
    for %%y in (!count!) do echo !choice[%%y]! & set "choice[%%y]=KB-Support\!choice[%%y]:%cd%\=!"
	
)

for /f "delims=" %%x in ('dir /b /ogd .\Limited-Support\*.yml') do (
    set /a count=count+1
    set choice[!count!]=%%x
	for %%y in (!count!) do set "displayChoice[%%y]=!choice[%%y]:%cd%\=!" & set "displayChoice[%%y]=!displayChoice[%%y]:-docker-compose.yml=%!"
    for %%y in (!count!) do echo !choice[%%y]! & set "choice[%%y]=Limited-Support\!choice[%%y]:%cd%\=!"
)

for /f "delims=" %%x in ('dir /b /ogd *.yml') do (
    set /a count=count+1
    set choice[!count!]=%%x
	for %%y in (!count!) do set "displayChoice[%%y]=!choice[%%y]:%cd%\=!" & set "displayChoice[%%y]=!displayChoice[%%y]:-docker-compose.yml=%!"
    for %%y in (!count!) do echo !choice[%%y]! & set "choice[%%y]=!choice[%%y]:%cd%\=!"
)

:listYML
:: Print list of files

cls
echo.
echo Found !count! Docker Compose Environments: 
echo.
for /l %%x in (1,1,!count!) do (
     ::echo  [%%x] !choice[%%x]!
	 echo  [%%x] ACS v!displayChoice[%%x]!
)
echo  [q] quit
echo.
:: Retrieve User input
set /p select=Please pick a version from 1 to !count! above:
echo.
GOTO :validateSelection

:validateSelection
IF %select% EQU q GOTO :EOF
IF %select% EQU Q GOTO :EOF
IF %select% EQU 0 GOTO listYML
SET /A UserInputVal="%select%"*1
IF %UserInputVal% GTR 0 ( IF %UserInputVal% LEQ !count! ( goto checkDockerRunning ) )
IF %UserInputVal% EQU 0 goto listYMLerror

:checkDockerRunning
set /a checkdockerrunningcount=checkdockerrunningcount+1
tasklist /fi "ImageName eq Docker Desktop.exe" /fo csv 2>NUL | find /I /N "Docker Desktop.exe">NUL
if "%ERRORLEVEL%"=="0" set /a isdockerrunning=1 & net stop winnat >nul 2>&1 & net start winnat >nul 2>&1 & GOTO runYML
if "%ERRORLEVEL%"=="1" echo Waiting 30 seconds to start docker desktop & "C:\Program Files\Docker\Docker\Docker Desktop.exe" & timeout 30 /nobreak

:: run docker compose 
:runYML
cls
set projectname=!choice[%select%]!
set "projectname=%projectname:\=" & set "projectname=%"
set filename=%projectname%
set "projectname=%projectname:-docker-compose.yml=%"
set "projectname=%projectname:.=_%"
set "projectname=%projectname:_n=%"
set "projectname=acs-v%projectname%"
FOR /F "usebackq tokens=*" %%A IN (`powershell.exe -Command "('%projectname%').ToLower( )"`) DO SET projectname=%%A
::echo You chose !filename!
echo Preparing ACS v!displayChoice[%select%]!
:: Print out selected filename
::type !choice[%select%]!
if !isdockerrunning! NEQ 1 (if !checkdockerrunningcount! GTR 2 (echo Problem starting docker desktop & pause & GOTO :EOF) )
if !isdockerrunning! NEQ 1 (if !checkdockerrunningcount! LEQ 2 (GOTO checkDockerRunning) )
echo Stopping currently running docker containers. Please wait.
FOR /f "tokens=*" %%i IN ('docker ps -q') DO docker --log-level error stop %%i >nul 2>&1
echo Created project named !projectname!
echo Removing any other instances of !projectname!
docker --log-level error compose rm !projectname! >nul 2>&1
echo Building !projectname!
docker --log-level error compose -f !choice[%select%]! build --no-cache
echo Starting !projectname!
docker --log-level error compose -f !choice[%select%]! -p !projectname! up -d
echo.
timeout 30 /nobreak
echo ACS v!displayChoice[%select%]! should now be running.
echo.
echo Would you like to open a browser at the default URLs for ACS? (Default 'No')
echo This request will timeout in 15 seconds if no answer is provided
choice /t 15 /C yn /D n /M "Open browser (Y/N)?"
if errorlevel 2 goto :EOF
if errorlevel 2 goto :openBrowser

:openBrowser
start "Alfresco" http://localhost:8080/alfresco
start "Alfresco" http://localhost:8080/share
start "Alfresco" http://localhost:8080/workspace
echo Complete!
timeout 30 
goto :EOF

:listYMLerror
:: Print list of files
cls
echo.
echo Found !count! Docker Compose Environments: 
echo.
for /l %%x in (1,1,!count!) do (
     echo  [%%x] !choice[%%x]!
)
echo  [q] quit
echo.
echo Selection was invalid
echo.
:: Retrieve User input
set /p select=Please pick a version from 1 to !count! above:
echo.
GOTO :validateSelection

