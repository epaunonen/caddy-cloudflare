FROM caddy:2.8.4-builder@sha256:cb8c55856fd9f99c741a7680f4a5c0cc46966b9f0d8615154ddd775f3156d316 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:6f3eea53e585bd8036028ca703de1c805353b79b43c8b3dd7168ac65827e7ef1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy