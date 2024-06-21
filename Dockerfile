FROM caddy:2.8.4-builder@sha256:29fa730e023e699e0b0bfc87d0285a0e03ea03c86a2593838f585ac8317bf276 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:83d99edad2f0ac5e52068e065e42bd40c4ff7465a8f582482566c9d48350663a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy