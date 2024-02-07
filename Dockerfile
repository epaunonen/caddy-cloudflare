FROM caddy:2.7.6-builder@sha256:a015b58b3e925a07b2e81395300c83b866d88c499f765e2a9131fec32bb73b15 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:245e14283de7392fd14ef9e425580fe689cc0f8eedf28376016dab4109bc76b2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy