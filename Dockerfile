FROM caddy:2.8.4-builder@sha256:351052cf9e8c1ac6b9f7bb35f913e59cb45230d82835906e93d19e3e84af02c6 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:07417b42b03b8929ec80240d1a83e27a9c1346ddbff65988608fd1757269c1eb

COPY --from=builder /usr/bin/caddy /usr/bin/caddy