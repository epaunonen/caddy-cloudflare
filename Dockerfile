FROM caddy:2.7.6-builder@sha256:bde4e5db8670c4037861344b37357eac437a771a6d79153c138b316bb8b54d81 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:e523a9bc9e19fb96a082b4d83ebae2ce6267f56f2b7b4ac462135ebc51f68e58

COPY --from=builder /usr/bin/caddy /usr/bin/caddy