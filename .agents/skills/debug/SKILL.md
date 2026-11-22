---
name: debug
description: "Find and fix the root cause of a bug or failing check. Use for errors, wrong output, crashes, flaky tests, or when the human says не работает."
---

# Debug

AGENTS.md §4: fix the first place the system went wrong. A guard is a fix only when that state is legitimate.

1. Reproduce it yourself. Record the exact command. Paste the real error or the wrong output. Do not debug a paraphrase.
2. Write 2–4 hypotheses that could produce that evidence.
3. Pick the check that rules out the most. Add a print, a log line, or a debugger. Read the real value. Do not guess the next patch.
4. If two fixes that share a premise both fail, write the premise down and test that premise directly.
5. Fix the first wrong step. Do not add extra changes that "might help". Revert edits that came from a hypothesis you have disproved.
6. When a regression test is cheap, write it first (`tdd`), watch it fail, then apply the fix.
7. Run the original repro again. Done means that command now shows the right result.

## Report

Symptom (the repro command and output). Root cause, in one or two sentences. The fix, with file:line. Repro before and after.
