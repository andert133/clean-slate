---
name: tdd
description: "Red/green test-first loop. Use when adding behavior or fixing a bug that has a cheap, fast test path, or when the human says TDD or test first. Skip when the only test would be slow, brittle, or mostly mocks."
---

# TDD

AGENTS.md §3.3 and §4. Prefer no new test over a bad one.

1. Run the existing tests once so you know the harness and the baseline.
2. Write the smallest test of the behavior a user can observe.
3. Run that test. Confirm it fails for the reason you intended. If it fails for another reason, fix the test setup before writing product code.
4. Change the smallest amount of product code that makes the test pass.
5. Re-run this test, then `scripts/check.sh`.
6. Refactor only while the suite is green. One kind of cleanup per commit (`simplify`).

Guardrails:
- Do not edit a test so that wrong product code looks correct.
- Do not weaken an assertion unless you say why in the commit body.
- Do not add a test that only checks a mock, depends on wall-clock timing, or mirrors private structure.

Skip this skill when the only honest test would be slow, brittle, or mostly mocks. Say that you skipped it and why.

## Report

Paste the failing run (command and the assertion) and the later passing run. Name the behavior the test locks.
