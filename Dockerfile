FROM caddy:2.7.5-builder@sha256:b94d3fcd6716230d3255c418016c002f5c95a4ae9bc1aa5304738538abada624 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.5@sha256:325f81ca0328db0737503a53f43717fce79ea0c574e83f8e586c8d350cadf34b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy