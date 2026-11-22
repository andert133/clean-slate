---
name: kickoff
description: "First-run setup for a blank clean-slate repo. Interviews the human, fills every {{PLACEHOLDER}}, picks the stack, builds a walking skeleton with a green check. Use when docs/PRD.md says status: TEMPLATE or the human says /kickoff."
disable-model-invocation: true
---

# Kickoff

Run before any other work when `docs/PRD.md` has `status: TEMPLATE`, or when the human says `/kickoff`. AGENTS.md §0 is the trigger. On Claude Code, run `scripts/link-skills.sh` first if `.claude/skills/` is missing (ADR-0000).

1. Read the seed idea. Restate it in one line. If the human invoked `autopilot`, take every recommended default below and log the choices. Do not interview.
2. **Round 1 — product.** At most 6 numbered questions. Each has options and a recommended default. The human may answer `1b 2a`. Cover: who uses it; the one core job; three observable signs v1 is done; platform (web / bot / CLI / script / ML notebook→script / library / mobile); data and external services; solo or a team of 1–3 with names or handles.
3. **Round 2 — technical.** Propose two stacks and a 3-row tradeoff (simplicity for this person, ecosystem fit, deploy story) plus one recommendation. Ask language or runtime constraints, hosting target, and chat language. Prefer boring, documented tools.
4. Fill `docs/PRD.md` (leave `status: TEMPLATE` until step 8), `docs/ARCHITECTURE.md`, ADR-0001, the AGENTS.md §1 §2 §9 placeholders, the README top block, `.env.example`, stack lines in `.gitignore`, and the allow-list in `.claude/settings.json`.
5. Run the `adapt` skill now. It shapes folders, the gate, CI, and vetted topic skills. Do not build the skeleton until it returns.
6. If a double-brace slot remains in `scripts/check.sh`, `.pre-commit-config.yaml`, or `.github/workflows/ci.yml`, fill it from the table. Use `true` only for a step the stack does not have, and say why in the ADR. Run `pre-commit install` when the command exists. Replace the CI step that treats "Not configured yet" as success with a plain `scripts/check.sh`. Enable the commented pre-push hook.
7. Walking skeleton: one entry point, one behavior test, and `docs/VERIFY.md` filled with the launch recipe and the first feature-map row. Run `scripts/check.sh` and the app. Paste both outputs.
8. Write milestone 1 in `docs/PLAN.md` as 3–8 PR-sized tasks with acceptance checks. Show a 10-line summary and ask for one "ok". After ok (or at once under autopilot): set PRD `status: ACTIVE`, confirm `rg '\{\{'` left only intentional tokens (`tasks/_TEMPLATE.md`, the sample in this skill's description, and GitHub Actions `${{ }}` expressions), commit `chore: kickoff <name>`, append `docs/PROGRESS.md`.

## Stack defaults

| Stack | Format/lint | Types | Tests |
|---|---|---|---|
| Python (scripts, bots, ML, APIs) | ruff format + ruff check | mypy or pyright (basic) | pytest; uv for envs |
| TypeScript (web, bots, CLI) | prettier or biome + eslint | tsc --noEmit (strict) | vitest; pnpm |
| Go | gofmt + go vet | compiler | go test |
| Rust | rustfmt + clippy | compiler | cargo test |
| ML experiments | as Python + nbstripout | — | pytest on data/metric functions; fixed seeds |

## Report

Ten lines: idea, users, stack, how to run, gate result, skills adapt installed, branch. Then `next: T-001 …`.
