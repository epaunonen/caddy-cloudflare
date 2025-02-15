FROM caddy:2.9.1-builder@sha256:242476ee7081eb5604f6f383d312662fbabc3c4c384712d116914933e57cbf2a AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:8e40b65ed7cfb3542e405cda7d73a58b39385ee7111cfae19d5eaa658efd47b9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy