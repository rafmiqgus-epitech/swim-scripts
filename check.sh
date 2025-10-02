#!/bin/bash

set -euo pipefail
LC_ALL=C

if ! command -v perl >/dev/null 2>&1; then
  echo "Error: 'perl' is required for parsing C files (to strip comments/strings). Please install perl." >&2
  exit 2
fi

found_any=0
violations=0

while IFS= read -r -d '' f; do
  ((found_any=1))

  sanitized="$(perl -0777 -pe '
    s{/\*.*?\*/}{}gs;                      # remove /* ... */ block comments
    s{//[^\n]*}{}g;                        # remove // ... line comments
    s/"([^"\\]|\\.)*"/""/g;                # strip string literals
    s/'\''([^'\'']|\\.)*'\''/'\'''\''/g;   # strip char literals
  ' "$f")"

  file_had_hit=0

  if grep -nE '\bmain\s*\(' <<<"$sanitized" >/dev/null; then
    echo "❌ main() found in: $f"
    grep -nE '\bmain\s*\(' <<<"$sanitized"
    echo
    file_had_hit=1
    violations=1
  fi

  if grep -nE '\bprintf\s*\(' <<<"$sanitized" >/dev/null; then
    echo "❌ printf() found in: $f"
    grep -nE '\bprintf\s*\(' <<<"$sanitized"
    echo
    file_had_hit=1
    violations=1
  fi

done < <(find . -type f -name '*.c' -not -path '*/.git/*' -print0)


if (( violations == 0 )); then
  echo "✅ OK: no main() or printf() found in any .c files (recursively)."
  exit 0
else
  echo "⛔ Violations detected."
  exit 1
fi

