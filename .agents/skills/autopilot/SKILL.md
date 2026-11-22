---
name: autopilot
description: "Do the task without asking. Use when the human says autopilot, pohuy mode, just do it, or сделай как лучше. Pick the best default at every decision, log it in docs/DECISIONS.md or docs/PROGRESS.md, and ask only when truly blocked or before an irreversible or dangerous action. Still obeys AGENTS.md safety rules."
---

# Autopilot

The human's phrase overrides the "ask first" lines in AGENTS.md §3. It does not override §4 or §5. Cursor's built-in `/autopilot` watches a pull request. This skill is the decide-and-proceed mode. When a trigger phrase is used, follow this file.

1. Append a PROGRESS entry: mode autopilot, who, when. Do not add a rule to AGENTS.md. Stay in this mode until the human says stop.
2. At each choice (stack, name, library, layout, a fork in the plan), pick the most boring, well-documented option that fits the PRD. Log a project-shaping choice as an ADR. Log a small default as one PROGRESS line: the choice, what you picked, why.
3. Do not wait for "ok" on a plan. Kickoff's two rounds: take each recommended default and continue.
4. Ask only when you are truly blocked (no access, or two written requirements that contradict) or before an irreversible or dangerous action: deleting data, spending money, publishing, sending a message or email, force-push, or exposing a secret. Then write one or two short sentences a five-year-old would understand, name the recommended default, and stop. Phrase it so the owner can answer "да".
5. Keep AGENTS.md §5. Do not commit secrets, weaken a test, skip a hook, disable CI, or push to `main` (the PLAN claim exception in WORKFLOW.md §4 still stands).
6. When the task is done, report only three things.

## Report

What was done. How to run it (one command). One next step, a single line.
