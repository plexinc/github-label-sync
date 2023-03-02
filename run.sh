#!/bin/sh

command="github-label-sync --access-token $GITHUB_ACCESS_TOKEN --labels /data/labels.yaml"
[ "$ALLOW_EXISTING_LABELS" = "true" ] || [ -z "$ALLOW_EXISTING_LABELS" ] && command="$command --allow-added-labels"
[ "$DRY_RUN" = "true" ] && command="$command --dry-run"

# loop through each of the repos and run the label sync command
while read -r repo; do
  eval "$command" "$repo"
done < "/data/repos.txt"
