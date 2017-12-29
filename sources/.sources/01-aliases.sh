if grep -q darwin <<<$OSTYPE; then
    alias ls="gls --color=auto"
else
    alias ls="ls --color=auto"
fi

alias l='ls -Flh --group-directories-first'
alias ll="l -a"
alias ..="cd .."
alias ...="cd ../.."
alias vim="vim -p"
alias grep="grep --exclude-dir=node_modules --color"

alias httpserver="python -m SimpleHTTPServer"

json_format () {
    echo ${@} | python -m json.tool
}


export NVM_DIR=$HOME/.nvm
load_nvm () {
    if [ -s "$NVM_DIR/nvm.sh" ]; then
        . "$NVM_DIR/nvm.sh" && . "$NVM_DIR/bash_completion"
    fi;
}
alias nvm='unalias nvm && load_nvm'
