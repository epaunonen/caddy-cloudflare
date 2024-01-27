FROM caddy:2.7.6-builder@sha256:21a65a0a75ae568aee31a119e17fcbba1cbad3f5895ba720ef9f8d58326636f2 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:245e14283de7392fd14ef9e425580fe689cc0f8eedf28376016dab4109bc76b2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy