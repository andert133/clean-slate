---
name: handoff
description: "End or resume a work session cleanly so another agent or human can continue. Use when stopping, switching tasks, when context is getting long, or when starting work someone else began."
---

# Handoff

AGENTS.md §7. The bridge between sessions is `docs/PROGRESS.md`, not chat memory.

## Stop

1. Append an entry at the bottom. Do not edit older entries. If an older entry is wrong, add a correction entry.
2. Use the shape in PROGRESS.md: date, human/agent, task id, done, verified (command and result), next step, open questions, branch@commit.
3. Commit work in progress with a `wip:` subject only if the human allows it. Otherwise leave a clean tree and say so in the entry.
4. When this file grows past about 300 lines, move old entries to `docs/archive/PROGRESS-<year>.md` and leave the latest ones here.
5. If the context is long, say that the next session should start fresh and read this entry.

## Resume

1. Read the last three PROGRESS entries, `git log`, the task brief, and the diff against `main`.
2. State the resume point in a few lines. Do not redo finished work.
3. Re-check an inherited claim with a cheap command before you build on it.

## Report

On stop: the entry you appended, and whether the tree is clean. On resume: the resume point and the claim you re-checked.
