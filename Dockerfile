FROM caddy:2.7.5-builder@sha256:5b9c67db8969d2d07fbbea52156ed4a9d59c6b20452e5f230c230a686b60c426 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.5@sha256:8ad203c3e138030bb889c2bec51de287a978e9b0c85fb0f884f359ecd4067c4b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy