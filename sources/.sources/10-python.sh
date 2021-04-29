export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

which pyenv > /dev/null 2>&1 && {
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
}

