FROM caddy:2.8.4-builder@sha256:0ad6668f14eb3b6e12f232284473a07d5afebc3b3e9c6c3b928e4b5c6c97f235 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:2c7c4a3b9534b34d598a02e7d2be61d3b3355fb77245aea43c27c6d93e09d55f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy