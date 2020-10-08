set -ex;

# General
sudo apt-get update
sudo apt-get install -y \
    caffeine \
    cheese \
    ctop \
    curl \
    docker-compose \
    docker.io \
    dropbox \
    fonts-firacode \
    fzf \
    gcc-multilib \
    git  \
    htop \
    indicator-cpufreq \
    jq \
    keepassxc \
    kitty \
    myrepos \
    numix-icon-theme \
    numix-icon-theme-circle \
    pipenv \
    silversearcher-ag \
    stow \
    tmux \
    vim \
    vim-gtk \
    virtualbox \
    virtualbox-ext-pack \
    xclip \
    xsel \
    zsh \
    ;

# oh my zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

# FNM
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell
~/.fnm/fnm install "latest-erbium"
~/.fnm/fnm default "latest-erbium"

# Brave
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | \
    sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | \
    sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update
sudo apt install -y brave-browser

# enpass
echo "deb https://apt.enpass.io/ stable main" | sudo tee /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | sudo apt-key add -

sudo apt-get update
sudo apt-get -y install enpass

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y --no-modify-path

# change default shell
chsh -s $(which zsh)

# groups
sudo usermod -aG docker rcelha
