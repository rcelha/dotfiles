export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# POETRY NOW INSTALL TO ~/.local/bin
# export PATH="$HOME/.poetry/bin:$PATH"

which pyenv > /dev/null 2>&1 && {
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
}

