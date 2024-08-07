FROM caddy:2.8.4-builder@sha256:1d94bd7aa85b4d8bd987fc97c3e9396dc8fb8e7dc7a25ad5d951ff848e488bc2 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:b8c90e126558630ac99b6df3daf4aa261e80dd0bd28f8b4882be4f31d783706d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy