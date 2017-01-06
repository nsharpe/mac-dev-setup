#!/bin/bash

BRANCH_NAME="$(git rev-parse --abbrev-ref HEAD)"

# Pull the latest from master
git checkout master
git pull origin master

# Rebase the current branch ontop of master
git checkout $BRANCH_NAME
pull-master
git rebase master
