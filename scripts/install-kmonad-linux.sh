#!/bin/sh

set -exu

mkdir -p ~/local/bin
docker build -t kmonad-builder github.com/kmonad/kmonad.git
docker run -d --rm --name kmonad-builder kmonad-builder
docker cp kmonad-builder:/root/.local/bin/kmonad ./
install ./kmonad ~/local/bin
docker stop kmonad-builder
rm ./kmonad
