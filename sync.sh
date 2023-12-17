#!/usr/bin/env bash 

remote_repo=origin
current_dir=$(pwd)
script_dir=$(dirname "$0")

# Temporary go to the directory with a script and which is managed by git
cd "$script_dir"

# Commits local changes
function commit-local-changes() {
  local current_date=$(date +%c)
  git add .vimrc .ideavimrc
  git commit -m "$current_date: sync local changes"
}

function merge-into-upstream() {
  echo "Pulling changes from the upstream"

  if ! (cd "$script_dir" && git pull --rebase ${remote_repo} main > /dev/null); then
    echo "Conflicts with remote changes"
    return 1;
  fi

  echo "Pushing changes to upstream"
  (cd "$script_dir" && git push ${remote_repo} main > /dev/null)
}

function main() {
  commit-local-changes
  merge-into-upstream
}

main
# Go back to the directory that was set before current script was called
cd "$current_dir"
