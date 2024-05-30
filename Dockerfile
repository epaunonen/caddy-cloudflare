FROM caddy:2.8.0-builder@sha256:3447ae016402924b97442e3b6eee7579767d0e84c94ef696d60b51f84d811e54 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.0@sha256:0d476cf9b9b3d8875d77f6addbc80f6f2dcb5e470500911c1f32847f8fac929c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy