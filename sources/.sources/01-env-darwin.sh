if [ $(uname -s) = "Darwin" ]
then
    export PATH=/opt/homebrew/opt/redis@6.2/bin:$PATH
    export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    export PATH="/opt/homebrew/bin:$PATH"
fi

