export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"

plugins=(git npm docker docker-compose colorize colored-man-pages yarn)

source $ZSH/oh-my-zsh.sh
source ${HOME}/.profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ /Users/rodrigocorrea/.local/bin/kubectl ]; then source <(kubectl completion zsh); fi

# fnm
eval "$(fnm env --multi)"
