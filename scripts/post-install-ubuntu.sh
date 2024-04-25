#!/bin/bash

set -euo pipefail


# Quick deps for the install script. The bulk of it is on "common-debian.sh"
sudo apt update
sudo apt install -y --no-install-recommends curl

# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
	https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | \
	sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Enpass
echo "deb https://apt.enpass.io/ stable main" | sudo tee /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | sudo apt-key add -

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Syncthing
sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

./common-debian.sh
./common-linux.sh
