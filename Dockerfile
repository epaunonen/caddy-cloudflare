FROM caddy:2.9.1-builder@sha256:57f45106467c6368822bf1bd20b335b3c41102212d350e813a691f8978151814 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:116bea95dd70e611b4b46f5fc0fc931aa1b2acc75c0e8903c88a93a713d57e6d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy