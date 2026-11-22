---
name: ship
description: "Commit and open a PR the right way: atomic conventional commits of only this task's files, a green gate, a filled PR template, and PLAN/PROGRESS updated. Use when the work is verified and ready to commit or open a PR."
---

# Ship

AGENTS.md §5 and §6. The gate is green before the commit, not after you weaken it.

1. `git status`. Stage only the paths this task changed. Name them in `git add`. Do not use `git add -A` on a dirty tree you have not read.
2. Run `scripts/check.sh`. Paste the result. Fix failures. Do not pass `--no-verify`.
3. Commit `type(scope): subject`. Imperative subject, 72 characters or fewer. The body says why.
4. Rebase on the latest `main` and run the gate again.
5. Push the task branch. Open the PR with `.github/pull_request_template.md`: Why, What changed, Scope, Blast radius, Verification with the pasted evidence. The title matches the commit style.
6. Set the task to `review` in `docs/PLAN.md`. Append a PROGRESS entry (`handoff`).
7. In a team of 2–3, do not merge your own PR unless `docs/WORKFLOW.md` says the lead may. Never force-push a branch someone else uses.

## Report

Commit subjects, PR link, the gate output, and what is still open.
