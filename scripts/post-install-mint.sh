set -ex;

# General
sudo apt-get update
sudo apt-get install -y \
	vim \
	git  \
	tmux \
	zsh \
	curl \
	silversearcher-ag \
	caffeine \
	indicator-cpufreq \
	myrepos \
	keepassxc \
	xsel xclip \
	htop \
	numix-icon-theme \
	numix-icon-theme-circle \
	kitty stow jq ctop cheese fzf;

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

# change default shell
chsh -s $(which zsh)
