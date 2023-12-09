FROM caddy:2.7.6-builder@sha256:d8035b955de23e12f44abf7675f385b3836bfe3b9baf0701d619b92abf983b60 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:e523a9bc9e19fb96a082b4d83ebae2ce6267f56f2b7b4ac462135ebc51f68e58

COPY --from=builder /usr/bin/caddy /usr/bin/caddy