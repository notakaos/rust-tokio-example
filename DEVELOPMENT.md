# DEVELOPMENT NOTE

## Setup

```sh
rustup update
rustup component list --installed
rustup component add rustfmt clippy rust-src rls rust-analysis
cargo install cargo-watch cargo-edit
# repl
cargo install evcxr_repl
```

```sh
cargo new rust-tokio-example
cd rust-tokio-example
```

## tokio

<https://github.com/tokio-rs/tokio>

```sh
cargo add tokio --features full
```