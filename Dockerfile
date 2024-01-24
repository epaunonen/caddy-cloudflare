FROM caddy:2.7.6-builder@sha256:01419b47f38a2ecf38113496366cb7efa85aef57d3a115d38a5fbc896c471e55 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:bcf45332e3ebd42456f5fe63be2175ebfee971d85c2cd1bd837dd0beb422fa1c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy