FROM caddy:2.8.4-builder@sha256:6dbb3ea0ac7806d42c18822b90f8cec281b830e333b6b5827f663a693325d551 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:60199fbf2046892e0aa4b19c7d3adf71f530c36abc65728627422148a75b3475

COPY --from=builder /usr/bin/caddy /usr/bin/caddy