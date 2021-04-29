which kubectl > /dev/null 2>&1  && {
    source <(kubectl completion zsh)
}

alias k=kubectl
