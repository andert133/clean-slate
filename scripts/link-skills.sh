#!/usr/bin/env bash
# Point Claude Code at the canonical skills in .agents/skills. Idempotent.
#   scripts/link-skills.sh         relative symlinks (default)
#   scripts/link-skills.sh --copy  real copies when the OS has no symlinks
set -euo pipefail

usage() {
  echo "usage: scripts/link-skills.sh [--copy]" >&2
  exit 2
}

mode="link"
if [ "${1:-}" = "--copy" ]; then
  mode="copy"
elif [ "$#" -ne 0 ]; then
  usage
fi

root="$(cd "$(dirname "$0")/.." >/dev/null && pwd)"
src="${root}/.agents/skills"
dest="${root}/.claude/skills"

if [ ! -d "$src" ]; then
  echo "missing ${src}" >&2
  exit 1
fi

mkdir -p "$dest"

found=0
for dir in "$src"/*/; do
  [ -d "$dir" ] || continue
  found=1
  name="$(basename "$dir")"
  target="${dest}/${name}"
  rel="../../.agents/skills/${name}"

  if [ -L "$target" ] || [ -e "$target" ]; then
    rm -rf "$target"
  fi

  if [ "$mode" = "copy" ]; then
    cp -R "${dir%/}" "$target"
  else
    ln -s "$rel" "$target"
  fi
done

if [ "$found" -eq 0 ]; then
  echo "no skills under ${src}" >&2
  exit 1
fi

if [ "$mode" = "copy" ]; then
  echo "warning: copied skills into .claude/skills. Copies must be re-synced. Re-run scripts/link-skills.sh --copy after every skill change."
else
  echo "linked .claude/skills -> .agents/skills"
fi
