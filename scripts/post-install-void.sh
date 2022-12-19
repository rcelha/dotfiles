#!/bin/sh

set -ex

# General
sudo xbps-install -Suy \
   curl \
   entr \
   fzf \
   git \
   git-lfs \
   delta \
   htop \
   jq \
   kitty \
   neovim \
   nodejs \
   stow \
   tealdeer \
   the_silver_searcher \
   tmux \
   vim-x11 \
   xclip \
   xsel \
   zsh \
   podman \
   podman-compose \
   base-devel \
   openssl-devel \
   ;


# TODO  Brave
# TODO enpass

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y --no-modify-path

# change default shell
sudo usermod -s $(which zsh) $USER

# oh my zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi
