FROM caddy:2.7.6-builder@sha256:52b96e26a80a1694b7195f1be152643f7a27b85d1b809e38f7b4d2def10a03a1 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:2a0d069ea95d91641d201943a5a049e83cbfade8039670aebfb441b132189de6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy