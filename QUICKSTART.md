# 🚀 Quick Start Guide

## Prerequisites

Before starting the project, ensure:

- ✅ Node.js (v16+) and npm installed
- ✅ MongoDB Atlas account and connection string
- ✅ `.env` files configured in backend and frontend directories
- ✅ Dependencies installed: `npm run install-all`

---

## Starting the Project

### Option 1: Using Startup Scripts (Easiest)

#### Windows

```bash
# Double-click START.bat in the project root
# OR run from command prompt:
START.bat
```

This will:
- Check dependencies and environment files
- Open backend server in new window (http://localhost:5000)
- Open frontend server in new window (http://localhost:5173)
- Show startup status and instructions

#### Mac / Linux

```bash
# Make script executable (first time only)
chmod +x start.sh

# Run the startup script
./start.sh
```

---

### Option 2: Manual - Two Terminal Windows (Recommended for Development)

#### Terminal 1 - Backend

```bash
cd backend
npm start
```

**Expected output:**
```
> server@1.0.0 start
> nodemon server.js

[nodemon] 2.0.22 running...
[nodemon] to restart at any time, enter `rs`
[nodemon] watching path(s): *.*
[nodemon] watching extensions: js,json

Server running at http://localhost:5000
Connected to MongoDB
```

#### Terminal 2 - Frontend

```bash
cd frontend
npm start
```

**Expected output:**
```
> frontend@0.0.1 start
> vite

  VITE v4.4.x  ready in xxx ms

  ➜  Local:   http://localhost:5173/
  ➜  press h to show help
```

---

### Option 3: Root npm Script (if configured)

From the project root:

```bash
npm run dev
```

> Note: This requires `npm run dev` to be configured in the root `package.json` to start both services.

---

## Verify Everything is Running

### Check Backend API

```bash
curl http://localhost:5000

# Or open in browser:
# http://localhost:5000
```

Expected response: API status or welcome message

### Check Frontend

Open browser and navigate to:

```
http://localhost:5173
```

You should see the login page.

---

## Login to the Application

Use any of these default credentials (after seeding):

| Role      | Email                 | Password          |
|-----------|----------------------|-------------------|
| Admin     | admin@school.edu     | Admin@2024Secure! |
| Teacher   | wilson@school.edu    | Teacher@2024Secure! |
| Student   | emma.j@student.edu   | Student@2024Secure! |

> **Note:** If you haven't seeded the database yet, run:
>
> ```bash
> cd backend
> npm run seed
> ```

---

## Troubleshooting

### Backend won't start

**Problem:** `Port 5000 already in use`

```bash
# Find process using port 5000
netstat -ano | findstr :5000

# Kill the process (Windows)
taskkill /PID <PID> /F

# Or use a different port in .env
PORT=5001
```

### Frontend won't start

**Problem:** `Port 5173 already in use`

```bash
# Find process using port 5173
netstat -ano | findstr :5173

# Kill the process (Windows)
taskkill /PID <PID> /F
```

### MongoDB connection error

**Problem:** `Cannot connect to MongoDB`

Check your `backend/.env`:

```env
# Should look like:
MONGO_URI=mongodb+srv://username:password@cluster.mongodb.net/student_management?retryWrites=true&w=majority
```

Verify:
- ✅ Connection string is correct
- ✅ IP is whitelisted in MongoDB Atlas
- ✅ Database name is `student_management`

### Module not found errors

```bash
# Reinstall dependencies
cd backend && npm install
cd ../frontend && npm install
```

### Clear cache and restart

```bash
# Stop both servers (Ctrl+C in each terminal)

# Clear caches
npm cache clean --force
rm -rf backend/node_modules frontend/node_modules

# Reinstall
npm run install-all

# Start again
npm start  # or use START.bat / start.sh
```

---

## Development Workflow

### Hot Module Reloading (HMR)

Both servers support live reload:

- **Backend:** Changes to `.js` files auto-reload via nodemon
- **Frontend:** Changes to `.jsx`, `.css` files hot-reload instantly

Just save and you'll see changes immediately!

### File Structure During Development

```
project-root/
├── backend/          # Express API
│   ├── server.js     (main server file)
│   ├── controllers/
│   ├── models/
│   ├── routes/
│   └── .env          (your MongoDB URI and secrets)
├── frontend/         # React SPA
│   ├── src/
│   ├── public/
│   └── .env          (VITE_API_URL=http://localhost:5000)
├── START.bat         (Windows startup)
└── start.sh          (Unix/Linux startup)
```

---

## Accessing the Application

Once both servers are running:

- **Frontend:** `http://localhost:5173`
- **Backend API:** `http://localhost:5000`
- **API Docs:** Check `docs/API_DOCS.md`

---

## Stopping the Servers

### From Startup Script

- Windows: Close the terminal windows
- Mac/Linux: Press `Ctrl+C` in the terminal

### From Manual Terminals

In each terminal, press `Ctrl+C` to stop the server.

---

## Next Steps

- 📚 Read `COMMANDS.md` for all available commands
- 📖 Check `docs/USER_MANUAL.md` for role-specific features
- 🧪 Run tests: `cd backend && npm test`
- 🔍 Check logs for any errors or warnings

---

## Common Tasks

### Seed the database with test data

```bash
cd backend
npm run seed
```

### Run linting

```bash
# Backend
cd backend
npm run lint

# Frontend
cd frontend
npm run lint
```

### Build for production

```bash
cd frontend
npm run build

# Output will be in frontend/dist/
```

### View API documentation

See `docs/API_DOCS.md` for complete API reference.

---

## Getting Help

If you encounter issues:

1. Check `TROUBLESHOOTING.md` in docs
2. Review the terminal output for error messages
3. Verify `.env` configuration
4. Check MongoDB Atlas connection
5. Ensure ports 5000 and 5173 are available

---

**Happy coding! 🎉**
