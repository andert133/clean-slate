---
name: plan
description: "Plan non-trivial work before writing code: restate the goal, name the data shapes and module boundaries, list steps as small verifiable units, and write tasks. Use for features, refactors over ~30 lines, anything touching 2+ files, or when the human says plan or спланируй."
---

# Plan

Use this before coding when AGENTS.md §3.2 applies. Read before you decide.

1. Read `docs/PRD.md`, `docs/ARCHITECTURE.md`, `docs/PLAN.md`, the last PROGRESS entries, and the code you will touch.
2. Restate the goal in one sentence. List non-goals.
3. Name the data shape first: types, schema, or state machine, and the file that owns each piece.
4. List risks and blast radius. Name callers outside the edit that can break.
5. Split the work into small steps. Each step ends in a check: a test or a command.
6. If a fork can be settled by a prototype of about ten minutes, build the prototype instead of debating it.
7. For more than one task, copy `tasks/_TEMPLATE.md` to `tasks/T-xxx-slug.md` and add rows in `docs/PLAN.md`. Tasks with disjoint `touches:` paths may run in parallel. Shared contracts land first, in their own PR.
8. If later work leaves this plan, stop and write a new plan.
9. Under `autopilot`, record the plan and continue. Otherwise wait for the human's "ok".

## Report

At most 25 lines: goal, non-goals, data shape, risks, steps with their checks, which tasks are parallel, and "ok?" unless autopilot is on.
