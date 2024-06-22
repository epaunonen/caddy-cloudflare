FROM caddy:2.8.4-builder@sha256:e959d6e99dc227c536f28ea8f14d76741b473e0b0c1ce272c1004ea1a23f0000 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:ee0d86cbcbc88f4dc3e048ba998166fd4afd04b5edd45f7c082a1607d1190717

COPY --from=builder /usr/bin/caddy /usr/bin/caddy