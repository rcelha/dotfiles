if [ $(uname -s) = "Darwin" ]
then
    export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
    export PATH="/opt/homebrew/opt/redis@6.2/bin:${PATH}"
    export PATH="/opt/homebrew/opt/openjdk/bin:${PATH}"
    export PATH="/opt/homebrew/bin:${PATH}"
    export LD_LIBRARY_PATH="/opt/homebrew/lib:${LD_LIBRARY_PATH}"
    export CFLAGS="-I/opt/homebrew/include ${CFLAGS}"
    export BINDGEN_EXTRA_CLANG_ARGS="-I/opt/homebrew/include ${BINDGEN_EXTRA_CLANG_ARGS}"
    export BINDGEN_EXTRA_CLANG_ARGS="-L/opt/homebrew/lib ${BINDGEN_EXTRA_CLANG_ARGS}"
fi

