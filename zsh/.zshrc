export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"

plugins=(git npm docker docker-compose colorize colored-man-pages yarn)

source $ZSH/oh-my-zsh.sh
source ${HOME}/.profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zstyle ':completion:*:make:*:targets' call-command true # outputs all possible results for make targets
zstyle ':completion:*:make:*' tag-order targets
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'

# fnm
eval "$(fnm env --multi)"
