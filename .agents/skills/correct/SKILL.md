---
name: correct
description: "Make a repeated agent mistake impossible next time. Use when the human corrects the same kind of mistake twice, says опять, or says /correct."
disable-model-invocation: true
---

# Correct

AGENTS.md §9. A sentence in a rules file is the last fix, not the first. If the rule was already written and the mistake came back, the sentence failed: encode it.

1. Name the mistake class. Quote one or two real examples (file, what the agent did, what the human said).
2. Fix at the highest level that actually prevents a repeat:
   1. Structure: one owner for that state, one way to do the thing, and delete the old way.
   2. Types, so the wrong shape does not compile.
   3. A lint or CI check whose error text names the right fix.
   4. A test that fails on the old behavior.
   5. Only then a row in AGENTS.md §9, or a short note in a skill.
3. Prove the new check fails on the original mistake (a fixture, a reverted snippet, or the old command). Then prove the fixed code passes.
4. Add a row to the AGENTS.md §9 table: rule, and what enforces it. Drop a row when that mistake can no longer happen.
5. Keep AGENTS.md under 150 lines.

## Report

The mistake class, the level you fixed (1–5), the command that failed on the old behavior and passed after, and the §9 row you added or removed.
