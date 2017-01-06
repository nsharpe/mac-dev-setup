#!/bin/bash

mkdir ~/scripts

curl "https://raw.githubusercontent.com/nsharpe/mac-dev-setup/master/scripts/git-rebase-master.sh" --output "~/scripts/git-rebase-master.sh"

chmod 700 ~/scripts/git-rebase-master.sh
