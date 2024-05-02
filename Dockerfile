FROM caddy:2.7.6-builder@sha256:c684ed61b9173b0b27528dad7fa023a25218f2aa160ca22f003256404e7ae359 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:3c83eb593c903dfac5e896c6647e9a473de4a0c31298f6ab435c1b461f71e03c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy