#!/bin/sh

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# homebrew cask
brew tap caskroom/cask

brew cask install firefox \
                  google-chrome \
                  docker \
                  sublime-text \
                  dropbox \
                  slack \
                  spotify \
                  enpass \
                  iterm2 \
                  keepassx \
                  java \
                  caffeine \
                  karabiner-elements /
                  whatsapp;

brew install byobu \
             vim \
             sbt \
             the_silver_searcher \
             awscli \
             yarn \
             htop \
             stow \
             myrepos;

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
