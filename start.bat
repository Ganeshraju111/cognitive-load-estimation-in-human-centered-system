@echo off
setlocal enabledelayedexpansion
title MindGauge
color 0B

:MENU
cls
echo ===================================================
echo               MindGauge Dashboard
echo ===================================================
echo.
echo   1. Quick Install (First time setup)
echo   2. Run Project
echo   3. Install ^& Run
echo   4. Exit
echo.
set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" goto INSTALL
if "%choice%"=="2" goto RUN
if "%choice%"=="3" goto INSTALL_RUN
if "%choice%"=="4" goto :EOF
goto MENU

:CHECK_NODE
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    color 0C
    echo [ERROR] Node.js is not installed!
    echo MindGauge requires Node.js to run on this PC.
    echo Please download and install it from: https://nodejs.org/
    echo.
    pause
    exit /b 1
)
exit /b 0

:INSTALL
cls
echo ===================================================
echo               Installing Dependencies
echo ===================================================
echo.
call :CHECK_NODE
if %ERRORLEVEL% neq 0 goto MENU

echo Running npm install...
call npm install
echo.
if %ERRORLEVEL% neq 0 (
    color 0C
    echo [ERROR] Failed to install dependencies.
) else (
    echo [OK] Dependencies installed successfully.
)
pause
goto MENU

:RUN
cls
echo ===================================================
echo               Starting Development Server
echo ===================================================
echo.
call :CHECK_NODE
if %ERRORLEVEL% neq 0 goto MENU

if not exist "node_modules" (
    color 0E
    echo [WARNING] node_modules folder missing.
    echo Please run the installer first!
    echo.
    pause
    goto MENU
)

echo Access the app at: http://localhost:5000
echo Press Ctrl+C to stop the server at any time
echo.
cd client
call npm run dev
cd ..
pause
goto MENU

:INSTALL_RUN
cls
echo ===================================================
echo            Installing ^& Starting
echo ===================================================
echo.
call :CHECK_NODE
if %ERRORLEVEL% neq 0 goto MENU

echo [Step 1/2] Running npm install...
call npm install
echo.
if %ERRORLEVEL% neq 0 (
    color 0C
    echo [ERROR] Installation failed. Aborting start.
    pause
    goto MENU
)

echo [Step 2/2] Starting server...
echo Access the app at: http://localhost:5000
echo.
cd client
call npm run dev
cd ..
pause
goto MENU


