FROM caddy:2.8.4-builder@sha256:1397c58d870760cd5d06b27bc1103716afcf561df3e89f69eb2c532417633cb4 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:2c7c4a3b9534b34d598a02e7d2be61d3b3355fb77245aea43c27c6d93e09d55f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy