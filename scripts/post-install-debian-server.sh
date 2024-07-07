#!/bin/bash

set -euo pipefail

sudo apt update
sudo apt install -y --no-install-recommends curl

curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sudo sh /tmp/get-docker.sh

# General
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    build-essential \
    caffeine \
    cheese \
    containerd.io \
    docker-buildx-plugin \
    docker-ce \
    docker-ce-cli \
    docker-compose-plugin \
    entr \
    fonts-firacode \
    fzf \
    gcc-multilib \
    git  \
    htop \
    jq \
    keepassxc \
    kitty \
    libbz2-dev \
    libffi-dev \
    libfuse2 \
    liblzma-dev \
    libncurses5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    llvm \
    make \
    myrepos \
    neovim \
    numix-icon-theme \
    numix-icon-theme-circle \
    silversearcher-ag \
    stow \
    tk-dev \
    tmux \
    vim \
    wget \
    xclip \
    xsel \
    xz-utils \
    zlib1g-dev \
    zsh \
    ;

./common-linux.sh
