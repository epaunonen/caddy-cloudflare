FROM caddy:2.10.2-builder@sha256:8b4ef1aecb03330cf0532b2785a8f0807d0d1c87127054e533ad25b75df3c224 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2@sha256:3f372402fa8af139e4066b47af07e805748c2aedcee64be77e39e123de76d168

COPY --from=builder /usr/bin/caddy /usr/bin/caddy