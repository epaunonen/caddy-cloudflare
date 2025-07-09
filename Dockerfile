FROM caddy:2.10.0-builder@sha256:c1049babda50461a0ac319425de36ab401e3bfae126359a3b093a1e9a930388e AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.0@sha256:c5876b163e84c44815e2fbba68245367dcf341a15947f80bffffa011bdc90ece

COPY --from=builder /usr/bin/caddy /usr/bin/caddy