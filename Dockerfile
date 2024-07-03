FROM caddy:2.8.4-builder@sha256:4034a412b40b413ce61769be5968a9d8ce5bceb02d1cbb851d4d04abdc2b69ea AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:2c7c4a3b9534b34d598a02e7d2be61d3b3355fb77245aea43c27c6d93e09d55f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy