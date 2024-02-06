FROM caddy:2.7.6-builder@sha256:45a6ebfd01716b24615d6f789fef4981d1ec48a6d51abe676effda862e8f84e0 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:245e14283de7392fd14ef9e425580fe689cc0f8eedf28376016dab4109bc76b2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy