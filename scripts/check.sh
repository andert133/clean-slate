#!/usr/bin/env bash
# One gate: format, lint, types, tests, secrets.
# Kickoff replaces each double-brace slot below. Until then the gate fails closed.
set -euo pipefail

cd "$(dirname "$0")/.." || exit 1

FORMAT_CMD='{{FORMAT_CMD}}'
LINT_CMD='{{LINT_CMD}}'
TYPECHECK_CMD='{{TYPECHECK_CMD}}'
TEST_CMD='{{TEST_CMD}}'

# Build the slot markers without a literal double-brace sequence, so a filled
# script no longer matches a search for that sequence.
open_mark=$(printf '%s%s' '{' '{')
close_mark=$(printf '%s%s' '}' '}')

unconfigured=0
for slot in "$FORMAT_CMD" "$LINT_CMD" "$TYPECHECK_CMD" "$TEST_CMD"; do
  case "$slot" in
    *"$open_mark"*"$close_mark"*) unconfigured=1 ;;
    *) ;;
  esac
done

if [ "$unconfigured" -eq 1 ]; then
  echo "Not configured yet: run the kickoff skill"
  exit 1
fi

run_step() {
  name="$1"
  cmd="$2"
  echo "== ${name} =="
  bash -c "$cmd"
}

run_step format "$FORMAT_CMD"
run_step lint "$LINT_CMD"
run_step types "$TYPECHECK_CMD"
run_step test "$TEST_CMD"

echo "== secrets =="
if command -v gitleaks >/dev/null 2>&1; then
  gitleaks detect --no-banner --source .
else
  echo "warning: gitleaks not installed; secret scan skipped"
fi
