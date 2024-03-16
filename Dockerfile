FROM caddy:2.7.6-builder@sha256:297a97b4f8f3f4467bcf9cfd5a6f5ba5bcfa38be56824c82e2c4f1c029701f8b AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:ce43091c481420028215c752115f25e501155b055ae9f4862bae373bda4c1308

COPY --from=builder /usr/bin/caddy /usr/bin/caddy