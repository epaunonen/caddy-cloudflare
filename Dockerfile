FROM caddy:2.8.4-builder@sha256:4cfb3dbe71fb94e0f96350b190747c9d6c2a18419a5730d54614320328efbf96 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:c6a5f2835a53fd9e2b5e0623dc7ebf0f89c163c21c05cbbc35e4ea31ff424417

COPY --from=builder /usr/bin/caddy /usr/bin/caddy