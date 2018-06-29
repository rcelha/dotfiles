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
