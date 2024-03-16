FROM caddy:2.7.6-builder@sha256:1d553a0e2a89aa23aebfc82419a5e3fcf7693ae9ab0d5e68b1886930095e204d AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:f0a636cea3e3e8766d86d120a6d71512c151c968c83539859bb995f3552ab345

COPY --from=builder /usr/bin/caddy /usr/bin/caddy