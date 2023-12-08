FROM caddy:2.7.6-builder@sha256:9af5029bb79b4498e9c502afda2d543344e7399af02f6801350bd82c90b82922 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:e523a9bc9e19fb96a082b4d83ebae2ce6267f56f2b7b4ac462135ebc51f68e58

COPY --from=builder /usr/bin/caddy /usr/bin/caddy