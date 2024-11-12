FROM caddy:2.8.4-builder@sha256:a4d3fc88cb59901a669edb8a859012baeae7b37565b1c4595cfcaa03d9f17931 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:b5154b3538b1eb8f6df79fd9c15614e6ce0efd0ea7c6342047f061db95ac5cda

COPY --from=builder /usr/bin/caddy /usr/bin/caddy