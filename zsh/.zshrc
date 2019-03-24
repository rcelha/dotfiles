export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"
export NVM_LAZY_LOAD=true

plugins=(git npm docker-compose colorize colored-man-pages yarn zsh-nvm)

source $ZSH/oh-my-zsh.sh
source ${HOME}/.profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
