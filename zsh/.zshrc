export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"

plugins=(git npm docker docker-compose colorize colored-man-pages yarn)

source $ZSH/oh-my-zsh.sh
source ${HOME}/.profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh



zstyle ':completion:*:make:*:targets' call-command true # outputs all possible results for make targets
zstyle ':completion:*:make:*' tag-order targets
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'

# fnm
which fnm > /dev/null 2>&1 && {
    eval "$(fnm env)"
}
