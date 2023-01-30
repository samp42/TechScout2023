#!/bin/bash
commits=$(git log --format=%H main..$1)

project_targets=(".github" "ci" "Scout" "ScoutAPI" "ScoutInsights")

targets=""

for commit in $commits; do
    # find all files that were changed in this commit
    files=$(git diff-tree --no-commit-id --name-only -r $commit)

    # # for each file, check if it is in a target directory
    # for file in $files; do
    #     for target in "${project_targets[@]}"; do
    #         if [[ $file == $target* ]]; then
    #             # append target to targets if it is not already in targets
    #             if [[ ! $targets == *"$target"* ]]; then
    #                 targets="$targets $target"
    #             fi
    #         fi
    #     done
    # done

    echo "FILES:: $files"
done

# echo "TARGETS:: $targets"
