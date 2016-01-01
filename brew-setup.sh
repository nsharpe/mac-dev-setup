#!/bin/bash

# Install brew if not installed
echo "Installing brew if not installed"
command -v brew >/dev/null 2>&1 || { echo >&2 "Brew is not installed... Installing"; ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";}

echo "Updating Brew"
brew update

# Ensure brew cask is installed.
# This will ensure that items that are downloaded as a dmg will work correctly
if brew list -l | grep -q "brew-cask"; then
    echo "Package brew-cask is already installed"
else
    echo "Installing brew-cask"
    brew install caskroom/cask/brew-cask
fi

BREW_LIST="bash
git
wget
rbenv
ruby-build
coreutils
findutils
ack
awscli
wget
libvpx
docker
docker-machine
docker-compose
cassandra
python
grc
"
CASK_LIST="virtualbox
vagrant
vagrant-manager
google-chrome
suspicious-package
textwrangler
macvim
"

# Install tools that will not require cask
for pkg in $BREW_LIST; do
    if brew list -1 | grep -q "^${pkg}\$"; then
        echo "Package '$pkg' is already installed"
    else
        echo "Installing '$pkg'"
        brew install $pkg
    fi
done

# Install tools that will require cask
for pkg in $CASK_LIST; do
    if brew cask list -1 | grep -q "^${pkg}\$"; then
        echo "Package '$pkg' is already installed"
    else
        echo "Installing '$pkg'"
        brew cask install $pkg
    fi
done
