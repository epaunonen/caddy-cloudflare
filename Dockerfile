FROM caddy:2.9.1-builder@sha256:8d36ec89c6a433669dcca365176c679ea2d45b7e3659d4a4766456508d1e31d0 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:948b33a1ec78d0eb22c39dd6543de3647c215f823277fe9529f73a847d920102

COPY --from=builder /usr/bin/caddy /usr/bin/caddy