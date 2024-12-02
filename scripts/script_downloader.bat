@echo off

echo Downloading scripts
echo.

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/scripts/acs_download-docker-compose.bat -OutFile ./acs_download-docker-compose.bat"
echo Downloaded acs_download-docker-compose.bat

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/scripts/acs_run.bat -OutFile ./acs_run.bat"
echo Downloaded acs_run.bat

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/scripts/aps_download-docker-compose.bat -OutFile ./aps_download-docker-compose.bat"
echo Downloaded aps_download-docker-compose.bat

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/scripts/aps_run.bat -OutFile ./aps_run.bat"
echo Downloaded aps_run.bat
