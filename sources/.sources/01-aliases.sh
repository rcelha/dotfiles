# General aliases, functions and overrides

alias ...="cd ../.."
alias ..="cd .."
alias grep="grep --exclude-dir=node_modules --color"
alias ls="ls --color=auto"
alias l='ls -Flh --group-directories-first'
alias ll="l -a"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias json_format='python -m json.tool'
alias unstick-gnome-software="killall gnome-software || true && rm -fr ~/.cache/gnome-software"

# MacOsx only aliases and overrides
if [ "$(uname -s)" = "Darwin" ]
then
    alias ls="gls --color=auto"
    alias brave="open -a Brave\ Browser"
    alias chrome="open -a Google\ Chrome"
    # Linux only aliases
else
    alias open=xdg-open
fi

alert() {
    if [ "$(uname -s)" = "Darwin" ]
    then
        osascript -e 'display notification with title "'$1'"'
    else
        notify-send "$1"
    fi
}

which nvim > /dev/null 2>&1 && {
    alias vim=nvim
    alias vi=nvim
}
