FROM caddy:2.7.6-builder@sha256:4c30da281a45faedb6ee9ef827a0b036bb34b9d6e36dea76c1ec8bd86d88ff6e AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:245e14283de7392fd14ef9e425580fe689cc0f8eedf28376016dab4109bc76b2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy