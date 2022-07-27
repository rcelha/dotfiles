if [ "$(uname -s)" = "Darwin" ]
then
    export ANDROID_HOME=$HOME/Library/Android/sdk
else
    export ANDROID_HOME=$HOME/.android-sdk
fi

export FLUTTER_HOME=$HOME/snap/flutter/common/flutter

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$FLUTTER_HOME/bin

