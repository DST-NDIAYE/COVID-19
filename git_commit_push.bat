@echo off
setlocal enabledelayedexpansion

REM Vérifier si un message de commit a été fourni
if "%~1"=="" (
    echo Veuillez fournir un message de commit.
    exit /b 1
)

REM Construire le message de commit à partir de tous les arguments
set "commit_message="
:loop
if "%~1"=="" goto after_loop
set "commit_message=!commit_message! %~1"
shift
goto loop
:after_loop

REM Supprimer l'espace initial
set "commit_message=%commit_message:~1%"

REM Exécuter les commandes Git
git status
git add .
git commit -m "%commit_message%"
git push origin main
