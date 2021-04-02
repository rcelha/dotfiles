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
    entr \
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
    silversearcher-ag \
    stow \
    tmux \
    vim \
    vim-gtk \
    xclip \
    xsel \
    zsh \
    ;

# Build tools
sudo apt-get install --no-install-recommends make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev;

# oh my zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

# FNM
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell
~/.fnm/fnm install v12.20.1
~/.fnm/fnm default v12.20.1

# Python dev tools
curl https://pyenv.run | bash
pyenv install 3.9.2  # 'unset LDFLAGS' if permission error
pyenv install 3.8.8
pyenv global 3.9.2
eval "$(pyenv init -)"

python -m pip install --user pipx
python -m pipx ensurepath

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

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
