[ -d ~/.fnm ] && export PATH=$PATH:~/.fnm && eval $(fnm env)

# bun completions
[ -s "/Users/rodrigo.alves/.bun/_bun" ] && source "/Users/rodrigo.alves/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
