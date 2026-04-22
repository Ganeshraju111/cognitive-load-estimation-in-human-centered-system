# Cognitive Load Estimation System

![Cognitive Load Estimator](https://img.shields.io/badge/status-active-success.svg) ![React](https://img.shields.io/badge/react-18-blue.svg) ![TypeScript](https://img.shields.io/badge/typescript-5.x-blue.svg)

A web-based cognitive load estimation system that analyzes user interaction patterns to assess mental workload in real-time. This system acts as a research tool for human-computer interaction studies and adaptive user interface development, predicting cognitive load state without requiring expensive specialized hardware.

Instead, the system relies on common, everyday input interfaces:
- **Typing Dynamics:** Keystroke timings, durations, and error rates.
- **Mouse Movements:** Clicks, scrolls, cursor velocity, and idle times.
- **Eye & Blink Tracking:** AI-powered facial landmark tracking (via Google MediaPipe) to accurately determine blink rates and Eye metric behavior.

## Features

- **Real-Time Analysis**: Monitors behavior continuously as you type to predict Low, Medium, or High cognitive load.
- **Robust Blink Detection**: Utilizes MediaPipe `Tasks-Vision` to track facial blendshapes dynamically, ensuring reliable eye tracking even as the user moves their head.
- **Comprehensive Data Extraction**: Captures raw behavioral data through custom event listeners and distills it into actionable interaction metrics.
- **Modern Tech Stack**: Built with Vite, React 18, TypeScript, Tailwind CSS, shadcn/ui on the frontend, and Express along with Drizzle ORM on the backend.

## Architecture

* **Frontend:** Built with React + TypeScript using Vite. UI relies heavily on `shadcn/ui` components and Radix UI primitives for accessible, beautiful design. Employs lightweight custom hooks for state management and device tracking (`useEyeTracking`, `useInteractionTracker`, `useCognitiveLoad`).
* **Backend:** REST API using Express.js and TypeScript. Processes event-driven data collections.
* **Database:** Drizzle ORM for PostgreSQL schema definitions, currently utilizing an in-memory session-based approach for easy local development.

---

## 🚀 Getting Started

To run this project locally, ensure you have **Node.js** (v18+) installed on your machine.

### For Windows Users

The easiest way to get started on Windows is to run the provided batch script. It will automatically install dependencies and start the development server.

1. Navigate to the project directory.
2. Double-click the `START_HERE_WINDOWS.bat` script.
   * Alternatively, you can open Command Prompt/PowerShell and run:
     ```cmd
     .\START_HERE_WINDOWS.bat
     ```
3. The server will boot up and provide an available local port in the terminal (e.g., `http://localhost:5000`).

### For macOS / Linux (or Manual Setup)

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Start the development server:**
   ```bash
   npm run dev
   ```

3. **Open the App:**  
   The terminal will output the local URL (e.g., `http://0.0.0.0:5000`). Open this link in your browser.

## 🛠️ Commands

- `npm run dev`: Starts the application in development mode with hot-module reloading.
- `npm run build`: Compiles the application into the `dist` folder for production.
- `npm start`: Runs the compiled production build from the `dist` folder.
- `npm run db:push`: Pushes schema changes to your configured database using drizzle-kit.

## Privacy & Data Collection
This system implements session-based isolation. No identifiable personal information or user accounts are required. Interactions are tracked anonymously for specific typing sessions primarily intended for research environments.

## License
MIT License
