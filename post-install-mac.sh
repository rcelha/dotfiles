#!/bin/sh
# homebrew

# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew tap caskroom/cask

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
                  whatsapp;

brew install byobu \
             vim \
             sbt \
             the_silver_searcher \
             myrepos;

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
