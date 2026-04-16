@echo off
REM MERN Student Management System - Startup Script

echo.
echo ======================================
echo   MERN Student Management System
echo   Startup Script
echo ======================================
echo.

REM Check if backend node_modules exist
if not exist "backend\node_modules" (
    echo.
    echo [ERROR] Backend dependencies not installed!
    echo Run: npm install in the backend directory
    echo.
    pause
    exit /b 1
)

REM Check if frontend node_modules exist
if not exist "frontend\node_modules" (
    echo.
    echo [ERROR] Frontend dependencies not installed!
    echo Run: npm install in the frontend directory
    echo.
    pause
    exit /b 1
)

REM Check if backend .env exists
if not exist "backend\.env" (
    echo.
    echo [ERROR] Backend .env file not found!
    echo Create backend\.env with your MongoDB URI and JWT secrets
    echo.
    pause
    exit /b 1
)

REM Check if frontend .env exists
if not exist "frontend\.env" (
    echo.
    echo [WARNING] Frontend .env file not found!
    echo Creating with default VITE_API_URL...
    echo VITE_API_URL=http://localhost:5000 > frontend\.env
)

echo [✓] All dependencies installed
echo [✓] Environment files configured
echo.
echo ======================================
echo   Starting Services
echo ======================================
echo.
echo Backend will start on:  http://localhost:5000
echo Frontend will start on: http://localhost:5173
echo.
echo Press any key to continue...
echo.
pause

REM Start backend in a new window
echo Starting backend server...
start "Backend - MERN SMS" cmd /k "cd backend && npm start"

REM Wait a moment for backend to start
timeout /t 3 /nobreak

REM Start frontend in a new window
echo Starting frontend server...
start "Frontend - MERN SMS" cmd /k "cd frontend && npm start"

echo.
echo ======================================
echo   ✓ Both servers are starting!
echo ======================================
echo.
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:5173
echo.
echo To stop the servers, close the terminal windows.
echo.
pause
