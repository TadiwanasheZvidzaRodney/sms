# Project Commands Reference

Complete guide to all commands for setting up and running the MERN Student Management System.

---

## Table of Contents

1. [Initial Setup](#initial-setup)
2. [Development](#development)
3. [Backend Commands](#backend-commands)
4. [Frontend Commands](#frontend-commands)
5. [Database & Seeding](#database--seeding)
6. [Testing](#testing)
7. [Linting & Code Quality](#linting--code-quality)
8. [Git Commands](#git-commands)
9. [Production Deployment](#production-deployment)
10. [Troubleshooting Commands](#troubleshooting-commands)

---

## Initial Setup

### Clone the Repository

```bash
git clone https://github.com/TadiwanasheZvidzaRodney/sms.git
cd mern-student-management
```

### Install All Dependencies

From the **project root**:

```bash
npm run install-all
```

Or manually:

```bash
# Install backend dependencies
cd backend
npm install
cd ..

# Install frontend dependencies
cd frontend
npm install
cd ..
```

### Configure Environment Variables

#### Backend

```bash
cd backend
cp .env.example .env
```

Edit `backend/.env` and set:

```env
# MongoDB
MONGO_URI=mongodb+srv://<username>:<password>@<cluster>.mongodb.net/student_management?retryWrites=true&w=majority

# JWT Secrets
JWT_SECRET=your_jwt_secret_key_here
JWT_REFRESH_SECRET=your_refresh_secret_key_here

# AWS S3
AWS_ACCESS_KEY_ID=your_aws_access_key
AWS_SECRET_ACCESS_KEY=your_aws_secret_key
AWS_S3_BUCKET=your_bucket_name
AWS_REGION=us-east-1

# Server
PORT=5000
NODE_ENV=development

# Client Config
CLIENT_URL=http://localhost:5173
```

#### Frontend

```bash
cd frontend
cp .env.example .env
```

Edit `frontend/.env` and set:

```env
VITE_API_URL=http://localhost:5000
```

---

## Development

### Start All Services (Backend + Frontend)

From the **project root** (if configured):

```bash
npm run dev
```

### Start Backend Only

```bash
cd backend
npm run dev
```

The API will be available at `http://localhost:5000`

### Start Frontend Only

```bash
cd frontend
npm run dev
```

The app will be available at `http://localhost:5173`

### Start Both Services Separately (Recommended for Development)

Terminal 1 - Backend:

```bash
cd backend
npm run dev
```

Terminal 2 - Frontend:

```bash
cd frontend
npm run dev
```

---

## Backend Commands

### Start Development Server

```bash
cd backend
npm run dev
```

Uses **nodemon** for auto-reload on file changes.

### Run Tests

```bash
cd backend
npm test
```

### Seed Database

```bash
cd backend
npm run seed
```

This command:
- Connects to MongoDB using `MONGO_URI`
- Resets and creates all collections
- Seeds sample data for all 6 roles
- Creates indexes

### Lint Backend Code

```bash
cd backend
npm run lint
```

### Fix Linting Issues

```bash
cd backend
npm run lint:fix
```

---

## Frontend Commands

### Start Development Server

```bash
cd frontend
npm run dev
```

The Vite dev server will start at `http://localhost:5173` with HMR enabled.

### Build for Production

```bash
cd frontend
npm run build
```

Creates optimized production bundle in `frontend/dist/`.

### Preview Production Build

```bash
cd frontend
npm run preview
```

Serves the production build locally for testing.

### Lint Frontend Code

```bash
cd frontend
npm run lint
```

### Fix Linting Issues

```bash
cd frontend
npm run lint:fix
```

---

## Database & Seeding

### Connect to MongoDB Atlas

Verify connection with MongoDB CLI:

```bash
mongosh "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/student_management"
```

### Seed Database

```bash
cd backend
npm run seed
```

### Check Seeded Data

```bash
cd backend
npm run seed
```

View default logins in `README.md`.

### View Collections

In MongoDB Atlas or mongosh:

```javascript
show dbs
use student_management
show collections
db.users.find().pretty()
```

### Clear Specific Collection

```javascript
use student_management
db.users.deleteMany({})
```

---

## Testing

### Run All Backend Tests

```bash
cd backend
npm test
```

### Run Tests in Watch Mode

```bash
cd backend
npm test -- --watch
```

### Run Specific Test File

```bash
cd backend
npm test -- tests/auth.test.js
```

### Run Tests with Coverage

```bash
cd backend
npm test -- --coverage
```

---

## Linting & Code Quality

### Check Code Quality

Backend:

```bash
cd backend
npm run lint
```

Frontend:

```bash
cd frontend
npm run lint
```

### Fix All Linting Issues

Backend:

```bash
cd backend
npm run lint:fix
```

Frontend:

```bash
cd frontend
npm run lint:fix
```

### Bypass Pre-commit Hooks

If linting checks are blocking commits:

```bash
git commit -m "your message" --no-verify
```

---

## Git Commands

### Check Status

```bash
git status
```

### Stage Changes

```bash
# Stage specific file
git add path/to/file

# Stage all changes
git add .
```

### Commit Changes

```bash
git commit -m "type: description"

# Example: chore: update .gitignore
# Example: feat: add new authentication feature
# Example: fix: resolve login redirect issue
```

### Push to GitHub

```bash
# Push to main branch
git push origin main

# Push to feature branch
git push origin feature-name
```

### Pull Latest Changes

```bash
git pull origin main
```

### Create New Branch

```bash
git checkout -b feature/your-feature-name
```

### View Commit History

```bash
git log --oneline -10
```

### Check Remote

```bash
git remote -v
```

---

## Production Deployment

### Build Frontend

```bash
cd frontend
npm run build
```

Output: `frontend/dist/`

### Build and Run Backend

```bash
cd backend
npm install --production
NODE_ENV=production npm start
```

### Environment Variables for Production

Set in `.env` or system environment:

```env
NODE_ENV=production
MONGO_URI=your_production_mongodb_uri
JWT_SECRET=your_production_jwt_secret
JWT_REFRESH_SECRET=your_production_refresh_secret
AWS_ACCESS_KEY_ID=your_aws_key
AWS_SECRET_ACCESS_KEY=your_aws_secret
AWS_S3_BUCKET=your_production_bucket
CLIENT_URL=https://your-domain.com
PORT=5000
```

### Deploy to Heroku (Backend)

```bash
# Login to Heroku
heroku login

# Create app
heroku create your-app-name

# Set environment variables
heroku config:set MONGO_URI=your_uri JWT_SECRET=your_secret ...

# Push code
git push heroku main
```

### Deploy to Vercel (Frontend)

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel
```

Configure environment variables in Vercel dashboard.

---

## Troubleshooting Commands

### Check if Ports are in Use

```bash
# Check port 5000 (backend)
netstat -ano | findstr :5000

# Check port 5173 (frontend)
netstat -ano | findstr :5173

# Kill process on port 5000
taskkill /PID <PID> /F
```

### Clear Node Modules

```bash
# Backend
cd backend
rm -rf node_modules
npm install

# Frontend
cd frontend
rm -rf node_modules
npm install
```

### Clear npm Cache

```bash
npm cache clean --force
```

### Check MongoDB Connection

```bash
# Test connection string
mongosh "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/student_management"
```

### View Backend Logs

```bash
cd backend
npm run dev 2>&1 | tee logs.txt
```

### View Frontend Logs

```bash
cd frontend
npm run dev 2>&1 | tee logs.txt
```

### Check Environment Variables

Backend:

```bash
cd backend
node -e "console.log(process.env)"
```

Frontend:

```bash
cd frontend
node -e "console.log(process.env)"
```

### Reset Everything

```bash
# Clear node_modules and npm cache
rm -rf backend/node_modules frontend/node_modules
npm cache clean --force

# Reinstall
npm run install-all

# Restart services
cd backend && npm run dev
cd frontend && npm run dev
```

### Debug Mode

Backend with debug logging:

```bash
cd backend
DEBUG=* npm run dev
```

Frontend with verbose output:

```bash
cd frontend
npm run dev -- --debug
```

---

## Default Login Credentials

After seeding, use these accounts:

| Role      | Email                 | Password                 |
|-----------|----------------------|--------------------------|
| Admin     | admin@school.edu     | Admin@2024Secure!        |
| Admin 2   | admin2@school.edu    | Admin@2024Secure!        |
| Director  | director@school.edu  | Director@2024Secure!     |
| Teacher   | wilson@school.edu    | Teacher@2024Secure!      |
| Student   | emma.j@student.edu   | Student@2024Secure!      |
| Nurse     | nurse@school.edu     | Nurse@2024Secure!        |
| Secretary | secretary@school.edu | Secretary@2024Secure!    |

---

## Quick Start Checklist

- [ ] Clone repository
- [ ] Install dependencies: `npm run install-all`
- [ ] Configure `.env` files (backend & frontend)
- [ ] Seed database: `cd backend && npm run seed`
- [ ] Start backend: `cd backend && npm run dev`
- [ ] Start frontend: `cd frontend && npm run dev`
- [ ] Visit `http://localhost:5173`
- [ ] Login with default credentials

---

## Additional Resources

- **README.md** – Project overview and features
- **API_DOCS.md** – API endpoints and documentation
- **USER_MANUAL.md** – Role-specific usage guide
- **DEPLOYMENT_GUIDE.md** – Detailed deployment instructions
- **TESTING.md** – Testing strategy and coverage
- **MONITORING.md** – Logging and monitoring setup
- **TROUBLESHOOTING.md** – Common issues and solutions
- **CONTRIBUTING.md** – Developer guidelines

---

## Getting Help

For issues:

1. Check **TROUBLESHOOTING.md**
2. Review logs in backend/frontend terminals
3. Verify `.env` configuration
4. Check MongoDB Atlas connection
5. Ensure ports 5000 and 5173 are available

For more details, refer to the documentation files in the `docs/` directory.
