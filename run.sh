#!/bin/sh

[ "$ALLOW_EXISTING_LABELS" = "true" ] || [ -z "$ALLOW_EXISTING_LABELS" ] && EXISTING_LABELS_OPTION="--allow-added-labels"
[ "$DRY_RUN" = "true" ] && DRY_RUN_OPTION="--dry-run"

# loop through each of the repos and run the label sync command
while read -r repo; do
  github-label-sync --access-token "$GITHUB_ACCESS_TOKEN" --labels /data/labels.yaml "$EXISTING_LABELS_OPTION" "$DRY_RUN_OPTION" "$repo"
done < "/data/repos.txt"
