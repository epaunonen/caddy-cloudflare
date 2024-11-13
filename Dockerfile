FROM caddy:2.8.4-builder@sha256:138e97c388112ddab47cbb63218129902bdb8c99d0be569cb5819d4326d7fa53 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:7d233cf2666671c87563ac17fea15d339c746adf754feb5363ee0bd94d6c0e7b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy