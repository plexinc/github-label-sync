#!/bin/sh

# loop through each of the repos and run the label sync command
while read -r repo; do
  github-label-sync --access-token "$GITHUB_ACCESS_TOKEN" --labels /data/labels.yaml --allow-added-labels "$repo"
done < "/data/repos.txt"
