FROM caddy:2.7.6-builder@sha256:bc132795543c02200c1e69e7a2c20bfd64d9440b079addacbc66ab2554228a46 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:ce43091c481420028215c752115f25e501155b055ae9f4862bae373bda4c1308

COPY --from=builder /usr/bin/caddy /usr/bin/caddy