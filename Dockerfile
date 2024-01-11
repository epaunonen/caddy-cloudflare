FROM caddy:2.7.6-builder@sha256:5075ffeca868319ab94e5a25150ed342d08cf4acd422f727359b74038b81ee53 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:bcf45332e3ebd42456f5fe63be2175ebfee971d85c2cd1bd837dd0beb422fa1c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy