if [ $(uname -s) = "Darwin" ]
then
    alias ls="gls --color=auto"
    alias brave="open -a Brave\ Browser"
    alias chrome="open -a Google\ Chrome"
    alias stat=gstat
    alias jq=gojq
    alias ttime="/usr/bin/time -h"
    alias upgrade-brew="brew update && brew upgrade"

    alert() {
        osascript -e 'display notification with title "'$1'"'
    }
fi
