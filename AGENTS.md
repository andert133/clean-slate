# AGENTS.md

Rules for every coding agent in this repo (Cursor, Claude Code, Codex, Copilot, Gemini, …).
This file is the single source of truth. Other agent files point here. Keep it under 150 lines.
Explicit instructions from the human in chat override this file.

## 0. First run
If `docs/PRD.md` says `status: TEMPLATE`, stop and run the `kickoff` skill (`.agents/skills/kickoff/SKILL.md`)
before doing anything else. Use the human's first message as the seed idea.

## 1. Project
- Name: {{PROJECT_NAME}}
- One-line goal: {{ONE_LINE_GOAL}}
- Stack: {{STACK}}  (why: docs/DECISIONS.md ADR-0001)
- Chat language with the human: {{CHAT_LANGUAGE}}. Code, identifiers, commits, docs: English.
- Read before non-trivial work: docs/PRD.md, docs/ARCHITECTURE.md, docs/PLAN.md, last 3 entries of docs/PROGRESS.md.

## 2. Commands
| What | Command |
|---|---|
| Install | {{CMD_INSTALL}} |
| Run locally | {{CMD_RUN}} |
| Run one test | {{CMD_TEST_ONE}} |
| Full gate (must pass before every commit) | `scripts/check.sh` |
How to drive the running app and collect evidence: docs/VERIFY.md.

## 3. The loop (every task)
1. **Understand.** Restate the goal and the smallest change that meets it in 1–3 lines.
   If the request is ambiguous or has 2+ reasonable readings, ask (max 3 questions, offer a default). Do not guess silently.
2. **Plan.** For anything over ~30 lines or touching 2+ files: use the `plan` skill. Name the data shape first.
   Wait for the human's "ok" on the plan unless they said to go ahead.
3. **Test first** when there is a cheap test path (`tdd` skill): write the test, watch it fail for the right reason.
4. **Implement the smallest change.** Touch only what the task needs. Match the existing style.
5. **Verify on the real artifact** (`verify` skill): run it, read the actual output. "It compiles" is not done.
6. **Gate.** `scripts/check.sh` passes. Fix failures; never weaken a test or a lint to get green.
7. **Record.** Update docs that the change made stale (PLAN status, ARCHITECTURE, DECISIONS for real decisions).
8. **Commit** small and atomic (`ship` skill). Report: what changed, how you verified (paste output), what is open.
If things go sideways twice, stop, say so, and re-plan instead of patching.

## 4. Code rules
- Simplicity first: the least code that solves the problem. No speculative features, options, or abstractions.
  No wrapper with one caller. If 200 lines could be 50, write 50.
- Readable for a human junior: clear names over comments, small functions, early returns, no clever one-liners.
- Comments explain only a non-obvious *why*. Never write a comment that justifies a workaround; fix the cause or ask.
- Fix root causes. A guard/try-catch/timeout is a fix only if the state it handles is legitimate.
- Validate at boundaries (user input, network, files, env); trust internal types inside.
- Never invent APIs, flags, or library functions. If unsure, read the installed source/docs or run it. Pin new deps and say why you added them.
- Clean up only your own mess: remove what *your* change made unused; mention other dead code, do not delete it.
- Do not reformat or "improve" unrelated code in the same change.
- Tests assert behavior users can observe, not internals. Do not test mocks.

## 5. Safety
- Never commit secrets. Real values live in `.env` (gitignored); document names in `.env.example`.
- Never print, log, or paste secret values into chat, code, or docs.
- Ask before anything irreversible or external: deleting data, force-push, rewriting pushed history,
  deploys, paid API calls in loops, sending messages/emails, publishing packages.
- Do not push to `main` directly (exception: `docs/PLAN.md` claim/status commits, see docs/WORKFLOW.md).
- Do not disable CI, hooks (`--no-verify`), or tests to get unblocked.

## 6. Git
- Branch per task: `<who>/<task-id>-<slug>` (e.g. `joe/T-012-login-form`). One task = one branch = one agent session.
- Conventional Commits: `type(scope): subject` — types: feat, fix, refactor, test, docs, chore, perf, build, ci.
- Commit only the files you changed for this task. Small commits that each pass `scripts/check.sh`.
- PR body uses `.github/pull_request_template.md`. Keep PRs under ~400 changed lines; split otherwise.

## 7. Team and parallel agents
Full process: docs/WORKFLOW.md. The short version:
- docs/PLAN.md is the task board. Work only on a task you claimed; one owner per task.
- Parallel tasks must not edit the same files. Shared contracts (types, API schema, DB schema) land first in their own PR.
- Read the latest docs/PROGRESS.md entries before starting; append one when you stop (`handoff` skill).
- A reviewer agent starts with fresh context and did not write the code.

## 8. Skills
In `.agents/skills/` (Claude Code: `.claude/skills/`). Use them when their description fits; the human can call them with `/name`.
kickoff · adapt · plan · tdd · debug · verify · review · simplify · ship · correct · handoff · explain · autopilot
`kickoff` calls `adapt`. `autopilot` (autopilot, pohuy mode, just do it, сделай как лучше) picks defaults and logs them; §5 still applies.

## 9. Lessons (rule ↔ enforcement)
When the human corrects a repeated mistake, run the `correct` skill. Prefer a check over a sentence.
| Rule | Enforced by |
|---|---|
| No secrets in git | gitleaks in pre-commit + CI |
| Formatting | {{FORMATTER}} via scripts/check.sh |
<!-- correct skill appends rows here; drop a row when its mistake can no longer happen -->
