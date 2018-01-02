#!/bin/sh

# homebrew
if [ ! `which brew` ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# homebrew cask
brew tap caskroom/cask

brew cask install firefox \
                  google-chrome \
                  docker \
                  sublime-text \
                  dropbox \
                  slack \
                  postman \
                  spotify \
                  enpass \
                  iterm2 \
                  keepassx \
                  java \
                  caffeine \
                  karabiner-elements \
                  steam \
                  aerial \
                  virtualbox \
                  virtualbox-extension-pack \
                  vagrant \
                  dash \
                  whatsapp;

brew install byobu \
             vim \
             sbt \
             the_silver_searcher \
             awscli \
             yarn \
             htop \
             stow \
             zsh \
             myrepos;

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
