FROM caddy:2.8.4-builder@sha256:62a63f27175da4481927333c7d3d8c59e29a2307a0b183b645ddfd6f79d03b7b AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:2c7c4a3b9534b34d598a02e7d2be61d3b3355fb77245aea43c27c6d93e09d55f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy