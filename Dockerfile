FROM caddy:2.7.6-builder@sha256:534e79de086bdcc6350e63d0ce2e9f706401f0c18bda6d5e85ddb058ab229de8 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:3c83eb593c903dfac5e896c6647e9a473de4a0c31298f6ab435c1b461f71e03c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy