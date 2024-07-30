@echo off
REM Vérifier si un message de commit a été fourni
if "%*"=="" (
    echo Veuillez fournir un message de commit.
    exit /b 1
)

REM Exécuter les commandes Git
git status
git add .
git commit -m "%*"
git push origin main
