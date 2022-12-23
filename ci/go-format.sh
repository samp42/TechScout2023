#!/bin/bash
go_files=$(find ../ScoutAPI -name '*.go')

read -d ' ' -a tokens <<< "$go_files"

for token in "${tokens[@]}"; do
    result=$(gofmt -l "$token")
    
    if [ "$result" != "" ]; then
        # some files are not formatted properly, exit with error
        echo "Some files are not formatted properly, please run `go fmt` in /ScoutAPI"
        exit 1
    fi

done