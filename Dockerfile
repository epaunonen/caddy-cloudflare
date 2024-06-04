FROM caddy:2.8.4-builder@sha256:a0b3f73d55dd6c54df343d978f2a95c6a27df4db671230a3829eef0179f4f127 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:2fa4835d84fcd04e2d0962939c4551ea83ef48aa0add3f58755f43786fcb58a0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy