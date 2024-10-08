set -ex

# General
sudo dnf -y install dnf-plugins-core
sudo dnf install -y \
    curl \
    entr \
    git  \
    git-delta \
    htop \
    jetbrains-mono-fonts-all \
    jq \
    keepassxc \
    kitty \
    logiops \
    myrepos \
    nodejs \
    stow \
    tealdeer \
    the_silver_searcher \
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
sudo systemctl enable --now docker


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
sudo usermod -aG docker $USERNAME

# oh my zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

# Configure and Enable logiops
sudo cp logid.cfg /etc/logid.cfg
sudo systemctl enable --now logid
