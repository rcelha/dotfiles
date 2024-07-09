export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"

plugins=(git npm docker docker-compose colorize colored-man-pages)

source $ZSH/oh-my-zsh.sh
source ${HOME}/.profile

which fzf > /dev/null && source <(fzf --zsh)

zstyle ':completion:*:make:*:targets' call-command true # outputs all possible results for make targets
zstyle ':completion:*:make:*' tag-order targets
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'

# fnm
which fnm > /dev/null 2>&1 && {
    eval "$(fnm env)"
}

which just > /dev/null 2>&1 && {
    eval "$(just --completions bash)"
}

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /opt/homebrew/bin/tk tk
