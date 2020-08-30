if [ $(which kubectl &> /dev/null) ]; then
    source <(kubectl completion zsh)
fi
