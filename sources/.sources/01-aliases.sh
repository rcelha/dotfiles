if grep -q darwin <<<$OSTYPE; then
    alias ls="gls --color=auto"
else
    alias ls="ls --color=auto"
fi

alias k=kubectl
alias l='ls -Flh --group-directories-first'
alias ll="l -a"
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --exclude-dir=node_modules --color"

alias httpserver="python -m SimpleHTTPServer"

json_format () {
    echo ${@} | python -m json.tool
}

alert() {
    if grep -q darwin <<<$OSTYPE; then
        osascript -e 'display notification with title "'$1'"'
    fi
}

if grep -q darwin <<<$OSTYPE; then
    alias brave="open -a Brave\ Browser"
    alias chrome="open -a Google\ Chrome"
fi

