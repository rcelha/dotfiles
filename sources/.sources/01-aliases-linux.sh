if [ "$(uname -s)" = "Linux" ]
then
    alias ls="ls --color=auto"
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
    alias unstick-gnome-software="killall gnome-software || true && rm -fr ~/.cache/gnome-software"

    open() {
        nohup xdg-open $@ > /dev/null 2>&1
    }

    alert() {
        notify-send "$1"
    }
fi
