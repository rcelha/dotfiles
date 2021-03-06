set -ex;

# REPOS
## Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

## Java
add-apt-repository -y ppa:webupd8team/java
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

## Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

## Spotify
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo deb http://repository.spotify.com testing non-free | tee /etc/apt/sources.list.d/spotify.list

## Numix icons
add-apt-repository ppa:numix/ppa

# General
apt-get update
apt-get install -y	google-chrome-stable \
                    chromium-browser \
                    chromium-codecs-ffmpeg \
                    skype \
                    vim \
                    byobu \
                    git  \
                    zsh \
                    linux-headers-generic \
                    curl \
                    oracle-java8-set-default \
                    sublime-text \
                    vlc \
                    browser-plugin-vlc \
                    spotify-client \
                    silversearcher-ag \
                    paprefs \
                    caffeine \
                    indicator-cpufreq \
                    myrepos \
                    python-virtualenv \
                    python3-virtualenv \
                    xdotool \
                    keepassx \
                    xsel xclip \
                    htop \
                    numix-icon-theme numix-icon-theme-circle \
                    qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils;

# DUAL-video card stuff
# apt-get install -y glmark2 bumblebee bumblebee-nvidia primus primus-libs-ia32:i386 \

# Docker
wget -qO- https://get.docker.com/ | sh

curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | awk 'NR==1{print $NF}')/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine;
chmod +x /usr/local/bin/docker-machine

# groups
usermod -aG docker rcelha
usermod -aG libvirtd rcelha

# as rcelha
su -c "cd ~ && curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh -" rcelha

# manual: numix nylas slack geary
# ubuntu optionals
# apt install -y nautilus-dropbox numix-gtk-theme unity-tweak-tool keeweb
