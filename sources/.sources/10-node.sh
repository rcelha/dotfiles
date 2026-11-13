[ -d ~/.fnm ] && export PATH=$PATH:~/.fnm && eval $(fnm env)

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -d ~/.vite-plus ] && source "$HOME/.vite-plus/env"

# bun completions                                                                   
[ -s "${HOME}/.bun/_bun" ] && source "${HOME}/.bun/_bun"

