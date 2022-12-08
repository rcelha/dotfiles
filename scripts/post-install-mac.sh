#!/bin/sh

set -ex

# homebrew
if [ ! `which brew` ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
brew bundle

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git-lfs install
