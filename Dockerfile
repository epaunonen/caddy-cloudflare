FROM caddy:2.7.6-builder@sha256:6928a0acd02f6587f7b7b53690ca5f70934de0aa053d8566925b317f87ee7fe6 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:245e14283de7392fd14ef9e425580fe689cc0f8eedf28376016dab4109bc76b2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy