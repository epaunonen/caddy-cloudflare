FROM caddy:2.8.0-builder@sha256:f3dca62c95c12e38837b5ea25662d575bf5eae8aa3f8a8a079a151e34eb931a6 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.0@sha256:2f73fa2a8c6ca5020ab4f101ce6735e183be6176ab8df4ec4620aa5fbaebaf20

COPY --from=builder /usr/bin/caddy /usr/bin/caddy