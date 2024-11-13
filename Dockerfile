FROM caddy:2.8.4-builder@sha256:a55a78f46e30bd6cc090fd9936669d7793b05e356f1382d13df5b3960ed99d31 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:6f3eea53e585bd8036028ca703de1c805353b79b43c8b3dd7168ac65827e7ef1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy