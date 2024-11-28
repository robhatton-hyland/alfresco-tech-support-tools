@echo off
echo Deleting previous Docker Compose Files
echo.

del /q /f "*.yml"

rmdir /S /Q "KB-Support"
rmdir /S /Q "Limited-Support"

echo Downloading Docker Compose Files

mkdir "KB-Support"
mkdir "Limited-Support"

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alfresco/acs-deployment/1.0.10/docker-compose/docker-compose.yml -OutFile ./KB-Support/6.0.N-docker-compose.yml"
echo Downloaded ACS v6.0
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alfresco/acs-deployment/refs/tags/2.1.6/docker-compose/docker-compose.yml -OutFile ./KB-Support/6.1.N-docker-compose.yml"
echo Downloaded ACS v6.1
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alfresco/acs-deployment/refs/tags/v5.3.0/docker-compose/6.2.N-docker-compose.yml -OutFile ./KB-Support/6.2.N-docker-compose.yml"
echo Downloaded ACS v6.2
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alfresco/acs-deployment/refs/tags/v8.0.1/docker-compose/7.0.N-docker-compose.yml -OutFile ./KB-Support/7.0.N-docker-compose.yml"
echo Downloaded ACS v7.0
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alfresco/acs-deployment/refs/tags/v8.5.2/docker-compose/7.1.N-docker-compose.yml -OutFile ./Limited-Support/7.1.N-docker-compose.yml"
echo Downloaded ACS v7.1
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alfresco/acs-deployment/refs/tags/v8.5.2/docker-compose/7.2.N-docker-compose.yml -OutFile ./Limited-Support/7.2.N-docker-compose.yml"
echo Downloaded ACS v7.2
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alfresco/acs-deployment/refs/tags/v8.5.2/docker-compose/7.3.N-docker-compose.yml -OutFile 7.3.N-docker-compose.yml"
echo Downloaded ACS v7.3
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alfresco/acs-deployment/refs/tags/v8.5.2/docker-compose/7.4.N-docker-compose.yml -OutFile 7.4.N-docker-compose.yml"
echo Downloaded ACS v7.4
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alfresco/acs-deployment/refs/tags/v7.0.3/docker-compose/docker-compose.yml -OutFile 23.1.N-docker-compose.yml"
echo Downloaded ACS v23.1
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alfresco/acs-deployment/refs/tags/v8.3.0/docker-compose/docker-compose.yml -OutFile 23.2.N-docker-compose.yml"
echo Downloaded ACS v23.2
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alfresco/acs-deployment/refs/tags/v8.5.2/docker-compose/docker-compose.yml -OutFile 23.3.N-docker-compose.yml"
echo Downloaded ACS v23.3
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Alfresco/acs-deployment/refs/tags/v8.5.2/docker-compose/pre-release-docker-compose.yml -OutFile 23.4.0.M1-docker-compose.yml"
echo Downloaded ACS v23.4-M1

:EOF
