#!/bin/sh

set -ex

export PATH=$PATH:/opt/homebrew/bin/

# homebrew
if [ ! `which brew` ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi;

export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
brew bundle

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git-lfs install
