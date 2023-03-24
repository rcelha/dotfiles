for i in ${HOME}/.sources/*; do
    source $i;
done;

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
. "$HOME/.cargo/env"
