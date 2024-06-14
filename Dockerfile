FROM caddy:2.8.4-builder@sha256:66369ac6ee01c3ee6d49774900e3d568c23cdd32f899dcd77c83adb577b1344c AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:60199fbf2046892e0aa4b19c7d3adf71f530c36abc65728627422148a75b3475

COPY --from=builder /usr/bin/caddy /usr/bin/caddy