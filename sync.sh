#!/usr/bin/env bash

remote_repo=origin

# Commits local changes
function commit-local-changes() {
  local current_date=$(date +%c)
  git add .vimrc .ideavimrc
  git commit -m "$current_date: sync local changes"
}

function merge-into-upstream() {
  echo "Pulling changes from the upstream"

  if ! git pull --rebase ${remote_repo} main > /dev/null; then
    echo "Conflicts with remote changes"
    return 1;
  fi

  echo "Pushing changes to upstream"
  git push ${remote_repo} main > /dev/null
}

function main() {
  commit-local-changes
  merge-into-upstream
}

main
