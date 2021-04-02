export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

which pyenv > /dev/null  && {
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
}

