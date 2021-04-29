set -ex

# General
sudo dnf -y install dnf-plugins-core
sudo dnf install -y \
    curl \
    entr \
    fzf \
    git  \
    htop \
    jq \
    keepassxc \
    kitty \
    logiops \
    myrepos \
    nautilus-dropbox \
    neovim \
    nodejs \
    stow \
    tmux \
    vim-enhanced \
    xclip \
    xsel \
    zsh \
    ;

# TODO fira
# TODO silversearcher-ag
# TODO ctop

# Docker
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io


# Brave
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf -y install brave-browser

# enpass
sudo wget -O /etc/yum.repos.d/enpass-yum.repo https://yum.enpass.io/enpass-yum.repo
sudo dnf -y install enpass

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y --no-modify-path

# change default shell
sudo usermod -s $(which zsh) $USERNAME

# groups
sudo usermod -aG docker rcelha

# oh my zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

# Enable logiops
sudo systemctl enable --now logid
