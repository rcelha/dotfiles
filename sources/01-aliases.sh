alias l="ls -lh"
alias ll="ls -lha"
alias ..="cd .."
alias ...="cd ../.."
alias vim="vim -p"
alias grep="grep --exclude-dir=node_modules --color"

alias httpserver="python -m SimpleHTTPServer"

json_format () {
    echo ${@} | python -m json.tool
}
