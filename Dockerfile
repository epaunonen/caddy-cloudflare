FROM caddy:2.7.6-builder@sha256:089bf0323bacd73b89c9e840c01bbb6fff2f45a50d5a66dd2eb9e9b743ed1ba3 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:d8d3637a26f50bf0bd27a6151d2bd4f7a9f0455936fe7ca2498abbc2e26c841e

COPY --from=builder /usr/bin/caddy /usr/bin/caddy