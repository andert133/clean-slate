---
name: verify
description: "Prove a change works on the real artifact before saying done: run the app, script, or bot, exercise the feature like a user, and capture evidence. Also creates or updates docs/VERIFY.md. Use after a change and before every commit or PR."
---

# Verify

AGENTS.md §3.5. "Inconclusive" is not a pass. "It compiled" is not done.

1. Read `docs/VERIFY.md`. If the launch recipe or the feature row is missing, you will add it before you finish.
2. Start the artifact the way the doc says. Confirm ready by the documented signal (a listening port, a printed line, a process exit code). Do not infer ready from a missing error.
3. Drive the changed feature the way a user would. HTTP call, CLI args, a bot message through the test harness, the browser for UI, or for ML `python -m <pkg>.train --seed 0 --fast` with the metric printed.
4. Capture evidence: the command, the output, a screenshot path, or the metric value. Look at side effects you claim (files, rows) by reading them.
5. Stop what you started. Keep the evidence under `artifacts/` (gitignored). Paste the important lines in the PR.
6. Update the feature map: one row per user-facing feature, with name, where it lives, how to exercise it, and the expected result.

## Report

Paste the evidence. State pass or fail. If you changed VERIFY.md, say which row.
