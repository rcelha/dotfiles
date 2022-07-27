# General aliases, functions and overrides

alias ...="cd ../.."
alias ..="cd .."
alias grep="grep --exclude-dir=node_modules --color"
alias json_format='python -m json.tool'

which nvim > /dev/null 2>&1 && {
    alias vim=nvim
    alias vi=nvim
}
