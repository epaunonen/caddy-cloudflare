FROM caddy:2.7.6-builder@sha256:11d1adf0651b0e447069bebb6c7276e49cc8677a24f67a0eecd72710ddc6fd37 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:3c83eb593c903dfac5e896c6647e9a473de4a0c31298f6ab435c1b461f71e03c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy