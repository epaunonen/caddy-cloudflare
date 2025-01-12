FROM caddy:2.9.1-builder@sha256:3e225bb553d4a38be7a952d007da2ee78c4567b5b4380592041325446eb37420 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:7f0336b2c9930a6d84529303563d65880072938c538a9a7713dbffa0f876c951

COPY --from=builder /usr/bin/caddy /usr/bin/caddy