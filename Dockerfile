FROM caddy:2.7.6-builder@sha256:bd81b51a782f1f30f41f01a8852ac6eb56f87d656066b01b059700f71133cd81 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:245e14283de7392fd14ef9e425580fe689cc0f8eedf28376016dab4109bc76b2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy