#!/bin/bash
##
# WARNING: This needs to be run after installing zsh, curl, and docker
##

set -euo pipefail

# change default shell
sudo usermod -s $(which zsh) $USERNAME

# groups
sudo usermod -aG docker $USERNAME

# oh my zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

# Python dev tools
rm -fr ~/.pyenv
curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
pyenv install 3.11-dev
pyenv global 3.11-dev

python -m pip install --user pipx
python -m pipx ensurepath

curl -sSL https://install.python-poetry.org | python3 -

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y --no-modify-path
source "$HOME/.cargo/env"

# Node dev tools
cargo install fnm
fnm install --lts
fnm default lts/latest    

# Keeweb
curl -o ~/.local/bin/keeweb.appimage -L https://github.com/keeweb/keeweb/releases/download/v1.18.7/KeeWeb-1.18.7.linux.AppImage
chmod +x ~/.local/bin/keeweb.appimage
