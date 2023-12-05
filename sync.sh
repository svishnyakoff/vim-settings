#!/usr/bin/env bash

remote_repo=origin

vimrc_home_filepath=${HOME}/.vimrc
ideavimrc_home_filepath=${HOME}/.ideavimrc

project_dir=$(dirname "$0")

vimrc_path="$project_dir/.vimrc"
ideavimrc_path="$project_dir/.ideavimrc"

# Copies content of a local files, configuration files from home directory, into the project to be able to check them in to upstream
function load-local-scripts() {
  echo "Copying local changes to git project"
  cp $vimrc_home_filepath "$project_dir/"
  cp $ideavimrc_home_filepath "$project_dir/"
}

function content-matches() {
    local first_file=$1
    local second_file=$2

    local checksum1=$(md5 -q $first_file)
    local checksum2=$(md5 -q $second_file)

    [[ $checksum1 == $checksum2 ]]
}

function override-local-with-remotes() {
#  local vimrc_matches=$(content-matches "$vimrc_path" "$vimrc_home_filepath")
#  local ideavimrc_matches=test content-matches $ideavimrc_path ideavimrc_home_filepath
  if content-matches "$vimrc_path" "$vimrc_home_filepath"  &&  content-matches "$ideavimrc_path" "$ideavimrc_home_filepath" ; then
     echo "Local configurations are up to date"
     return 0
  fi
  echo "Overriding local vim configuration with remote"
  cp "$project_dir/.vimrc" "$vimrc_home_filepath"
  cp "$project_dir/.ideavimrc" "$ideavimrc_home_filepath"
}

# Commits local changes
function commit-local-changes() {
  local current_date=$(date +%c)
  git add .vimrc .ideavimrc
  git commit -m "$current_date: sync local changes"
}

function merge-into-upstream() {
  echo "Checking out updates from github"

  if ! git pull --rebase ${remote_repo} main > /dev/null; then
    echo "Conflicts with remote changes"
    return 1;
  fi

  git push ${remote_repo} main > /dev/null
}

function main() {
  load-local-scripts
  commit-local-changes
  if merge-into-upstream; then
    override-local-with-remotes
  fi
}

main