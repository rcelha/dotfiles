# General aliases, functions and overrides

if [ "$(uname -s)" = "Darwin" ]
then
    alias ls="gls --color=auto"
else
    alias ls="ls --color=auto"
fi

alias l='ls -Flh --group-directories-first'
alias ll="l -a"
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --exclude-dir=node_modules --color"

json_format () {
    echo ${@} | python -m json.tool
}

alert() {
    if [ "$(uname -s)" = "Darwin" ]
    then
        osascript -e 'display notification with title "'$1'"'
    else
        notify-send "$1"
    fi
}

if [ "$(uname -s)" = "Darwin" ]
then
    alias brave="open -a Brave\ Browser"
    alias chrome="open -a Google\ Chrome"
else
    alias open=xdg-open
fi

which nvim > /dev/null  && {
    alias vim=nvim
    alias vi=nvim
}
