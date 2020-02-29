#!/bin/zsh

# Install brew if not installed
echo "Installing brew if not installed"
command -v brew >/dev/null 2>&1 || { echo >&2 "Brew is not installed... Installing"; ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";}

echo "Updating Brew"
brew update

TAP_LIST=('AdoptOpenJDK/openjdk')

# Tapping casks
for pkg in $TAP_LIST; do
    if brew tap | grep -q "^${pkg}\$"; then
        echo "Tap '$pkg' is already installed"
    else
        echo "Tapping '$pkg'"
        brew tap $pkg
    fi
done

BREW_LIST=(
'bash'
'git'
'wget'
'coreutils'
'findutils'
'ack'
'awscli'
'wget'
'libvpx'
'grc'
'jsonlint'
'pssh')

CASK_LIST=('keepassx'
'google-chrome'
'bbedit'
'macvim'
'mysqlworkbench'
'adoptopenjdk'
'adoptopenjdk8'
'postman')

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


INSTALL_AFTER_CASK_LIST=('gradle'
'maven')

# Install tools that will not require cask
for pkg in $INSTALL_AFTER_CASK_LIST; do
    if brew list -1 | grep -q "^${pkg}\$"; then
        echo "Package '$pkg' is already installed"
    else
        echo "Installing '$pkg'"
        brew install $pkg
    fi
done

#configuring mvim
curl https://raw.githubusercontent.com/nsharpe/mac-dev-setup/master/bash/.vimrc > ~.vimrc

