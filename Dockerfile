FROM caddy:2.8.4-builder@sha256:2c0c92e25b366bd8e612302512c99d03dec66eb3be55a3e9b187cab962770119 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:60199fbf2046892e0aa4b19c7d3adf71f530c36abc65728627422148a75b3475

COPY --from=builder /usr/bin/caddy /usr/bin/caddy