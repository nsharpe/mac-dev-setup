#!/bin/bash

mkdir ~/scripts
touch ~/scripts/non_persist.sh

curl https://raw.githubusercontent.com/nsharpe/mac-dev-setup/master/scripts/git-rebase-master.sh > ~/scripts/git-rebase-master.sh

#Saves old .zshrc in case there is an issue.
mv ~/.zshrc ~/.zshrc.old
curl https://raw.githubusercontent.com/nsharpe/mac-dev-setup/master/bash/.bash_profile > ~/.zshrc

chmod 700 ~/scripts/git-rebase-master.sh
