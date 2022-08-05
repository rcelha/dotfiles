if [ $(uname -s) = "Darwin" ]
then
    alias ls="gls --color=auto"
    alias brave="open -a Brave\ Browser"
    alias chrome="open -a Google\ Chrome"

    alert() {
        osascript -e 'display notification with title "'$1'"'
    }
fi