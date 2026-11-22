---
status: TEMPLATE
updated: 2026-11-22
---

Purpose: milestone list and the task board. Claim a row before you start (docs/WORKFLOW.md §4). One owner per task.

# Plan

## Milestones

### M1 — {{M1_GOAL}}

Exit criteria:
- [ ] {{M1_EXIT}}

### M2 — {{M2_GOAL}}

Exit criteria:
- [ ] {{M2_EXIT}}

## Task board

| ID | Task | Owner | Status | Branch | Touches | Depends on |
|---|---|---|---|---|---|---|
| T-001 | {{T001_TASK}} |  | todo |  | {{T001_TOUCHES}} |  |

Statuses: `todo` → `claimed` → `in-progress` → `review` → `done`. A stuck row is `blocked: <why>`.

Rules:
- One owner per task. Claim by editing the row, then commit `chore(plan): claim T-xxx` on `main` before other work. See WORKFLOW.md §4.
- Tasks that run at the same time must list disjoint `Touches` paths.
- A task bigger than one PR gets split.
- A brief lives in `tasks/T-xxx-slug.md` when one line is not enough. Start from `tasks/_TEMPLATE.md`.
