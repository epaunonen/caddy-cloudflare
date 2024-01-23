FROM caddy:2.7.6-builder@sha256:fcfff8c362098d80c127c395eafbe962780e18f6dbbafb4bfd686f9bed2736c9 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:bcf45332e3ebd42456f5fe63be2175ebfee971d85c2cd1bd837dd0beb422fa1c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy