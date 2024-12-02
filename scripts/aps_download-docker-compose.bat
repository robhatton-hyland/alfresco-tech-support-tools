@echo off

echo Deleting previous APS Docker Compose Files

rmdir /S /Q "./APS"

echo Downloading Docker Compose Files

mkdir "APS"
mkdir "./APS/KB-Support"
mkdir "./APS/Limited-Support"
echo.

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/1.9.N-compose.yaml -OutFile ./APS/KB-Support/1.9.N-compose.yaml"
echo Downloaded APS v1.9

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/1.10.N-compose.yaml -OutFile ./APS/KB-Support/1.10.N-compose.yaml"
echo Downloaded APS v1.10

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/1.11.N-compose.yaml -OutFile ./APS/KB-Support/1.11.N-compose.yaml"
echo Downloaded APS v1.11

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/2.0.N-compose.yaml -OutFile ./APS/KB-Support/2.0.N-compose.yaml"
echo Downloaded APS v2.0

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/2.1.N-compose.yaml -OutFile ./APS/Limited-Support/2.1.N-compose.yaml"
echo Downloaded APS v2.1

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/2.2.N-compose.yaml -OutFile ./APS/Limited-Support/2.2.N-compose.yaml"
echo Downloaded APS v2.2

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/2.3.N-compose.yaml -OutFile ./APS/Limited-Support/2.3.N-compose.yaml"
echo Downloaded APS v2.3

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/2.4.N-compose.yaml -OutFile ./APS/2.4.N-compose.yaml"
echo Downloaded APS v2.4

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/24.1.N-compose.yaml -OutFile ./APS/24.1.N-compose.yaml"
echo Downloaded APS v24.1

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/24.1.N-compose.yaml -OutFile ./APS/24.1.N-compose.yaml"
echo Downloaded APS v24.1

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/24.2.N-compose.yaml -OutFile ./APS/24.2.N-compose.yaml"
echo Downloaded APS v24.2

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/24.3.N-compose.yaml -OutFile ./APS/24.3.N-compose.yaml"
echo Downloaded APS v24.3

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/Release/aps-deployment/24.4.N-compose.yaml -OutFile ./APS/24.4.N-compose.yaml"
echo Downloaded APS v24.4
