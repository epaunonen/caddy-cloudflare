FROM caddy:2.7.6-builder@sha256:2954d7c0551d8ffa6f78128fe16faa32b76416b712e06da60c5568817434492f AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:bcf45332e3ebd42456f5fe63be2175ebfee971d85c2cd1bd837dd0beb422fa1c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy