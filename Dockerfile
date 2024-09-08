FROM caddy:2.8.4-builder@sha256:5e05b57b569a3b9a19567321e839560e49a559f31442f92f92c411086ce9e190 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:2ae8f7fcd4d82d1c5c1c4dc45ad5f24ab1c1f3af4dd6db03a83d126047d7a939

COPY --from=builder /usr/bin/caddy /usr/bin/caddy