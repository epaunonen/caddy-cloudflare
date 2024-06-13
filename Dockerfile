FROM caddy:2.8.4-builder@sha256:fb492c5c699ceb5a0cd99a25034cf910cb9ec22e96da13c62b4beff1c99b248d AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:60199fbf2046892e0aa4b19c7d3adf71f530c36abc65728627422148a75b3475

COPY --from=builder /usr/bin/caddy /usr/bin/caddy