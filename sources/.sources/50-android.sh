if [ "$(uname -s)" = "Darwin" ]
then
    export ANDROID_HOME=$HOME/Library/Android/sdk
else
    export ANDROID_HOME=$HOME/Android/Sdk
fi

export NDK_HOME="$ANDROID_HOME/ndk/29.0.14206865"
export ANDROID_NDK=$NDK_HOME

export FLUTTER_HOME=$HOME/local/flutter
export CHROME_EXECUTABLE=/opt/brave.com/brave/brave-browser

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$FLUTTER_HOME/bin

