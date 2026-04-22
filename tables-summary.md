# MindGauge Important Files Tables

## 1) App.tsx - App shell + routing table

| Area | Details |
|------|---------|
| Providers (outer → inner) | `ThemeProvider` (system/theme key), `QueryClientProvider` (`queryClient`), `TooltipProvider` |
| Global components | `Toaster`, `Router` |
| Routes | `/` -> `TaskHub`; `/assessment` -> `Assessment`; `/dashboard` -> `Dashboard`; wildcard -> `NotFound` |
| Router lib | `wouter` (`Switch`, `Route`) |
| Export | default `App` |

## 2) task-hub.tsx - test flow & navigation table

| Section | Key actions/behavior |
|---------|---------------------|
| Header | `ModeToggle`, optional `Dashboard (# sessions)` button |
| Hero CTA | "Start Assessment" button → `/assessment` |
| Steps preview | 4 cards: Eye Tracking, N-Back, Stroop, Reaction Time (titles/durations/description) |
| Session summary | If `lastSession` exists, shows composite score + cognitive load + date + `View All` -> `/dashboard` |
| Persistence | `getSessions()` from `lib/session-store` |
| Copy note | `data is local` text |

## 3) assessment.tsx - assessment step state machine table

| Control | Output |
|--------|--------|
| Step order | `eye_baseline` → `nback` → `stroop` → `reaction_time` → `results` |
| Step components | `EyeBaselineStep`, `NBackStep`, `StroopStep`, `ReactionTimeStep`, `ResultsStep` |
| Handlers | `handleEyeComplete`, `handleNbackComplete`, `handleStroopComplete`, `handleRTComplete`, `handleTlxSubmit` |
| Scoring engines | `scoreEyeBaseline`, `scoreNBack`, `scoreStroop`, `scoreReactionTime`, `computeCompositeScore` |
| User flow | request camera permissions → start eye tracking → chain steps → stop tracking → composite + `setSession` → show `NasaTlxModal` → save session |
| State values | `currentStep`, `session`, `eyeResult`, `nbackResult`, `stroopResult`, `rtResult`, `showTlx` |
| Navigation | header click home → `/`; results buttons navigate `dashboard` or reset + new assessment |

## 4) dashboard.tsx - analytics + operations table

| Part | Behavior |
|------|----------|
| Data sources | `getSessions()`, `clearSessions()`, `downloadCSV()`, `getValidationMetrics()`, `analyzeSession()` |
| Charts | Trend line of composite vs self-report; step-avg bar; validation scatter |
| Computed metrics | `weaknessData`, `trendData`, `stepAvgData`, `scatterData` |
| Actions | share screen capture (`html2canvas` + Web Share fallback); export CSV; clear all sessions |
| Session list | click to expand details: per-step scores, weakness bullets, suggestions, delta improvements |
| UI states | no sessions fallback card (start assessment) |
| Nav | back to `/`, `ModeToggle` |

## 5) high-level flow diagram

- TaskHub → Assessment → Results → Dashboard
- Dashboard uses session history for analytics and actions
- Assessment saves session via `saveSession`
