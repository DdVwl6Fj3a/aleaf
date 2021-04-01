#!/bin/bash

CWD=`pwd`
BASE=`dirname "$0"`

mkdir -p "$CWD/NDK"

"${NDK_HOME}/build/tools/make_standalone_toolchain.py" --api 26 --arch x86_64 --install-dir "$CWD/NDK/x86_64"
export CARGO_TARGET_X86_64_LINUX_ANDROID_AR="$CWD/NDK/x86_64/bin/x86_64-linux-android-ar"
export CARGO_TARGET_X86_64_LINUX_ANDROID_LINKER="$CWD/NDK/x86_64/bin/x86_64-linux-android-clang"
export PATH="$CWD/NDK/x86_64/bin":$PATH
cargo build --target x86_64-linux-android --manifest-path "$BASE/Cargo.toml" --no-default-features --features "leaf-mobile/default-openssl"
mkdir -p "$BASE/../../jniLibs/x86_64/"
cp "$BASE/target/x86_64-linux-android/debug/libleafandroid.so" "$BASE/../../jniLibs/x86_64/"

"${NDK_HOME}/build/tools/make_standalone_toolchain.py" --api 26 --arch arm64 --install-dir "$CWD/NDK/arm64"
export CARGO_TARGET_AARCH64_LINUX_ANDROID_AR="$CWD/NDK/arm64/bin/aarch64-linux-android-ar"
export CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER="$CWD/NDK/arm64/bin/aarch64-linux-android-clang"
export PATH="$CWD/NDK/arm64/bin":$PATH
cargo build --target aarch64-linux-android --manifest-path "$BASE/Cargo.toml" --no-default-features --features "leaf-mobile/default-ring"
mkdir -p "$BASE/../../jniLibs/arm64-v8a/"
cp "$BASE/target/aarch64-linux-android/debug/libleafandroid.so" "$BASE/../../jniLibs/arm64-v8a/"
