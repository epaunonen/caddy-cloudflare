FROM caddy:2.9.1-builder@sha256:e1d79fec37283c7a131b6c58be820c44263c118ee69dc0ce6b78a25515f96cc8 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:dd909ed5361bc60e7e27b6f03929cf2b8e15883139cadf14bcdb3dfbea6708b4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy