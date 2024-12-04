FROM caddy:2.8.4-builder@sha256:c8020407380f0fd3cbd91545e16c1016cf447a56e35a9260de022f6053eda986 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:07417b42b03b8929ec80240d1a83e27a9c1346ddbff65988608fd1757269c1eb

COPY --from=builder /usr/bin/caddy /usr/bin/caddy