FROM caddy:2.7.5-builder@sha256:dfd9af513214974c6a77e5e89c7cd3c6d2ddddb226bd21f95118958d47c0c537 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.5@sha256:9eb928f0a3142d0a38e6d457f7696c08c13e070d49d6499cc5b0afe644ecb281

COPY --from=builder /usr/bin/caddy /usr/bin/caddy