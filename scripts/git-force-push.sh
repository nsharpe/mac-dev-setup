#!/bin/bash

BRANCH_NAME="$(git rev-parse --abbrev-ref HEAD)"

BRANCH_NAME=$(tr '[:upper:]' '[:lower:]' <<< "$BRANCH_NAME")

echo $BRANCH_NAME

MASTER_BRANCH="master"

if [ "$BRANCH_NAME" = "$MASTER_BRANCH" ]; then
   echo "This is the master branch, and no force pushing will occur"
   exit 1
fi
