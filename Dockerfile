FROM caddy:2.7.6-builder@sha256:7954f9183f22718dfac36955b6cb281466256ae195f30ffcd0229596e2badc66 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:2a0d069ea95d91641d201943a5a049e83cbfade8039670aebfb441b132189de6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy