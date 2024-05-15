FROM caddy:2.7.6-builder@sha256:ec21027eb5b49d3676aa79706a806190577dc769962f6b6e7c5a6ce7905d669b AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:3c83eb593c903dfac5e896c6647e9a473de4a0c31298f6ab435c1b461f71e03c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy