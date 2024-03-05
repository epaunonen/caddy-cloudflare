FROM caddy:2.7.6-builder@sha256:fbb715163e8d79484b0b40ed1c36035efc029153bfd104559bd4ba90a5451ea1 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:2a0d069ea95d91641d201943a5a049e83cbfade8039670aebfb441b132189de6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy