#!/bin/sh

set -ex

export PATH=/opt/homebrew/bin/:$PATH
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# homebrew
if [ ! `which brew` ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi;


./install-from-brewfile

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git-lfs install

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y --no-modify-path

curl -LsSf https://astral.sh/uv/install.sh | sh
