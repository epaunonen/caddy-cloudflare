FROM caddy:2.8.0-builder@sha256:d047eba8ecebe4f5071b6d6d94b31915d6907c6df7c36b2e706cddf9cac9d3c7 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.0@sha256:5c4cc451b96450e711e40e65789d6e59ee7a0d7a81557fd9ff138828d7cd7047

COPY --from=builder /usr/bin/caddy /usr/bin/caddy