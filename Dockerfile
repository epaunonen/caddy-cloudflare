FROM caddy:2.8.4-builder@sha256:a4d3fc88cb59901a669edb8a859012baeae7b37565b1c4595cfcaa03d9f17931 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:23203c92c239f04e7580b68af636db6bf1077e02dc41d23ee5c1dd259e4a562f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy