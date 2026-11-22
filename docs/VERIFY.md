---
status: TEMPLATE
updated: 2026-11-22
---

Purpose: how to start the real artifact and prove a feature. The `verify` skill keeps the feature map current. "It compiled" is not a result.

# Verify

## Launch

Command: `{{CMD_RUN}}`

Ready signal: {{READY_SIGNAL}}

Env: copy `.env.example` to `.env`. Variables: {{ENV_VARS}}

## Doctor

One read-only health check: `{{CMD_DOCTOR}}`

Expected: {{DOCTOR_EXPECTED}}

## Drive

Exercise the changed feature the way a user would. Capture the command and the output.

<!-- web
curl -sS {{BASE_URL}}/health
-->

<!-- bot
Send {{BOT_SAMPLE_MESSAGE}} through the test harness. Assert the reply text, not a mock call.
-->

<!-- cli
{{CMD_RUN}} {{CLI_SAMPLE_ARGS}}
-->

<!-- ml
python -m {{PACKAGE}}.train --seed 0 --fast
Print the metric. Same seed, same data, comparable number.
-->

## Evidence

Save command output, screenshots, and metric values under `artifacts/` (gitignored). Paste the relevant lines into the PR.

## Cleanup

Stop the process you started. Leave the evidence files.

## Feature map

| Feature | Where in code | How to exercise | Expected result |
|---|---|---|---|
| {{FEATURE_NAME}} | {{FEATURE_WHERE}} | {{FEATURE_HOW}} | {{FEATURE_EXPECTED}} |
