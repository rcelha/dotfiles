# General aliases, functions and overrides

# Enables alias expansion for watch"
alias watch="watch "
alias ...="cd ../.."
alias ..="cd .."
alias grep="grep --exclude-dir=node_modules --color"
alias json_format='python -m json.tool'
alias l="ls -lh"
alias ll="ls -lha"
alias t="tree --gitignore"

# which nvim > /dev/null 2>&1 && {
#     alias vim=nvim
#     alias vi=nvim
# }

alias ifconfig::me="curl ifconfig.me/all.json | jq"

kitty::reload() {
    kill -SIGUSR1 $(pgrep -a kitty)
}
