set -ex;

# General
sudo apt-get update
sudo apt-get install -y \
    ctop \
    curl \
    entr \
    fonts-firacode \
    fzf \
    gcc-multilib \
    git  \
    htop \
    jq \
    myrepos \
    neovim \
    silversearcher-ag \
    stow \
    tmux \
    vim \
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
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir ~/.fnm --skip-shell
~/.fnm/fnm install --lts
~/.fnm/fnm default lts/latest

# Python dev tools
rm -fr ~/.pyenv
curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
pyenv install 3.9.2  # 'unset LDFLAGS' if permission error
pyenv install 3.8.8
pyenv global 3.9.2

python -m pip install --user pipx
python -m pipx ensurepath

curl -sSL https://install.python-poetry.org | python3 -

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y --no-modify-path

# change default shell
chsh -s $(which zsh)
