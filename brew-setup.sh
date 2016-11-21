#!/bin/bash

# Install brew if not installed
echo "Installing brew if not installed"
command -v brew >/dev/null 2>&1 || { echo >&2 "Brew is not installed... Installing"; ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";}

echo "Updating Brew"
brew update

TAP_LIST="caskroom/cask
"

# Install tools that will not require cask
for pkg in $TAP_LIST; do
    if brew tap -1 | grep -q "^${pkg}\$"; then
        echo "Tap '$pkg' is already installed"
    else
        echo "Tapping '$pkg'"
        brew tap $pkg
    fi
done

BREW_LIST="brew-cask
bash
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
grc
"
CASK_LIST="java
keepassx
google-chrome
textwrangler
macvim
mysqlworkbench
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

# Ensure gradle is installed after java
if brew list -1 | grep -q "^gradle\$"; then
    echo "Package 'gradle' is already installed"
  else
    echo "Installing 'gradle'"
    brew install gradle
fi
