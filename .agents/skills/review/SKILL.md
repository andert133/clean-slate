---
name: review
description: "Review a diff or PR with fresh eyes: correctness, blast radius, readability, slop, needless comments, test quality, secrets. Use before opening or merging a PR, or when the human says review or проверь. Best run in a new session or subagent, ideally a different model than the author."
---

# Review

Start from a fresh session when you can. You did not write this diff. Do not rewrite the code unless the human asks. AGENTS.md §4 and §5 are the bar.

1. Read the diff against `main` and the task brief (`tasks/T-xxx-*.md` or the PR body).
2. Check that the diff does what the task says and nothing else. Name any scope creep.
3. Blast radius: find callers outside the diff that this change can break. Prove the important safety claim by running the code, not by arguing.
4. Readability: names, function size, dead code, a wrapper with one caller, a comment that excuses a workaround.
5. Tests must assert behavior a user can see, and they must fail if that behavior breaks. A test of a mock does not count.
6. Look for secrets, new dependencies with no pin, and checks that were disabled to get green.

A finding counts only when you can point at evidence (a line, a command, an output).

## Report

A table: severity (`block`, `should`, or `nit`), file:line, problem, suggested fix. Only `block` stops the merge. If you find nothing, say what you ran.
