#!/bin/bash

# MERN Student Management System - Startup Script

echo ""
echo "======================================"
echo "  MERN Student Management System"
echo "  Startup Script"
echo "======================================"
echo ""

# Check if backend node_modules exist
if [ ! -d "backend/node_modules" ]; then
    echo ""
    echo "[ERROR] Backend dependencies not installed!"
    echo "Run: npm install in the backend directory"
    echo ""
    exit 1
fi

# Check if frontend node_modules exist
if [ ! -d "frontend/node_modules" ]; then
    echo ""
    echo "[ERROR] Frontend dependencies not installed!"
    echo "Run: npm install in the frontend directory"
    echo ""
    exit 1
fi

# Check if backend .env exists
if [ ! -f "backend/.env" ]; then
    echo ""
    echo "[ERROR] Backend .env file not found!"
    echo "Create backend/.env with your MongoDB URI and JWT secrets"
    echo ""
    exit 1
fi

# Check if frontend .env exists
if [ ! -f "frontend/.env" ]; then
    echo ""
    echo "[WARNING] Frontend .env file not found!"
    echo "Creating with default VITE_API_URL..."
    echo "VITE_API_URL=http://localhost:5000" > frontend/.env
fi

echo "[✓] All dependencies installed"
echo "[✓] Environment files configured"
echo ""
echo "======================================"
echo "  Starting Services"
echo "======================================"
echo ""
echo "Backend will start on:  http://localhost:5000"
echo "Frontend will start on: http://localhost:5173"
echo ""
echo "Press Ctrl+C to stop both servers"
echo ""

# Start backend in the background
echo "Starting backend server..."
(cd backend && npm start) &
BACKEND_PID=$!

# Wait a moment for backend to start
sleep 3

# Start frontend in the background
echo "Starting frontend server..."
(cd frontend && npm start) &
FRONTEND_PID=$!

echo ""
echo "======================================"
echo "  ✓ Both servers are starting!"
echo "======================================"
echo ""
echo "Backend:  http://localhost:5000"
echo "Frontend: http://localhost:5173"
echo ""
echo "Backend PID:  $BACKEND_PID"
echo "Frontend PID: $FRONTEND_PID"
echo ""
echo "To stop the servers, press Ctrl+C or run:"
echo "  kill $BACKEND_PID"
echo "  kill $FRONTEND_PID"
echo ""

# Wait for both processes
wait
