FROM caddy:2.8.1-builder@sha256:37acf9e88ea74ef051bc1ec68ea9abd535320ea4eea1a0162aaf378ee5200a3c AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.1@sha256:7414db60780a20966cd9621d1dcffcdcef060607ff32ddbfde2a3737405846c4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy