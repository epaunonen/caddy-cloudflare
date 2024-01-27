FROM caddy:2.7.6-builder@sha256:3ad890ec13d8726569e5699cc7671255bb132925cac8709caef9d2b140b49baa AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:245e14283de7392fd14ef9e425580fe689cc0f8eedf28376016dab4109bc76b2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy