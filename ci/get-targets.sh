#!/bin/bash
git fetch

branch_name=$1
branch="${branch_name#*refs/head/}"

commits=$(git log --format=%H "origin/main..origin/$branch")

# tokenize commits
read -d ' ' -a commits <<< "$commits"

files=""

for commit in $commits; do
    commit_files="$(git diff-tree --no-commit-id --name-only -r $commit)"

    for file in $commit_files; do
        if [[ ! $files == *"$file"* ]]; then
            files="$files $file"
        fi
    done
done

targets=""
project_targets=(".github" "ci" "Scout" "ScoutAPI" "ScoutInsights")

for file in $files; do
    for target in "${project_targets[@]}"; do
        if [[ $file == $target* ]]; then
            if [[ ! $targets == *"$target"* ]]; then
                targets="$targets $target"
            fi
        fi
    done
done

echo "TARGETS: $targets"
