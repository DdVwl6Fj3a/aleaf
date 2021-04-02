# aleaf

Shows how to build a VPN app for Android using [leaf](https://github.com/eycorsican/leaf).

## Dependencies

* Rust
* GCC/clang
* Make
* SDK
* NDK

## Building

```
export ANDROID_HOME=/path/to/sdk
export NDK_HOME=/path/to/sdk/ndk-bundle

rustup target add aarch64-linux-android x86_64-linux-android

git clone --recursive https://github.com/eycorsican/aleaf
cd aleaf

./app/src/main/rust/leaf-android/build.sh debug
```

Refer [here](https://mozilla.github.io/firefox-browser-architecture/experiments/2017-09-21-rust-on-android.html) and [here](https://github.com/eycorsican/aleaf/blob/master/.github/workflows/ci.yml) for more details.

## Limitation

TLS outbound is not working on `x86_64` due to this [issue](https://github.com/alexcrichton/openssl-probe/issues/8). But it's possible to specify a custom certificate chain via the [`SSL_CERT_FILE`](https://docs.rs/openssl/0.10.33/openssl/ssl/struct.SslConnectorBuilder.html#method.set_default_verify_paths) env var.
