#!/bin/bash

export NDK_HOME=~/Android/Sdk/ndk/25.2.9519653
export GOOS=android
export CGO_ENABLED=1

STRIP=$NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-strip

if [ $1 == 'x64' ]; then
export GOARCH=amd64
export CC=$NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/x86_64-linux-android28-clang
elif [ $1 == 'x86' ]; then
export GOARCH=386
export CC=$NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/i686-linux-android28-clang
elif [ $1 == 'arm' ]; then
export GOARCH=arm
export GOARM=7
export CC=$NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/armv7a-linux-androideabi28-clang
else
export GOARCH=arm64
export CC=$NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android28-clang
fi

go build -o out/$1/libddns-go.so
$STRIP out/$1/libddns-go.so
