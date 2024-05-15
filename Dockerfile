FROM caddy:2.7.6-builder@sha256:599f4145971a46caf127b3428eabca3eedb4c3d3267ed57fd128e16c24dd46b0 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:3c83eb593c903dfac5e896c6647e9a473de4a0c31298f6ab435c1b461f71e03c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy