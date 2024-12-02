@echo off
setlocal enableextensions enabledelayedexpansion

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/robhatton-hyland/alfresco-tech-support-tools/refs/heads/release/scripts/script_runner.bat -OutFile ./script_runner.bat"
echo Downloaded script_runner.bat

call script_runner.bat
