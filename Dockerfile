FROM hello-rocket-builder as builder

WORKDIR /app
COPY . .

RUN cargo build --release --target x86_64-unknown-linux-musl

FROM scratch

# Copy the built static binary from the intermediate image
COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/hello-rocket /hello-rocket
COPY Rocket.toml /Rocket.toml

CMD ["/hello-rocket"]
