#!/bin/sh

set -ex
DOWNLOAD_URL=https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip

if [ -z $ANDROID_HOME ]; then
    echo You need to set the ANDROID_HOME env var
    exit 1;
fi

if [ -z `which java` ]; then
    echo Install java to proceed
    exit 1;
fi;


if [ -z `which yarn` ]; then
    echo Install yarn to proceed
    exit 1;
fi;


sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 build-essential

mkdir -p $ANDROID_HOME
cd $ANDROID_HOME
wget -O android-studio.zip $DOWNLOAD_URL
unzip android-studio.zip

yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses
$ANDROID_HOME/tools/bin/sdkmanager "tools" \
                                   "platform-tools" \
                                   "platforms;android-25" \
                                   "build-tools;25.0.2" \
                                   "extras;android;m2repository" \
                                   "extras;google;m2repository" \
                                   "system-images;android-25;google_apis;x86_64"

echo no | \
$ANDROID_HOME/tools/bin/avdmanager create avd --force --name testAVD --abi google_apis/x86_64 --package 'system-images;android-25;google_apis;x86_64'

yarn global add nativescript
`yarn global bin`/tns doctor

echo Installation done
