FROM caddy:2.7.6-builder@sha256:a8053d86bad595f8230e02939f9504243321790577a8cb899a30d5587c40c217 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:974407b7478ac5cd13d4bf66423c86ce7e863e59673fc78a6f1efc6dee2fd117

COPY --from=builder /usr/bin/caddy /usr/bin/caddy