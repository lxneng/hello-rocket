FROM rust:1.51.0-slim-buster as builder

# Install build essentials
RUN apt-get update && apt-get install -y make pkg-config libssl-dev ca-certificates musl-tools wget

# Set up rust MUSL target
# (https://doc.rust-lang.org/edition-guide/rust-2018/platform-and-target-support/musl-support-for-fully-static-binaries.html)
RUN rustup override set nightly
RUN rustup target add x86_64-unknown-linux-musl

WORKDIR /app
COPY . .

RUN cargo build --release --target x86_64-unknown-linux-musl
