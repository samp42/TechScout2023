#!/bin/bash

commits=$(git log --format=%H main..$1)


read -d ' ' -a tokens <<< "$commits"

echo "Commits: $commits"
