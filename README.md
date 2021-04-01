# aleaf

Shows how to build a VPN app for Android using [leaf](https://github.com/eycorsican/leaf).

## Dependencies

* Rust
* GCC/clang
* Android Studio
* SDK
* NDK

## Building

```
export ANDROID_HOME=/path/to/sdk
export NDK_HOME=/path/to/ndk

rustup target add aarch64-linux-android x86_64-linux-android

git clone --recursive https://github.com/eycorsican/aleaf
cd aleaf

./app/src/main/rust/leaf-android/build.sh
```

Refer [here](https://mozilla.github.io/firefox-browser-architecture/experiments/2017-09-21-rust-on-android.html) for more details.

Please note this is a debug build, you may easily modify the script `./app/src/main/rust/leaf-android/build.sh` to make a release build.

## Limitation

TLS outbound is not working on `x86_64` due to https://github.com/alexcrichton/openssl-probe/issues/8. But it's possible to specify a custom certificate chain via the [`SSL_CERT_FILE`](https://docs.rs/openssl/0.10.33/openssl/ssl/struct.SslConnectorBuilder.html#method.set_default_verify_paths) env var.
