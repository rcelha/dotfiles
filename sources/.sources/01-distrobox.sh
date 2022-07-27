if [ -f /run/.containerenv ] || [ -f /.dockerenv ]; then
    export distrobox_name=$(uname -n | cut -d'.' -f1)
    export PROMPT="$PROMPT [📦${distrobox_name}] "
    export PS1="$PS1[📦${distrobox_name}] "
    alias xdg-open="distrobox-host-exec /usr/bin/xdg-open"
fi
