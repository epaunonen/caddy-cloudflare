FROM caddy:2.8.4-builder@sha256:dcd7aa31f3512617d0a801b1299ac40e677e3b8c13cf27ea05c32406c179f980 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:4b192bcff3499aa887e3a0e99cb1773f3502e72389e4bb1699cae4af2938f45e

COPY --from=builder /usr/bin/caddy /usr/bin/caddy