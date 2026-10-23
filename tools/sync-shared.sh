#!/usr/bin/env bash
# Copy the shared template code (shared/setup/) into every template folder.
# Run this after editing anything in shared/setup/. The GitHub Action fails
# if a template's copy differs from the master.
set -euo pipefail
cd "$(dirname "$0")/.."
for dir in final-report progress-report poster; do
  [ -d "$dir/setup" ] || continue
  cp shared/setup/* "$dir/setup/"
  echo "synced shared/setup -> $dir/setup"
done
