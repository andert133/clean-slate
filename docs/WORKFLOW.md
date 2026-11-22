---
status: TEMPLATE
updated: 2026-11-22
---

Purpose: how 1–3 humans and their agents share this repo. The lead updates it when the team shape changes. Read it before the first parallel task.

# Workflow

## 1. Roles

**Lead.** One human. On a solo project that is you. The lead owns `docs/PRD.md` and the order of `docs/PLAN.md`, approves plans for large tasks, merges to `main`, and decides when a human review can be lighter.

**Builders.** Every human, including the lead, operates one to three agents. The human who merges is accountable for every line, no matter who typed it.

**Agent roles** are separate sessions, not extra products. **Planner:** the `plan` skill, read-only. **Implementer:** one task, one branch. **Reviewer:** a fresh context and the `review` skill, ideally a different model than the author. **Researcher:** read-only questions and prototypes on a scratch branch or folder. Scratch work is never merged.

## 2. Branching

Trunk-based. `main` stays green. Protect it: required CI, and one approval when the team is two or more. Branches are short, named `<who>/<task-id>-<slug>`, and merge within a day or two. Squash or rebase-merge, and use the conventional commit as the squash title. There is no long-lived `dev` branch. A release is a tag such as `v0.1.0`.

## 3. Parallel agents

Size work by blast radius. Each human, at one time, has at most one large task plus a few small low-risk ones: lint, docs, tiny fixes, research.

Two ways to isolate work. A **worktree per task** is the default when two code tasks run at once: `git worktree add ../<repo>-T012 -b joe/T-012-slug`. Claude Code can use `claude --worktree`. Cursor and Codex cloud agents already use their own branch. After the merge, `git worktree remove`. The **same folder** is only for tiny tasks, and the agent commits only the files it edited (AGENTS.md §6).

Two agents never edit the same file at once. If two tasks need that file, do them in order, or land a PR that splits the file or the contract first.

**Contracts first.** When people split a feature (API and UI, bot and storage), the shared interface lands in its own small PR before the parallel work. That interface is types, an OpenAPI or JSON schema, a database schema, or function signatures.

Background agents are for research, triage, and reports. They open draft PRs or write under `docs/`. They do not merge. Check them at a natural break.

## 4. Coordination

`docs/PLAN.md` is the board. Claim a task by editing its row (owner, status `claimed`, branch) and pushing that commit straight to `main` as `chore(plan): claim T-012` before any other work. That is the only direct commit to `main` that AGENTS.md §5 allows. If branch protection blocks it, use GitHub Issues with assignees as the board and keep PLAN.md as the milestone view. Pull before you claim. If the push conflicts, someone else took the task. Pick another.

A task that needs more than one line gets a brief at `tasks/T-xxx-*.md`: goal, acceptance checks, `touches:` paths, and out of scope. The implementer prompt is: "Read AGENTS.md, then tasks/T-012-*.md, then do it."

Agents hand off through `docs/PROGRESS.md` and the PR description, not through chat memory. A decision that affects someone else goes to `docs/DECISIONS.md` in the same PR.

## 5. Human review

Review the plan, not only the code. For a large task the lead approves the plan before implementation. A clear plan is usually implemented in one pass.

Every PR shows evidence: pasted command output, a screenshot, or a metric. No evidence means not ready.

With two or more people, a reviewer agent runs first, the author fixes every `block` finding, and a different human approves. Solo: run a reviewer agent in a fresh session (another model if you have one) and read the whole diff before you merge.

The merging human must be able to explain the change. If they cannot, run the `explain` skill first. Keep a PR under about 400 changed lines. Split a larger one, or add a walkthrough.

## 6. Compounding

A repeated correction goes through the `correct` skill: a deterministic check first, a line in AGENTS.md last. About once a week, or every ten merged PRs, skim PROGRESS and review notes, pick the mistake that came back, and encode it. Agents copy the nearest example. Delete workarounds and dead code so they do not spread.

## 7. Context hygiene

One task per session. Open a new session for a new task. For a vague task, plan in one session and implement in the next. If a session drifts, stop, ask for status, and re-plan. Use subagents for bulk reading and for noisy test logs. Keep decisions in the main thread. Paste the exact error, not a summary of it.

## 8. Adding tools

Add an MCP server (`.cursor/mcp.json` or `.mcp.json`) only when a task keeps needing it, such as a browser for UI checks, a database, or docs. The template ships with neither file. Commit the config without secrets, and note the new command in AGENTS.md §2. Prefer a CLI plus a line in `docs/VERIFY.md` when both would work.

## 9. Daily loop

1. Pull.
2. Read PLAN and the last PROGRESS entries.
3. Claim a task.
4. Open a branch or a worktree.
5. Plan, and get approval when the task is large.
6. Write the test, then implement.
7. Verify on the running artifact.
8. Review in a fresh session.
9. Ship.
10. Hand off.
